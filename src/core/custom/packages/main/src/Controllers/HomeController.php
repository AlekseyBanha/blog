<?php namespace EvolutionCMS\Main\Controllers;

class HomeController extends BaseController
{
    public function render()
    {
        $this->data['bannerPosts'] = $this->getBannerSlides();
        $this->data['posts'] = $this->getPosts(3);
    }
}
