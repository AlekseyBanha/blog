<div class="sidebar">
    <div class="row">
        <div class="col-lg-12">
            <div class="sidebar-item search">
                <form id="search_form" name="gs" method="GET" action="{{ $blogUrl }}" role="search">
                    <input type="text" name="search" class="searchText" placeholder="пошук маршрутів..." autocomplete="off" value="{{ $filters['search'] ?? '' }}">
                    <button type="submit" aria-label="Шукати"><i class="fa fa-search"></i></button>
                </form>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="sidebar-item recent-posts">
                <div class="sidebar-heading">
                    <h2>Останні статті</h2>
                </div>
                <div class="content">
                    <ul>
                        @foreach($recentPosts as $item)
                            <li>
                                <a href="{{ $item['url'] }}">
                                    <h5>{{ $item['pagetitle'] }}</h5>
                                    <span>{{ $item['date'] }}</span>
                                </a>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="sidebar-item categories">
                <div class="sidebar-heading">
                    <h2>Категорії</h2>
                </div>
                <div class="content">
                    <ul>
                        @foreach($categories as $category)
                            <li>
                                <a href="{{ $blogUrl }}?category={{ urlencode($category) }}"
                                   class="{{ ($filters['category'] ?? '') === $category ? 'active' : '' }}">
                                    - {{ $category }}
                                </a>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="sidebar-item tags">
                <div class="sidebar-heading">
                    <h2>Теги</h2>
                </div>
                <div class="content">
                    <ul>
                        @foreach($tagCloud as $tag)
                            <li>
                                <a href="{{ $blogUrl }}?tag={{ urlencode($tag) }}"
                                   class="{{ ($filters['tag'] ?? '') === $tag ? 'active' : '' }}">
                                    {{ $tag }}
                                </a>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
