<?php namespace EvolutionCMS\Main\Controllers;

class BlogController extends BaseController
{
    public function render()
    {
        $filters = [
            'category' => trim((string) ($_GET['category'] ?? '')),
            'tag' => trim((string) ($_GET['tag'] ?? '')),
            'search' => trim((string) ($_GET['search'] ?? '')),
        ];

        // Search is a standalone query — ignore category/tag when searching.
        if ($filters['search'] !== '') {
            $filters['category'] = '';
            $filters['tag'] = '';
        }

        $perPage = 6;
        $page = max(1, (int) ($_GET['page'] ?? 1));
        $total = $this->countPosts($filters);
        $pages = max(1, (int) ceil($total / $perPage));
        if ($page > $pages) {
            $page = $pages;
        }

        $this->data['filters'] = $filters;
        $this->data['posts'] = $this->getPosts($perPage, ($page - 1) * $perPage, $filters);
        $this->data['pagination'] = [
            'page' => $page,
            'pages' => $pages,
            'total' => $total,
        ];
        $this->data['pageUrls'] = [];
        for ($i = 1; $i <= $pages; $i++) {
            $this->data['pageUrls'][$i] = $this->buildBlogUrl(array_merge($filters, ['page' => (string) $i]));
        }
        $this->data['prevPageUrl'] = $page > 1
            ? $this->buildBlogUrl(array_merge($filters, ['page' => (string) ($page - 1)]))
            : null;
        $this->data['nextPageUrl'] = $page < $pages
            ? $this->buildBlogUrl(array_merge($filters, ['page' => (string) ($page + 1)]))
            : null;
    }
}
