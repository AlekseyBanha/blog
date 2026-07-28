<?php
/**
 * One-shot blog theme installer for Evolution CMS.
 * Run: php core/custom/packages/main/setup-blog.php
 */

define('MODX_API_MODE', true);

require dirname(__DIR__, 4) . '/index.php';

$modx = evo();
$prefix = $modx->getDatabase()->getConfig('prefix');

function upsertTemplate(string $name, string $content, string $description = '', ?int $id = null): int
{
    $tpl = null;
    if ($id) {
        $tpl = \EvolutionCMS\Models\SiteTemplate::query()->find($id);
    }
    if (!$tpl) {
        $tpl = \EvolutionCMS\Models\SiteTemplate::query()->where('templatename', $name)->first();
    }
    if (!$tpl) {
        $tpl = new \EvolutionCMS\Models\SiteTemplate();
    }
    $tpl->templatename = $name;
    $tpl->description = $description;
    $tpl->content = $content;
    $tpl->save();
    return (int) $tpl->id;
}

function upsertTv(string $name, string $caption, string $type, string $default = ''): int
{
    $tv = \EvolutionCMS\Models\SiteTmplvar::query()->where('name', $name)->first();
    if (!$tv) {
        $tv = new \EvolutionCMS\Models\SiteTmplvar();
        $tv->name = $name;
    }
    $tv->caption = $caption;
    $tv->type = $type;
    $tv->default_text = $default;
    $tv->save();
    return (int) $tv->id;
}

function attachTv(int $tvId, array $templateIds): void
{
    foreach ($templateIds as $i => $templateId) {
        $exists = \EvolutionCMS\Models\SiteTmplvarTemplate::query()
            ->where('tmplvarid', $tvId)
            ->where('templateid', $templateId)
            ->exists();
        if (!$exists) {
            \EvolutionCMS\Models\SiteTmplvarTemplate::query()->insert([
                'tmplvarid' => $tvId,
                'templateid' => $templateId,
                'rank' => $i,
            ]);
        }
    }
}

function setTvValue(int $docId, int $tvId, string $value): void
{
    $row = \EvolutionCMS\Models\SiteTmplvarContentvalue::query()
        ->where('contentid', $docId)
        ->where('tmplvarid', $tvId)
        ->first();
    if (!$row) {
        $row = new \EvolutionCMS\Models\SiteTmplvarContentvalue();
        $row->contentid = $docId;
        $row->tmplvarid = $tvId;
    }
    $row->value = $value;
    $row->save();
}

$tplHome = <<<'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
{{head}}
</head>
<body>
{{preloader}}
{{header}}

<div class="main-banner header-text">
  <div class="container-fluid">
    <div class="owl-banner owl-carousel">
      [[DocLister?
        &parents=`5`
        &depth=`1`
        &display=`6`
        &orderBy=`publishedon DESC`
        &tvList=`image,category,tags`
        &dateSource=`publishedon`
        &dateFormat=`%B %d, %Y`
        &tpl=`dl/banner`
        &prepare=`preparePost`
        &noneWrapOuter=`0`
      ]]
    </div>
  </div>
</div>

{{cta}}

<section class="blog-posts">
  <div class="container">
    <div class="row">
      <div class="col-lg-8">
        <div class="all-blog-posts">
          <div class="row">
            [[DocLister?
              &parents=`5`
              &depth=`1`
              &display=`3`
              &orderBy=`publishedon DESC`
              &tvList=`image,category,tags`
              &dateSource=`publishedon`
              &dateFormat=`%B %d, %Y`
              &tpl=`dl/postHome`
              &prepare=`preparePost`
              &noneWrapOuter=`0`
            ]]
            <div class="col-lg-12">
              <div class="main-button">
                <a href="[~5~]">View All Posts</a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-4">
        {{sidebar}}
      </div>
    </div>
  </div>
</section>

{{footer}}
</body>
</html>
HTML;

$tplBlog = <<<'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
{{head}}
</head>
<body>
{{preloader}}
{{header}}

