@extends('layout')

@section('content')
    <div class="heading-page header-text">
        <section class="page-heading">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-content">
                            <h4>{{ $doc['longtitle'] ?: 'Recent Posts' }}</h4>
                            <h2>{{ $doc['pagetitle'] }}</h2>
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
                            @forelse($posts as $item)
                                <div class="col-lg-6">
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
                                                    <div class="col-lg-12">
                                                        <ul class="post-tags">
                                                            <li><i class="fa fa-tags"></i></li>
                                                            @foreach($item['tags'] as $i => $tag)
                                                                <li><a href="{{ $blogUrl }}">{{ $tag }}</a>@if($i < count($item['tags']) - 1),@endif</li>
                                                            @endforeach
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

                            @if(($pagination['pages'] ?? 1) > 1)
                                <div class="col-lg-12">
                                    <ul class="page-numbers">
                                        @if($pagination['page'] > 1)
                                            <li><a href="?page={{ $pagination['page'] - 1 }}"><i class="fa fa-angle-double-left"></i></a></li>
                                        @endif
                                        @for($i = 1; $i <= $pagination['pages']; $i++)
                                            <li class="{{ $i === $pagination['page'] ? 'active' : '' }}">
                                                <a href="?page={{ $i }}">{{ $i }}</a>
                                            </li>
                                        @endfor
                                        @if($pagination['page'] < $pagination['pages'])
                                            <li><a href="?page={{ $pagination['page'] + 1 }}"><i class="fa fa-angle-double-right"></i></a></li>
                                        @endif
                                    </ul>
                                </div>
                            @endif
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
