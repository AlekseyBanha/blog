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

function upsertPost(array $data, int $postTemplateId, int $tvImage, int $tvCategory, int $tvTags): int
{
    $doc = null;
    if (!empty($data['id'])) {
        $doc = \EvolutionCMS\Models\SiteContent::query()->find($data['id']);
    }
    if (!$doc && !empty($data['alias'])) {
        $doc = \EvolutionCMS\Models\SiteContent::query()
            ->where('alias', $data['alias'])
            ->where('parent', 5)
            ->first();
    }
    if (!$doc) {
        $doc = new \EvolutionCMS\Models\SiteContent();
    }

    $doc->pagetitle = $data['pagetitle'];
    $doc->longtitle = $data['pagetitle'];
    $doc->menutitle = '';
    $doc->alias = $data['alias'];
    $doc->introtext = $data['introtext'];
    $doc->content = $data['content'];
    $doc->template = $postTemplateId;
    $doc->parent = 5;
    $doc->isfolder = 0;
    $doc->published = 1;
    $doc->deleted = 0;
    $doc->hidemenu = 1;
    $doc->menuindex = $data['menuindex'];
    $doc->publishedon = $data['publishedon'];
    $doc->save();

    $id = (int) $doc->id;
    setTvValue($id, $tvImage, $data['image']);
    setTvValue($id, $tvCategory, $data['category']);
    setTvValue($id, $tvTags, $data['tags']);

    return $id;
}

function upsertSlide(
    array $data,
    int $bannerParentId,
    int $slideTemplateId,
    int $tvImage,
    int $tvCategory,
    int $tvSlideUrl
): int {
    $doc = \EvolutionCMS\Models\SiteContent::query()
        ->where('alias', $data['alias'])
        ->where('parent', $bannerParentId)
        ->first();
    if (!$doc) {
        $doc = new \EvolutionCMS\Models\SiteContent();
    }

    $doc->pagetitle = $data['pagetitle'];
    $doc->longtitle = $data['pagetitle'];
    $doc->menutitle = '';
    $doc->alias = $data['alias'];
    $doc->introtext = '';
    $doc->content = '';
    $doc->template = $slideTemplateId;
    $doc->parent = $bannerParentId;
    $doc->isfolder = 0;
    $doc->published = 1;
    $doc->deleted = 0;
    $doc->hidemenu = 1;
    $doc->menuindex = $data['menuindex'];
    $doc->publishedon = $data['publishedon'];
    $doc->save();

    $id = (int) $doc->id;
    setTvValue($id, $tvImage, $data['image']);
    setTvValue($id, $tvCategory, $data['category']);
    setTvValue($id, $tvSlideUrl, (string) $data['slide_url']);

    return $id;
}

$tplHome = <<<'HTML'
<!DOCTYPE html>
<html lang="uk">
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
        &parents=`BANNER_PARENT`
        &depth=`1`
        &display=`12`
        &orderBy=`menuindex ASC`
        &tvList=`image,category,slide_url`
        &dateSource=`publishedon`
        &dateFormat=`%d.%m.%Y`
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
              &dateFormat=`%d.%m.%Y`
              &tpl=`dl/postHome`
              &prepare=`preparePost`
              &noneWrapOuter=`0`
            ]]
            <div class="col-lg-12">
              <div class="main-button">
                <a href="[~5~]">Усі статті</a>
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
<html lang="uk">
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
              &dateFormat=`%d.%m.%Y`
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
<html lang="uk">
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
            <h4>Деталі маршруту</h4>
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
                    <li>Екскурсовод</li>
                    <li>[*publishedon:date=`%d.%m.%Y`*]</li>
                    <li><i class="fa fa-eye"></i> [*views*] переглядів</li>
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
                          <li><a href="https://www.facebook.com/ukraine_forever" target="_blank" rel="noopener noreferrer">Facebook</a>,</li>
                          <li><a href="https://x.com/ukraine_forever" target="_blank" rel="noopener noreferrer"> Twitter</a></li>
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
<html lang="uk">
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