<div class="heading-page header-text">
  <section class="page-heading">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="text-content">
            <h4>[*longtitle*]</h4>
            <h2>[*pagetitle*]</h2>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

{{cta}}

<section class="blog-posts grid-system">
  <div class="container">
    <div class="row">
      <div class="col-lg-8">
        <div class="all-blog-posts">
          <div class="row">
            [!DocLister?
              &parents=`[*id*]`
              &depth=`1`
              &display=`6`
              &orderBy=`publishedon DESC`
              &tvList=`image,category,tags`
              &dateSource=`publishedon`
              &dateFormat=`%B %d, %Y`
              &tpl=`dl/postGrid`
              &prepare=`preparePost`
              &paginate=`pages`
              &TplPages=`dl/pages`
              &TplPage=`dl/page`
              &TplCurrentPage=`dl/current`
              &TplNextP=`dl/next`
              &TplPrevP=`dl/prev`
              &noneWrapOuter=`0`
            !]
            <div class="col-lg-12">
              [+pages+]
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-4">
        {{sidebar}}
      </div>
    </div>
  </div>
</section>

{{footer}}
</body>
</html>
HTML;

$tplPost = <<<'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
{{head}}
</head>
<body>
{{preloader}}
{{header}}

<div class="heading-page header-text">
  <section class="page-heading">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="text-content">
            <h4>Post Details</h4>
            <h2>[*pagetitle*]</h2>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

{{cta}}

<section class="blog-posts grid-system">
  <div class="container">
    <div class="row">
      <div class="col-lg-8">
        <div class="all-blog-posts">
          <div class="row">
            <div class="col-lg-12">
              <div class="blog-post">
                <div class="blog-thumb">
                  <img src="[*image*]" alt="[*pagetitle*]">
                </div>
                <div class="down-content">
                  <span>[*category*]</span>
                  <a href="[~[*id*]~]"><h4>[*pagetitle*]</h4></a>
                  <ul class="post-info">
                    <li><a href="#">Admin</a></li>
                    <li><a href="#">[*publishedon:date=`%B %d, %Y`*]</a></li>
                  </ul>
                  [*content*]
                  <div class="post-options">
                    <div class="row">
                      <div class="col-6">
                        <ul class="post-tags">
                          <li><i class="fa fa-tags"></i></li>
                          <li>[*tags*]</li>
                        </ul>
                      </div>
                      <div class="col-6">
                        <ul class="post-share">
                          <li><i class="fa fa-share-alt"></i></li>
                          <li><a href="#">Facebook</a>,</li>
                          <li><a href="#"> Twitter</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-4">
        {{sidebar}}
      </div>
    </div>
  </div>
</section>

{{footer}}
</body>
</html>
HTML;

$tplPage = <<<'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
{{head}}
</head>
<body>
{{preloader}}
{{header}}

<div class="heading-page header-text">
  <section class="page-heading">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="text-content">
            <h4>[*longtitle*]</h4>
            <h2>[*pagetitle*]</h2>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

[*content*]

{{footer}}
</body>
</html>
HTML;

$homeId = upsertTemplate('Home', $tplHome, 'Stand Blog homepage', 1);
$blogId = upsertTemplate('Blog', $tplBlog, 'Blog listing with sidebar', 2);
$postId = upsertTemplate('Post', $tplPost, 'Single blog post');
$pageId = upsertTemplate('Page', $tplPage, 'Static pages (About, Contact)');

\EvolutionCMS\Models\SiteTemplate::query()->whereKey($homeId)->update(['templatealias' => 'home']);
\EvolutionCMS\Models\SiteTemplate::query()->whereKey($blogId)->update(['templatealias' => 'blog']);
\EvolutionCMS\Models\SiteTemplate::query()->whereKey($postId)->update(['templatealias' => 'post_details']);
\EvolutionCMS\Models\SiteTemplate::query()->whereKey($pageId)->update(['templatealias' => 'page']);

