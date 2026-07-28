@extends('layout')

@section('content')
    <div class="heading-page header-text">
        <section class="page-heading">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-content">
                            <h4>Деталі маршруту</h4>
                            <h2>{{ $post['pagetitle'] }}</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    @include('partials.cta')

    <section class="blog-posts grid-system">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="all-blog-posts">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="blog-post">
                                    <div class="blog-thumb">
                                        <img src="{{ $post['image'] }}" alt="{{ $post['pagetitle'] }}">
                                    </div>
                                    <div class="down-content">
                                        <span><a href="{{ $blogUrl }}?category={{ urlencode($post['category']) }}">{{ $post['category'] }}</a></span>
                                        <a href="{{ $post['url'] }}"><h4>{{ $post['pagetitle'] }}</h4></a>
                                        <ul class="post-info">
                                            <li>Екскурсовод</li>
                                            <li>{{ $post['date'] }}</li>
                                            <li><i class="fa fa-eye"></i> {{ $post['views_label'] }}</li>
                                        </ul>
                                        {!! $post['content'] !!}
                                        <div class="post-options">
                                            <div class="row">
                                                <div class="col-6">
                                                    <ul class="post-tags">
                                                        <li><i class="fa fa-tags"></i></li>
                                                        @foreach($post['tags'] as $i => $tag)
                                                            <li><a href="{{ $blogUrl }}?tag={{ urlencode($tag) }}">{{ $tag }}</a>@if($i < count($post['tags']) - 1),@endif</li>
                                                        @endforeach
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
                    @include('partials.sidebar')
                </div>
            </div>
        </div>
    </section>
@endsection
