<div class="sidebar">
    <div class="row">
        <div class="col-lg-12">
            <div class="sidebar-item search">
                <form id="search_form" name="gs" method="GET" action="{{ $blogUrl }}">
                    <input type="text" name="search" class="searchText" placeholder="type to search..." autocomplete="on" value="{{ $_GET['search'] ?? '' }}">
                </form>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="sidebar-item recent-posts">
                <div class="sidebar-heading">
                    <h2>Recent Posts</h2>
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
                    <h2>Categories</h2>
                </div>
                <div class="content">
                    <ul>
                        @foreach($categories as $category)
                            <li><a href="{{ $blogUrl }}">- {{ $category }}</a></li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="sidebar-item tags">
                <div class="sidebar-heading">
                    <h2>Tag Clouds</h2>
                </div>
                <div class="content">
                    <ul>
                        @foreach($tagCloud as $tag)
                            <li><a href="{{ $blogUrl }}">{{ $tag }}</a></li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
