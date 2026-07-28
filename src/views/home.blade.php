@extends('layout')

@section('content')
    <div class="main-banner header-text">
        <div class="container-fluid">
            <div class="owl-banner owl-carousel">
                @foreach($bannerPosts as $item)
                    <div class="item">
                        <img src="{{ $item['image'] }}" alt="{{ $item['pagetitle'] }}">
                        <div class="item-content">
                            <div class="main-content">
                                <div class="meta-category">
                                    <span>{{ $item['category'] }}</span>
                                </div>
                                <a href="{{ $item['url'] }}"><h4>{{ $item['pagetitle'] }}</h4></a>
                                <ul class="post-info">
                                    <li><a href="{{ $item['url'] }}">Admin</a></li>
                                    <li><a href="{{ $item['url'] }}">{{ $item['date'] }}</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>

    @include('partials.cta')

    <section class="blog-posts">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="all-blog-posts">
                        <div class="row">
                            @forelse($posts as $item)
                                <div class="col-lg-12">
                                    <div class="blog-post">
                                        <div class="blog-thumb">
                                            <img src="{{ $item['image'] }}" alt="{{ $item['pagetitle'] }}">
                                        </div>
                                        <div class="down-content">
                                            <span>{{ $item['category'] }}</span>
                                            <a href="{{ $item['url'] }}"><h4>{{ $item['pagetitle'] }}</h4></a>
                                            <ul class="post-info">
                                                <li><a href="{{ $item['url'] }}">Admin</a></li>
                                                <li><a href="{{ $item['url'] }}">{{ $item['date'] }}</a></li>
                                            </ul>
                                            <p>{{ $item['introtext'] }}</p>
                                            <div class="post-options">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <ul class="post-tags">
                                                            <li><i class="fa fa-tags"></i></li>
                                                            @foreach($item['tags'] as $i => $tag)
                                                                <li><a href="{{ $blogUrl }}">{{ $tag }}</a>@if($i < count($item['tags']) - 1),@endif</li>
                                                            @endforeach
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
                            @empty
                                <div class="col-lg-12"><p>No posts yet.</p></div>
                            @endforelse
                            <div class="col-lg-12">
                                <div class="main-button">
                                    <a href="{{ $blogUrl }}">View All Posts</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    @include('partials.sidebar')
                </div>
            </div>
        </div>
    </section>
@endsection