// Banner folder (manual home slider) — created early so Home DocLister can reference it
$bannerFolder = \EvolutionCMS\Models\SiteContent::query()
    ->where('alias', 'banner')
    ->where('parent', 0)
    ->first();
if (!$bannerFolder) {
    $bannerFolder = new \EvolutionCMS\Models\SiteContent();
    $bannerFolder->alias = 'banner';
}
$bannerFolder->pagetitle = 'Слайдер';
$bannerFolder->longtitle = 'Слайди головного банера';
$bannerFolder->menutitle = 'Слайдер';
$bannerFolder->parent = 0;
$bannerFolder->isfolder = 1;
$bannerFolder->published = 1;
$bannerFolder->deleted = 0;
$bannerFolder->hidemenu = 1;
$bannerFolder->menuindex = 99;
$bannerFolder->content = '';
$bannerFolder->template = 0;
$bannerFolder->save();
$bannerId = (int) $bannerFolder->id;

$tplHome = str_replace('BANNER_PARENT', (string) $bannerId, $tplHome);

$tplSlide = '<!-- Слайд банера: редагуйте заголовок, TV image / category / slide_url. Порядок — menuindex. -->';

$homeId = upsertTemplate('Home', $tplHome, 'Головна сторінка блогу', 1);
$blogId = upsertTemplate('Blog', $tplBlog, 'Список статей із бічною панеллю', 2);
$postId = upsertTemplate('Post', $tplPost, 'Сторінка окремої статті');
$pageId = upsertTemplate('Page', $tplPage, 'Статичні сторінки (Про нас, Контакти)');
$slideId = upsertTemplate('Slide', $tplSlide, 'Слайд головного банера');

\EvolutionCMS\Models\SiteTemplate::query()->whereKey($homeId)->update(['templatealias' => 'home']);
\EvolutionCMS\Models\SiteTemplate::query()->whereKey($blogId)->update(['templatealias' => 'blog']);
\EvolutionCMS\Models\SiteTemplate::query()->whereKey($postId)->update(['templatealias' => 'post_details']);
\EvolutionCMS\Models\SiteTemplate::query()->whereKey($pageId)->update(['templatealias' => 'page']);

$tvImage = upsertTv('image', 'Зображення', 'image');
$tvCategory = upsertTv('category', 'Категорія', 'text', 'Карпати');
$tvTags = upsertTv('tags', 'Теги', 'text', 'Подорожі, Україна');
$tvSlideUrl = upsertTv('slide_url', 'Посилання слайда (URL або ID ресурсу)', 'text', '');
$tvViews = upsertTv('views', 'Перегляди', 'number', '0');

attachTv($tvImage, [$homeId, $blogId, $postId, $slideId]);
attachTv($tvCategory, [$postId, $slideId]);
attachTv($tvTags, [$postId]);
attachTv($tvSlideUrl, [$slideId]);
attachTv($tvViews, [$postId]);

$bannerFolder->template = $slideId;
$bannerFolder->save();

// Settings
$modx->getDatabase()->query("REPLACE INTO {$prefix}system_settings (setting_name, setting_value) VALUES ('site_start', '1')");
$modx->getDatabase()->query("REPLACE INTO {$prefix}system_settings (setting_name, setting_value) VALUES ('default_template', '{$postId}')");
$modx->getDatabase()->query("REPLACE INTO {$prefix}system_settings (setting_name, setting_value) VALUES ('error_page', '1')");
$modx->getDatabase()->query("REPLACE INTO {$prefix}system_settings (setting_name, setting_value) VALUES ('unauthorized_page', '1')");
$modx->getDatabase()->query("REPLACE INTO {$prefix}system_settings (setting_name, setting_value) VALUES ('site_name', 'Блог Українських Екскурсоводів')");

$now = time();

