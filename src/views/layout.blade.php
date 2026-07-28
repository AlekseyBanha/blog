<!DOCTYPE html>
<html lang="uk" class="page">
<head>
    <base href="{{ evo()->getConfig('site_url', '/') }}"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="{{ $doc['description'] ?? '' }}">
    @if(is_array($evtHead = evo()->invokeEvent('OnWebDocumentRender')))
        {!! implode('', $evtHead) !!}
    @endif
    <title>{{ $doc['pagetitle'] ?? $siteName }} | {{ $siteName }}</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/fontawesome.css">
    <link rel="stylesheet" href="/css/templatemo-stand-blog.css?v=5">
    <link rel="stylesheet" href="/css/owl.css">
</head>
<body>
@include('partials.preloader')
@include('partials.header')

@yield('content')

@include('partials.footer')
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/custom.js"></script>
<script src="/js/owl.js"></script>
<script src="/js/slick.js"></script>
<script src="/js/isotope.js"></script>
<script src="/js/accordions.js"></script>
@stack('scripts.bottom')
</body>
</html>
