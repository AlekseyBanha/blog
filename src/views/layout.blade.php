<!DOCTYPE html>
<html lang="{{(evo()->getConfig('lang', 'en'))}}" class="page">

<head>
    <base href="{{(evo()->getConfig('site_url', '/'))}}"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    @if(is_array($evtHead = evo()->invokeEvent('OnWebDocumentRender')))
        {!! implode('', $evtHead) !!}
    @endif
    <title>{{evo()->getConfig('site_name','Stand CSS Blog by TemplateMo')}}</title>
    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/css/fontawesome.css">
    <link rel="stylesheet" href="/css/templatemo-stand-blog.css">
    <link rel="stylesheet" href="/css/owl.css">
</head>

<body>
@include('partials.header')

@yield('content')

@include('partials.footer')
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>

<!-- Additional Scripts -->
<script src="../js/custom.js"></script>
<script src="../js/owl.js"></script>
<script src="../js/slick.js"></script>
<script src="../js/isotope.js"></script>
<script src="../js/accordions.js"></script>

<script language = "text/Javascript">
    cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
    function clearField(t){                   //declaring the array outside of the
        if(! cleared[t.id]){                      // function makes it static and global
            cleared[t.id] = 1;  // you could use true and false, but that's more typing
            t.value='';         // with more chance of typos
            t.style.color='#fff';
        }
    }
</script>
@stack('scripts.bottom')
</body>

</html>