// Home
$home = \EvolutionCMS\Models\SiteContent::query()->find(1);
if ($home) {
    $home->pagetitle = 'Головна';
    $home->longtitle = 'Блог Українських Екскурсоводів';
    $home->menutitle = 'Головна';
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
    $blog->pagetitle = 'Маршрути Україною';
    $blog->longtitle = 'Останні статті';
    $blog->menutitle = 'Маршрути';
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
    [
        'id' => 6,
        'pagetitle' => 'Говерла — найвища вершина України',
        'alias' => 'hoverla',
        'introtext' => 'Підкоріть Говерлу — символ українських Карпат. Маршрут підходить і новачкам, і досвідченим мандрівникам.',
        'content' => '<p>Говерла (2061 м) — найвища гора України, розташована в Чорногірському хребті. З вершини відкривається панорама на Чорногору, Петрос і полонини Закарпаття.</p><p>Найзручніший старт — з курорту Драгобрат або з села Лазещина. У гарну погоду підйом займає 3–5 годин. Обовʼязково візьміть теплу куртку, воду та трекінгове взуття: погода в горах змінюється швидко.</p><p>Найкращий сезон — з кінця травня до жовтня. Узимку маршрут потребує досвіду та спорядження. На вершині варто залишити кілька хвилин тиші — і зробити фото на згадку про справжню карпатську пригоду.</p>',
        'image' => 'assets/images/ua-hoverla.jpg',
        'category' => 'Карпати',
        'tags' => 'Говерла, Гори, Трекінг',
        'menuindex' => 0,
        'publishedon' => $now - 86400 * 1,
    ],
    [
        'id' => 7,
        'pagetitle' => 'Озеро Синевир — перлина Закарпаття',
        'alias' => 'synevyr',
        'introtext' => 'Найбільше гірське озеро Українських Карпат зачаровує кольором води й легендами про кохання.',
        'content' => '<p>Синевир називають «Морським оком Карпат». Озеро лежить на висоті близько 989 м у Національному природному парку «Синевир» і оточене смерековими лісами.</p><p>До озера зручно дістатися з Міжгірʼя. Навколо — екологічні стежки, оглядові майданчики та центр реабілітації бурих ведмедів. Вода холодна навіть улітку, тож купання — лише для найсміливіших.</p><p>Приїжджайте рано вранці: туман над гладдю води створює майже казковий краєвид. Не забудьте фотоапарат і термос із чаєм — після прогулянки лісом він стане в пригоді.</p>',
        'image' => 'assets/images/ua-synevyr.jpg',
        'category' => 'Озера та річки',
        'tags' => 'Синевир, Закарпаття, Озера',
        'menuindex' => 1,
        'publishedon' => $now - 86400 * 3,
    ],
    [
        'id' => 8,
        'pagetitle' => 'Камʼянець-Подільська фортеця',
        'alias' => 'kamianets-podilskyi',
        'introtext' => 'Один із наймальовничіших замків України стоїть на скелястому острові, оточеному петлею річки Смотрич.',
        'content' => '<p>Камʼянець-Подільська фортеця — візитівка Поділля й одна з найкраще збережених оборонних споруд країни. Камʼяні башти, мости й глибокий каньйон Смотрича створюють краєвид, який легко впізнати навіть із поштових листівок.</p><p>Огляньте Старе місто, Польську й Вірменську брами, підніміться на башти фортеці та пройдіть міст, що веде до цитаделі. Увечері підсвітка робить камʼяні стіни особливо драматичними.</p><p>Поруч варто відвідати каньйон Смотрича й панорами з оглядових майданчиків. Фортеця ідеально пасує для одноденної поїздки або вікенду з нічлігом у старому місті.</p>',
        'image' => 'assets/images/ua-kamianets.jpg',
        'category' => 'Фортеці та замки',
        'tags' => 'Фортеця, Поділля, Історія',
        'menuindex' => 2,
        'publishedon' => $now - 86400 * 5,
    ],
    [
        'id' => 9,
        'pagetitle' => 'Софіївка в Умані — сад, як поезія',
        'alias' => 'sofiyivka',
        'introtext' => 'Національний дендропарк «Софіївка» — шедевр садово-паркового мистецтва серед мальовничих схилів Черкащини.',
        'content' => '<p>«Софіївку» закладено наприкінці XVIII століття на честь Софії Потоцької. Гроти, водоспади, штучні озера й античні альтанки створюють атмосферу європейського парку романтизму.</p><p>Найкраще гуляти зранку або пізно вдень, коли менше відвідувачів і мʼякше світло для фото. Обовʼязкові локації — Нижній став, Грот Венери, Каліпсо та Центральна алея.</p><p>Парк цікавий у будь-яку пору року: навесні — цвітіння, улітку — прохолода біля води, восени — золоте листя. Це ідеальний маршрут для сімейної подорожі та спокійного відпочинку серед природи.</p>',
        'image' => 'assets/images/ua-sofiyivka.jpg',
        'category' => 'Парки та заповідники',
        'tags' => 'Софіївка, Умань, Парки',
        'menuindex' => 3,
        'publishedon' => $now - 86400 * 7,
    ],
    [
        'id' => 10,
        'pagetitle' => 'Київські пагорби й краєвиди Дніпра',
        'alias' => 'kyiv-hills',
        'introtext' => 'Столиця відкривається з пагорбів: Володимирська гірка, Андріївський узвіз і набережна Дніпра.',
        'content' => '<p>Київ побудований на пагорбах, і саме звідси місто виглядає найвиразніше. Почніть із Володимирської гірки, спустіться Андріївським узвозом до Подолу, а звідти вийдіть до набережної Дніпра.</p><p>Уздовж маршруту — Андріївська церква, контрасти старої й нової архітектури, каштани й широкі панорами на лівий берег. У золоту годину місто особливо фотогенічне.</p><p>Для довшої прогулянки додайте Печерськ, Маріїнський парк і міст пішоходів. Київський маршрут легко адаптувати і для короткої прогулянки, і для цілого дня відкриттів.</p>',
        'image' => 'assets/images/ua-kyiv.jpg',
        'category' => 'Міські маршрути',
        'tags' => 'Київ, Дніпро, Місто',
        'menuindex' => 4,
        'publishedon' => $now - 86400 * 9,
    ],
    [
        'pagetitle' => 'Львів: площа Ринок і дахи старого міста',
        'alias' => 'lviv-rynok',
        'introtext' => 'Серце Галичини — бруківка, кавʼярні й панорами з оглядових веж історичного центру.',
        'content' => '<p>Площа Ринок — точка, з якої зручно починати будь-яку львівську прогулянку. Ратуша, камʼяниці з різними фасадами, дворики й вузькі вулички ведуть до Оперного театру, Високого Замку та Личаківського цвинтаря.</p><p>Підніміться на вежу ратуші або на Високий Замок — звідти відкривається класичний краєвид на дахи старого міста. Увечері площа оживає музикою й світлом кавʼярень.</p><p>Львів варто досліджувати повільно: між музеями залишайте час на каву по-львівськи та випадкові дворики. Саме в деталях місто розкривається найкраще.</p>',
        'image' => 'assets/images/ua-lviv.jpg',
        'category' => 'Міські маршрути',
        'tags' => 'Львів, Галичина, Архітектура',
        'menuindex' => 5,
        'publishedon' => $now - 86400 * 11,
    ],
    [
        'pagetitle' => 'Одеса й Чорноморське узбережжя',
        'alias' => 'odesa-sea',
        'introtext' => 'Морське повітря, Потьомкінські сходи й довгі пляжі — класика південного маршруту Україною.',
        'content' => '<p>Одеса зустрічає широкими бульварами, колоритом Приморського бульвару та видом на Чорне море з Потьомкінських сходів. Місто легко поєднує історію, море й гастрономію.</p><p>Після прогулянки центром вирушайте на Аркадію або Ланжерон. У сезон тут багато життя, а в міжсезоння узбережжя дарує спокійніші краєвиди й довгі прогулянки вздовж хвиль.</p><p>Додайте до маршруту Одеський оперний театр, Дерибасівську та порт. Одеса — про настрій: трохи сонця, трохи солоного вітру й багато історій на кожному розі.</p>',
        'image' => 'assets/images/ua-odesa.jpg',
        'category' => 'Чорноморське узбережжя',
        'tags' => 'Одеса, Море, Пляж',
        'menuindex' => 6,
        'publishedon' => $now - 86400 * 13,
    ],
    [
        'pagetitle' => 'Хотинська фортеця над Дністром',
        'alias' => 'khotyn-fortress',
        'introtext' => 'Могутні мури Хотина височіють над Дністром і зберігають памʼять про великі битви Європи.',
        'content' => '<p>Хотинська фортеця — один із найпотужніших оборонних комплексів України. Її вежі й мури стоять на високому березі Дністра, а краєвид довкола нагадує декорації до історичного фільму.</p><p>Усередині комплексу можна пройти подвірʼям, піднятися на стіни й уявити масштаб подій XVII століття. Поруч — мальовничі схили й річкові панорами, ідеальні для фото.</p><p>Зручно поєднувати з Камʼянцем-Подільським у один вікенд-маршрут Поділлям. Хотин особливо вражає на заході сонця, коли камінь набуває теплого відтінку.</p>',
        'image' => 'assets/images/ua-khotyn.jpg',
        'category' => 'Фортеці та замки',
        'tags' => 'Хотин, Дністер, Фортеця',
        'menuindex' => 7,
        'publishedon' => $now - 86400 * 15,
    ],
    [
        'pagetitle' => 'Шацькі озера та кришталевий Світязь',
        'alias' => 'shatsk-svityaz',
        'introtext' => 'На Волині розкинувся край блакитних озер, головне з яких — прозоре озеро Світязь.',
        'content' => '<p>Шацький національний природний парк обʼєднує десятки озер. Найвідоміше — Світязь: широке, світле, з водою, у якій видно дно на кілька метрів.</p><p>Тут добре купатися, кататися на велосипеді між озерами, спостерігати птахів і зустрічати світанки на березі. Інфраструктура розвинена, тож маршрут підходить і для сімейного відпочинку.</p><p>Окрім Світязя, загляньте до озер Пісочне й Луки. Шаччина — це про тишу, воду й відчуття, ніби Україна має власне «внутрішнє море».</p>',
        'image' => 'assets/images/ua-shatsk.jpg',
        'category' => 'Озера та річки',
        'tags' => 'Світязь, Волинь, Озера',
        'menuindex' => 8,
        'publishedon' => $now - 86400 * 17,
    ],
    [
        'pagetitle' => 'Драгобрат — високогірʼя Карпат',
        'alias' => 'dragobrat',
        'introtext' => 'Найвищий гірськолижний курорт України влітку стає базою для походів на Близницю та полонини.',
        'content' => '<p>Драгобрат розташований на висоті понад 1300 м і відкриває доступ до мальовничих хребтів Свидовця. Узимку сюди їдуть кататися, улітку — гуляти полонинами й підніматися на Близницю.</p><p>Повітря тут прохолодне навіть у липні, а краєвиди змінюються з кожним поворотом стежки. Ночуйте в готелі чи колибі, щоб зустріти світанок над хмарами.</p><p>Це чудова точка старту для багатоденних маршрутів Карпатами. Візьміть шари одягу, зручне взуття й запасіться часом — Драгобрат не любить поспіху.</p>',
        'image' => 'assets/images/ua-dragobrat.jpg',
        'category' => 'Карпати',
        'tags' => 'Драгобрат, Свидовець, Гори',
        'menuindex' => 9,
        'publishedon' => $now - 86400 * 19,
    ],
    [
        'pagetitle' => 'Скелі Довбуша: стежки серед камʼяних велетнів',
        'alias' => 'skeli-dovbusha',
        'introtext' => 'У лісах Івано-Франківщини ховаються скелі, оповиті легендами про опришка Олексу Довбуша.',
        'content' => '<p>Скелі Довбуша — унікальний скельний комплекс і популярний екотуристичний маршрут біля Бубнища. Піщаникові брили утворюють коридори, печери й оглядові майданчики серед густого лісу.</p><p>Маршрут відносно доступний, але місцями потребує обережності: сходи, вузькі проходи й вологий камінь. Історичний шар легенд про Довбуша додає місцю особливої атмосфери.</p><p>Ідеально для одноденної поїздки з Івано-Франківська чи зі Львова. Після скель можна продовжити день у Карпатах — наприклад, у напрямку Татарова чи Буковеля.</p>',
        'image' => 'assets/images/ua-dovbush.jpg',
        'category' => 'Парки та заповідники',
        'tags' => 'Довбуш, Скелі, Прикарпаття',
        'menuindex' => 10,
        'publishedon' => $now - 86400 * 21,
    ],
];

