<?php namespace EvolutionCMS\Main\Controllers;

use EvolutionCMS\Models\SiteContent;

class BaseController
{
    public $evo;
    public $data = [];

    public function __construct()
    {
        $this->evo = evo();
        $this->globalElements();
        $this->render();
        $this->noCacheRender();
        $this->sendToView();
    }

    public function render()
    {
    }

    public function noCacheRender()
    {
    }

    public function globalElements()
    {
        $this->data['doc'] = $this->evo->documentObject;
        $this->data['siteName'] = $this->evo->getConfig('site_name', 'Stand Blog');
        $this->data['homeUrl'] = $this->evo->makeUrl((int) $this->evo->getConfig('site_start'));
        $this->data['blogUrl'] = $this->evo->makeUrl(5);
        $this->data['menu'] = $this->getMenu();
        $this->data['recentPosts'] = $this->getPosts(3);
        $this->data['categories'] = [
            'Nature Lifestyle',
            'Awesome Layouts',
            'Creative Ideas',
            'Responsive Templates',
            'HTML5 / CSS3 Templates',
            'Creative & Unique',
        ];
        $this->data['tagCloud'] = [
            'Lifestyle',
            'Creative',
            'HTML5',
            'Inspiration',
            'Motivation',
            'PSD',
            'Responsive',
        ];
    }

    public function sendToView()
    {
        $this->evo->addDataToView($this->data);
    }

    protected function getMenu(): array
    {
        $items = SiteContent::query()
            ->where('parent', 0)
            ->where('published', 1)
            ->where('deleted', 0)
            ->where('hidemenu', 0)
            ->orderBy('menuindex')
            ->get(['id', 'pagetitle', 'menutitle', 'alias']);

        $currentId = (int) ($this->evo->documentIdentifier ?? 0);
        $menu = [];
        foreach ($items as $item) {
            $menu[] = [
                'id' => (int) $item->id,
                'title' => $item->menutitle !== '' && $item->menutitle !== null
                    ? $item->menutitle
                    : $item->pagetitle,
                'url' => $this->evo->makeUrl((int) $item->id),
                'active' => (int) $item->id === $currentId
                    || ((int) $item->id === 5 && (int) ($this->evo->documentObject['parent'] ?? 0) === 5),
            ];
        }

        return $menu;
    }

    protected function getPosts(int $limit = 6, int $offset = 0): array
    {
        $docs = SiteContent::query()
            ->where('parent', 5)
            ->where('published', 1)
            ->where('deleted', 0)
            ->orderByDesc('publishedon')
            ->skip($offset)
            ->take($limit)
            ->get();

        return $this->hydratePosts($docs);
    }

    protected function countPosts(): int
    {
        return (int) SiteContent::query()
            ->where('parent', 5)
            ->where('published', 1)
            ->where('deleted', 0)
            ->count();
    }

    protected function hydratePosts($docs): array
    {
        if ($docs->isEmpty()) {
            return [];
        }

        $rows = SiteContent::tvList($docs, ['image', 'category', 'tags']);
        $out = [];
        foreach ($rows as $row) {
            $out[] = $this->mapPost($row);
        }

        return $out;
    }

    protected function mapPost(array $row): array
    {
        $tvs = $row['tvs'] ?? [];
        $image = trim((string) ($tvs['image'] ?? ''));
        if ($image === '') {
            $image = 'images/blog-thumb-01.jpg';
        }
        $image = ltrim($image, '/');

        $tags = array_values(array_filter(array_map(
            'trim',
            explode(',', (string) ($tvs['tags'] ?? ''))
        )));

        $publishedon = (int) ($row['publishedon'] ?? 0);

        return [
            'id' => (int) $row['id'],
            'pagetitle' => $row['pagetitle'],
            'introtext' => $row['introtext'] ?? '',
            'content' => $row['content'] ?? '',
            'url' => $this->evo->makeUrl((int) $row['id']),
            'image' => '/' . $image,
            'category' => ($tvs['category'] ?? '') !== '' ? $tvs['category'] : 'Blog',
            'tags' => $tags,
            'date' => $publishedon > 0 ? date('F d, Y', $publishedon) : '',
            'publishedon' => $publishedon,
        ];
    }
}