$tvImage = upsertTv('image', 'Image', 'image');
$tvCategory = upsertTv('category', 'Category', 'text', 'Lifestyle');
$tvTags = upsertTv('tags', 'Tags', 'text', 'Blog, Creative');

attachTv($tvImage, [$homeId, $blogId, $postId]);
attachTv($tvCategory, [$postId]);
attachTv($tvTags, [$postId]);

// Settings
$modx->getDatabase()->query("REPLACE INTO {$prefix}system_settings (setting_name, setting_value) VALUES ('site_start', '1')");
$modx->getDatabase()->query("REPLACE INTO {$prefix}system_settings (setting_name, setting_value) VALUES ('default_template', '{$postId}')");
$modx->getDatabase()->query("REPLACE INTO {$prefix}system_settings (setting_name, setting_value) VALUES ('error_page', '1')");
$modx->getDatabase()->query("REPLACE INTO {$prefix}system_settings (setting_name, setting_value) VALUES ('unauthorized_page', '1')");
$modx->getDatabase()->query("REPLACE INTO {$prefix}system_settings (setting_name, setting_value) VALUES ('site_name', 'Stand Blog')");

$now = time();

// Home
$home = \EvolutionCMS\Models\SiteContent::query()->find(1);
if ($home) {
    $home->pagetitle = 'Home';
    $home->longtitle = 'Stand Blog';
    $home->menutitle = 'Home';
    $home->alias = 'index';
    $home->template = $homeId;
    $home->menuindex = 0;
    $home->hidemenu = 0;
    $home->published = 1;
    $home->isfolder = 0;
    $home->parent = 0;
    $home->content = '';
    $home->save();
}

// Blog folder
$blog = \EvolutionCMS\Models\SiteContent::query()->find(5);
if ($blog) {
    $blog->pagetitle = 'Our Recent Blog Entries';
    $blog->longtitle = 'Recent Posts';
    $blog->menutitle = 'Blog Entries';
    $blog->alias = 'blog';
    $blog->template = $blogId;
    $blog->menuindex = 2;
    $blog->hidemenu = 0;
    $blog->published = 1;
    $blog->isfolder = 1;
    $blog->parent = 0;
    $blog->content = '';
    $blog->save();
}

