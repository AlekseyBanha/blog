<?php namespace EvolutionCMS\Main\Controllers;

class HomeController extends BaseController
{
    public function render()
    {
        $this->data['bannerPosts'] = $this->getPosts(6);
        $this->data['posts'] = $this->getPosts(3);
    }
}