$keptAliases = [];
$postIdsByAlias = [];
foreach ($posts as $data) {
    $id = upsertPost($data, $postId, $tvImage, $tvCategory, $tvTags);
    $keptAliases[] = $data['alias'];
    $postIdsByAlias[$data['alias']] = $id;
    echo "Post #{$id}: {$data['pagetitle']}\n";
}

// Unpublish any other posts under blog folder that are not in the new set
\EvolutionCMS\Models\SiteContent::query()
    ->where('parent', 5)
    ->where('deleted', 0)
    ->whereNotIn('alias', $keptAliases)
    ->update(['published' => 0, 'deleted' => 1]);

// Home banner slides (manual CMS objects under «Слайдер»)
$slides = [
    [
        'alias' => 'slide-hoverla',
        'pagetitle' => 'Говерла — найвища вершина України',
        'image' => 'assets/images/ua-hoverla.jpg',
        'category' => 'Карпати',
        'slide_url' => (string) ($postIdsByAlias['hoverla'] ?? ''),
        'menuindex' => 0,
        'publishedon' => $now - 86400 * 1,
    ],
    [
        'alias' => 'slide-synevyr',
        'pagetitle' => 'Озеро Синевир — перлина Закарпаття',
        'image' => 'assets/images/ua-synevyr.jpg',
        'category' => 'Озера та річки',
        'slide_url' => (string) ($postIdsByAlias['synevyr'] ?? ''),
        'menuindex' => 1,
        'publishedon' => $now - 86400 * 3,
    ],
    [
        'alias' => 'slide-kamianets',
        'pagetitle' => 'Камʼянець-Подільська фортеця',
        'image' => 'assets/images/ua-kamianets.jpg',
        'category' => 'Фортеці та замки',
        'slide_url' => (string) ($postIdsByAlias['kamianets-podilskyi'] ?? ''),
        'menuindex' => 2,
        'publishedon' => $now - 86400 * 5,
    ],
    [
        'alias' => 'slide-sofiyivka',
        'pagetitle' => 'Софіївка в Умані — сад, як поезія',
        'image' => 'assets/images/ua-sofiyivka.jpg',
        'category' => 'Парки та заповідники',
        'slide_url' => (string) ($postIdsByAlias['sofiyivka'] ?? ''),
        'menuindex' => 3,
        'publishedon' => $now - 86400 * 7,
    ],
    [
        'alias' => 'slide-kyiv',
        'pagetitle' => 'Київські пагорби й краєвиди Дніпра',
        'image' => 'assets/images/ua-kyiv.jpg',
        'category' => 'Міські маршрути',
        'slide_url' => (string) ($postIdsByAlias['kyiv-hills'] ?? ''),
        'menuindex' => 4,
        'publishedon' => $now - 86400 * 9,
    ],
    [
        'alias' => 'slide-lviv',
        'pagetitle' => 'Львів: площа Ринок і дахи старого міста',
        'image' => 'assets/images/ua-lviv.jpg',
        'category' => 'Міські маршрути',
        'slide_url' => (string) ($postIdsByAlias['lviv-rynok'] ?? ''),
        'menuindex' => 5,
        'publishedon' => $now - 86400 * 11,
    ],
];

