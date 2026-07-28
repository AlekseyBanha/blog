<?php namespace EvolutionCMS\Main\Controllers;

class BlogController extends BaseController
{
    public function render()
    {
        $perPage = 6;
        $page = max(1, (int) ($_GET['page'] ?? 1));
        $total = $this->countPosts();
        $pages = max(1, (int) ceil($total / $perPage));
        if ($page > $pages) {
            $page = $pages;
        }

        $this->data['posts'] = $this->getPosts($perPage, ($page - 1) * $perPage);
        $this->data['pagination'] = [
            'page' => $page,
            'pages' => $pages,
            'total' => $total,
        ];
    }
}