$posts = [
    6 => [
        'pagetitle' => 'Best Template Website for HTML CSS',
        'alias' => 'best-template-website',
        'introtext' => 'Stand Blog is a free HTML CSS template for your CMS theme. You can easily adapt or customize it for any kind of CMS or website builder.',
        'content' => '<p>Stand Blog is a free HTML CSS template for your CMS theme. You can easily adapt or customize it for any kind of CMS or website builder. You are allowed to use it for your business.</p><p>Nullam at quam ut lacus aliquam tempor vel sed ipsum. Donec pellentesque tincidunt imperdiet. Mauris sit amet justo vulputate, cursus massa congue, vestibulum odio.</p>',
        'image' => 'images/blog-post-01.jpg',
        'category' => 'Lifestyle',
        'tags' => 'Beauty, Nature',
        'menuindex' => 0,
        'publishedon' => $now - 86400 * 1,
    ],
    7 => [
        'pagetitle' => 'Etiam id diam vitae lorem dictum',
        'alias' => 'etiam-id-diam-vitae-lorem-dictum',
        'introtext' => 'You can support us by contributing a little via PayPal. If you have any question or feedback about this template, feel free to talk to us.',
        'content' => '<p>You can support us by contributing a little via PayPal. If you have any question or feedback about this template, feel free to talk to us.</p><p>Also, you may check other CSS templates such as multi-page, resume, video, and more layouts from TemplateMo.</p>',
        'image' => 'images/blog-post-02.jpg',
        'category' => 'Healthy',
        'tags' => 'Best Templates, TemplateMo',
        'menuindex' => 1,
        'publishedon' => $now - 86400 * 3,
    ],
    8 => [
        'pagetitle' => 'Donec tincidunt leo nec magna',
        'alias' => 'donec-tincidunt-leo-nec-magna',
        'introtext' => 'Nullam at quam ut lacus aliquam tempor vel sed ipsum. Donec pellentesque tincidunt imperdiet.',
        'content' => '<p>Nullam at quam ut lacus aliquam tempor vel sed ipsum. Donec pellentesque tincidunt imperdiet. Mauris sit amet justo vulputate, cursus massa congue, vestibulum odio.</p><p>Aenean elit nunc, gravida in erat sit amet, feugiat viverra leo. Phasellus interdum, diam commodo egestas rhoncus, turpis nisi consectetur nibh.</p>',
        'image' => 'images/blog-post-03.jpg',
        'category' => 'Fashion',
        'tags' => 'HTML CSS, Photoshop',
        'menuindex' => 2,
        'publishedon' => $now - 86400 * 5,
    ],
    9 => [
        'pagetitle' => 'Vestibulum id turpis porttitor sapien',
        'alias' => 'vestibulum-id-turpis-porttitor-sapien',
        'introtext' => 'Nullam nibh mi, tincidunt sed sapien ut, rutrum hendrerit velit. Integer auctor a mauris sit amet eleifend.',
        'content' => '<p>Nullam nibh mi, tincidunt sed sapien ut, rutrum hendrerit velit. Integer auctor a mauris sit amet eleifend.</p><p>Mauris sit amet justo vulputate, cursus massa congue, vestibulum odio. Aenean elit nunc, gravida in erat sit amet.</p>',
        'image' => 'images/blog-thumb-04.jpg',
        'category' => 'Nature',
        'tags' => 'Lifestyle, Creative',
        'menuindex' => 3,
        'publishedon' => $now - 86400 * 7,
    ],
    10 => [
        'pagetitle' => 'Suspendisse et metus nec libero',
        'alias' => 'suspendisse-et-metus-nec-libero',
        'introtext' => 'Nullam nibh mi, tincidunt sed sapien ut, rutrum hendrerit velit. Integer auctor a mauris sit amet eleifend.',
        'content' => '<p>Suspendisse et metus nec libero ultrices varius eget in risus. Cras id nibh at erat pulvinar malesuada et non ipsum.</p><p>Donec tincidunt leo nec magna gravida varius. Vivamus facilisis dignissim arcu et blandit.</p>',
        'image' => 'images/blog-thumb-05.jpg',
        'category' => 'Lifestyle',
        'tags' => 'Inspiration, Motivation',
        'menuindex' => 4,
        'publishedon' => $now - 86400 * 9,
    ],
];

foreach ($posts as $id => $data) {
    $doc = \EvolutionCMS\Models\SiteContent::query()->find($id);
    if (!$doc) {
        continue;
    }
    $doc->pagetitle = $data['pagetitle'];
    $doc->longtitle = $data['pagetitle'];
    $doc->menutitle = '';
    $doc->alias = $data['alias'];
    $doc->introtext = $data['introtext'];
    $doc->content = $data['content'];
    $doc->template = $postId;
    $doc->parent = 5;
    $doc->isfolder = 0;
    $doc->published = 1;
    $doc->hidemenu = 1;
    $doc->menuindex = $data['menuindex'];
    $doc->publishedon = $data['publishedon'];
    $doc->save();

    setTvValue($id, $tvImage, $data['image']);
    setTvValue($id, $tvCategory, $data['category']);
    setTvValue($id, $tvTags, $data['tags']);
}

