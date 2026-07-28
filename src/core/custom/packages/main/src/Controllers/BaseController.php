<?php namespace EvolutionCMS\Main\Controllers;

use EvolutionCMS\Models\SiteContent;
use EvolutionCMS\Models\SiteTmplvar;
use EvolutionCMS\Models\SiteTmplvarContentvalue;

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
        $this->data['siteName'] = $this->evo->getConfig('site_name', 'Блог Українських Екскурсоводів');
        $this->data['homeUrl'] = $this->evo->makeUrl((int) $this->evo->getConfig('site_start'));
        $this->data['blogUrl'] = $this->evo->makeUrl(5);
        $this->data['menu'] = $this->getMenu();
        $this->data['recentPosts'] = $this->getPosts(3);
        $this->data['categories'] = $this->getTaxonomyValues('category', false);
        $this->data['tagCloud'] = $this->getTaxonomyValues('tags', true);
        $this->data['filters'] = [
            'category' => '',
            'tag' => '',
            'search' => '',
        ];
    }

    /**
     * Build blog listing URL with optional filter/page query params.
     */
    protected function buildBlogUrl(array $params = []): string
    {
        $query = [];
        foreach ($params as $key => $value) {
            $value = trim((string) $value);
            if ($value !== '' && !($key === 'page' && $value === '1')) {
                $query[$key] = $value;
            }
        }

        $base = $this->evo->makeUrl(5);

        return $query === [] ? $base : $base . '?' . http_build_query($query);
    }

    public function sendToView()
    {
        $this->evo->addDataToView($this->data);
    }

    /**
     * Unique category/tag values from published posts (parent = blog).
     */
    protected function getTaxonomyValues(string $tvName, bool $splitByComma): array
    {
        $tvId = (int) SiteTmplvar::query()->where('name', $tvName)->value('id');
        if ($tvId === 0) {
            return [];
        }

        $postIds = SiteContent::query()
            ->where('parent', 5)
            ->where('published', 1)
            ->where('deleted', 0)
            ->pluck('id');

        if ($postIds->isEmpty()) {
            return [];
        }

        $values = SiteTmplvarContentvalue::query()
            ->where('tmplvarid', $tvId)
            ->whereIn('contentid', $postIds)
            ->where('value', '!=', '')
            ->pluck('value');

        $items = [];
        foreach ($values as $raw) {
            $parts = $splitByComma ? explode(',', (string) $raw) : [(string) $raw];
            foreach ($parts as $part) {
                $part = trim($part);
                if ($part !== '') {
                    $items[$part] = true;
                }
            }
        }

        $list = array_keys($items);
        sort($list, SORT_NATURAL | SORT_FLAG_CASE);

        return $list;
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

    protected function getPosts(int $limit = 6, int $offset = 0, array $filters = []): array
    {
        $docs = $this->postsQuery($filters)
            ->orderByDesc('publishedon')
            ->skip($offset)
            ->take($limit)
            ->get();

        return $this->hydratePosts($docs);
    }

    protected function countPosts(array $filters = []): int
    {
        return (int) $this->postsQuery($filters)->count();
    }

    protected function postsQuery(array $filters = [])
    {
        $category = trim((string) ($filters['category'] ?? ''));
        $tag = trim((string) ($filters['tag'] ?? ''));
        $search = trim((string) ($filters['search'] ?? ''));

        $query = SiteContent::query()
            ->where('parent', 5)
            ->where('published', 1)
            ->where('deleted', 0);

        if ($category !== '') {
            $query->whereIn('id', $this->tvValueSubquery('category', $category, true));
        }

        if ($tag !== '') {
            $query->whereIn('id', $this->tvValueSubquery('tags', $tag, false));
        }

        if ($search !== '') {
            $like = '%' . $search . '%';
            $query->where(function ($q) use ($like, $search) {
                $q->where('pagetitle', 'like', $like)
                    ->orWhere('longtitle', 'like', $like)
                    ->orWhere('description', 'like', $like)
                    ->orWhere('introtext', 'like', $like)
                    ->orWhere('content', 'like', $like)
                    ->orWhere('alias', 'like', $like)
                    ->orWhereIn('id', $this->tvLikeSubquery('category', $search))
                    ->orWhereIn('id', $this->tvLikeSubquery('tags', $search));
            });
        }

        return $query;
    }

    /**
     * Subquery of document IDs whose TV value contains the needle.
     */
    protected function tvLikeSubquery(string $tvName, string $value)
    {
        $tvId = (int) \EvolutionCMS\Models\SiteTmplvar::query()
            ->where('name', $tvName)
            ->value('id');

        return \EvolutionCMS\Models\SiteTmplvarContentvalue::query()
            ->select('contentid')
            ->where('tmplvarid', $tvId)
            ->where('value', 'like', '%' . $value . '%');
    }

    /**
     * Subquery of document IDs matching a TV value (exact or tag-in-list).
     */
    protected function tvValueSubquery(string $tvName, string $value, bool $exact)
    {
        $tvId = (int) \EvolutionCMS\Models\SiteTmplvar::query()
            ->where('name', $tvName)
            ->value('id');

        $sub = \EvolutionCMS\Models\SiteTmplvarContentvalue::query()
            ->select('contentid')
            ->where('tmplvarid', $tvId);

        if ($exact) {
            $sub->where('value', $value);
        } else {
            $sub->where(function ($q) use ($value) {
                $q->where('value', '=', $value)
                    ->orWhere('value', 'like', $value . ',%')
                    ->orWhere('value', 'like', '%, ' . $value)
                    ->orWhere('value', 'like', '%, ' . $value . ',%')
                    ->orWhere('value', 'like', '%,' . $value)
                    ->orWhere('value', 'like', '%,' . $value . ',%');
            });
        }

        return $sub;
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
            $image = 'assets/images/blog-thumb-01.jpg';
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
            'image' => '/' . $image . '?v=2',
            'category' => ($tvs['category'] ?? '') !== '' ? $tvs['category'] : 'Подорожі',
            'tags' => $tags,
            'date' => $publishedon > 0 ? date('d.m.Y', $publishedon) : '',
            'publishedon' => $publishedon,
        ];
    }
}
