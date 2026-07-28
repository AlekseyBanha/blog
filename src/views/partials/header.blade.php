<header class="">
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="{{ $homeUrl }}"><h2>{{ $siteName }}<em>.</em></h2></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    @foreach($menu as $item)
                        <li class="nav-item{{ !empty($item['active']) ? ' active' : '' }}">
                            <a class="nav-link" href="{{ $item['url'] }}">{{ $item['title'] }}
                                @if(!empty($item['active']))
                                    <span class="sr-only">(current)</span>
                                @endif
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>
        </div>
    </nav>
</header>