// About
$about = \EvolutionCMS\Models\SiteContent::query()->where('alias', 'about')->first();
if (!$about) {
    $about = new \EvolutionCMS\Models\SiteContent();
    $about->alias = 'about';
}
$about->pagetitle = 'more about us!';
$about->longtitle = 'about us';
$about->menutitle = 'About Us';
$about->template = $pageId;
$about->parent = 0;
$about->isfolder = 0;
$about->published = 1;
$about->hidemenu = 0;
$about->menuindex = 1;
$about->content = <<<'HTML'
<section class="about-us">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <img src="images/about-us.jpg" alt="About us">
        <p>Welcome to Stand Blog on Evolution CMS. This page is editable from the manager — change the content, image and headings anytime.</p>
        <p>Pellentesque quis luctus libero. Maecenas pretium molestie erat, ac tincidunt leo gravida ac. Cras ullamcorper eu ipsum eu sollicitudin. Fusce vitae commodo turpis.</p>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-6">
        <h4>Two-One Donec porttitor augue</h4>
        <p>Quisque bibendum cursus viverra. Mauris at ex ipsum. Aenean condimentum urna nisl, eget interdum ante euismod vel.</p>
      </div>
      <div class="col-lg-6">
        <h4>Two-Two Donec porttitor augue</h4>
        <p>Maecenas et metus nisl. Morbi ac interdum metus. Aliquam erat volutpat. Donec posuere tortor vel volutpat consequat.</p>
      </div>
    </div>
  </div>
</section>
HTML;
$about->save();

// Contact
$contact = \EvolutionCMS\Models\SiteContent::query()->where('alias', 'contact')->first();
if (!$contact) {
    $contact = new \EvolutionCMS\Models\SiteContent();
    $contact->alias = 'contact';
}
$contact->pagetitle = "let's stay in touch!";
$contact->longtitle = 'contact us';
$contact->menutitle = 'Contact Us';
$contact->template = $pageId;
$contact->parent = 0;
$contact->isfolder = 0;
$contact->published = 1;
$contact->hidemenu = 0;
$contact->menuindex = 3;
$contact->content = <<<'HTML'
<section class="contact-us">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="down-contact">
          <div class="row">
            <div class="col-lg-8">
              <div class="sidebar-item contact-form">
                <div class="sidebar-heading">
                  <h2>Send us a message</h2>
                </div>
                <div class="content">
                  <form id="contact" action="" method="post">
                    <div class="row">
                      <div class="col-md-6 col-sm-12">
                        <fieldset>
                          <input name="name" type="text" id="name" placeholder="Your name" required>
                        </fieldset>
                      </div>
                      <div class="col-md-6 col-sm-12">
                        <fieldset>
                          <input name="email" type="text" id="email" placeholder="Your email" required>
                        </fieldset>
                      </div>
                      <div class="col-md-12 col-sm-12">
                        <fieldset>
                          <input name="subject" type="text" id="subject" placeholder="Subject">
                        </fieldset>
                      </div>
                      <div class="col-lg-12">
                        <fieldset>
                          <textarea name="message" rows="6" id="message" placeholder="Your Message" required></textarea>
                        </fieldset>
                      </div>
                      <div class="col-lg-12">
                        <fieldset>
                          <button type="submit" id="form-submit" class="main-button">Send Message</button>
                        </fieldset>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="sidebar-item contact-information">
                <div class="sidebar-heading">
                  <h2>contact information</h2>
                </div>
                <div class="content">
                  <ul>
                    <li>
                      <h5>090-484-8080</h5>
                      <span>PHONE NUMBER</span>
                    </li>
                    <li>
                      <h5>info@company.com</h5>
                      <span>EMAIL ADDRESS</span>
                    </li>
                    <li>
                      <h5>123 Aenean id posuere dui,<br>Praesent laoreet 10660</h5>
                      <span>STREET ADDRESS</span>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-12">
        <div id="map">
          <iframe src="https://maps.google.com/maps?q=Av.+L%C3%BAcio+Costa,+Rio+de+Janeiro+-+RJ,+Brazil&t=&z=13&ie=UTF8&iwloc=&output=embed" width="100%" height="450px" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>
      </div>
    </div>
  </div>
</section>
HTML;
$contact->save();

// Remove obsolete DB chunks (file-based now)
\EvolutionCMS\Models\SiteHtmlsnippet::query()->whereIn('name', ['blog_header', 'blog_footer', 'blog_sidebar'])->delete();

// Clear cache
$modx->clearCache('full');

echo "Blog theme installed.\n";
echo "Templates: Home={$homeId}, Blog={$blogId}, Post={$postId}, Page={$pageId}\n";
echo "About id={$about->id}, Contact id={$contact->id}\n";