$keptSlideAliases = [];
foreach ($slides as $slide) {
    $sid = upsertSlide($slide, $bannerId, $slideId, $tvImage, $tvCategory, $tvSlideUrl);
    $keptSlideAliases[] = $slide['alias'];
    echo "Slide #{$sid}: {$slide['pagetitle']}\n";
}

\EvolutionCMS\Models\SiteContent::query()
    ->where('parent', $bannerId)
    ->where('deleted', 0)
    ->whereNotIn('alias', $keptSlideAliases)
    ->update(['published' => 0, 'deleted' => 1]);

// About
$about = \EvolutionCMS\Models\SiteContent::query()->where('alias', 'about')->first();
if (!$about) {
    $about = new \EvolutionCMS\Models\SiteContent();
    $about->alias = 'about';
}
$about->pagetitle = 'трохи про нас';
$about->longtitle = 'про нас';
$about->menutitle = 'Про нас';
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
        <img src="assets/images/about-us.jpg" alt="Про нас">
        <p>Блог Українських Екскурсоводів — це зібрання маршрутів, краєвидів і цікавих місць України. Ми збираємо ідеї для подорожей горами, озерами, фортецями та містами.</p>
        <p>Наша мета — допомогти мандрівникам відкривати країну глибше: від Говерли й Синевира до Львова, Одеси та каньйонів Поділля.</p>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-6">
        <h4>Що ви знайдете в статтях</h4>
        <p>Короткі описи маршрутів, практичні поради, найкращі сезони для візиту та атмосферні фотографії українських локацій.</p>
      </div>
      <div class="col-lg-6">
        <h4>Для кого цей блог</h4>
        <p>Для самостійних мандрівників, сімей і всіх, хто шукає натхнення для наступної подорожі Україною.</p>
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
$contact->pagetitle = "зв'яжімося!";
$contact->longtitle = 'контакти';
$contact->menutitle = 'Контакти';
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
                  <h2>Напишіть нам</h2>
                </div>
                <div class="content">
                  <form id="contact" action="" method="post">
                    <div class="row">
                      <div class="col-md-6 col-sm-12">
                        <fieldset>
                          <input name="name" type="text" id="name" placeholder="Ваше ім'я" required>
                        </fieldset>
                      </div>
                      <div class="col-md-6 col-sm-12">
                        <fieldset>
                          <input name="email" type="text" id="email" placeholder="Ваш email" required>
                        </fieldset>
                      </div>
                      <div class="col-md-12 col-sm-12">
                        <fieldset>
                          <input name="subject" type="text" id="subject" placeholder="Тема">
                        </fieldset>
                      </div>
                      <div class="col-lg-12">
                        <fieldset>
                          <textarea name="message" rows="6" id="message" placeholder="Ваше повідомлення" required></textarea>
                        </fieldset>
                      </div>
                      <div class="col-lg-12">
                        <fieldset>
                          <button type="submit" id="form-submit" class="main-button">Надіслати</button>
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
                  <h2>контактна інформація</h2>
                </div>
                <div class="content">
                  <ul>
                    <li>
                      <h5>+380 44 000 00 00</h5>
                      <span>ТЕЛЕФОН</span>
                    </li>
                    <li>
                      <h5>info@ua-guides.local</h5>
                      <span>EMAIL</span>
                    </li>
                    <li>
                      <h5>м. Київ,<br>вул. Хрещатик, 1</h5>
                      <span>АДРЕСА</span>
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
          <iframe src="https://maps.google.com/maps?q=Kyiv,+Ukraine&t=&z=12&ie=UTF8&iwloc=&output=embed" width="100%" height="450px" frameborder="0" style="border:0" allowfullscreen></iframe>
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
echo "Templates: Home={$homeId}, Blog={$blogId}, Post={$postId}, Page={$pageId}, Slide={$slideId}\n";
echo "Banner folder id={$bannerId}\n";
echo "About id={$about->id}, Contact id={$contact->id}\n";
echo "Posts: " . count($keptAliases) . ", Slides: " . count($keptSlideAliases) . "\n";
