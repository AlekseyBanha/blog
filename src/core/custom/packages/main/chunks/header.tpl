<header class="">
  <nav class="navbar navbar-expand-lg">
    <div class="container">
      <a class="navbar-brand" href="[~[(site_start)]~]"><h2>[(site_name)]<em>.</em></h2></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          [[DLMenu?
            &parents=`0`
            &maxDepth=`1`
            &outerTpl=`@CODE:[+wrap+]`
            &rowTpl=`menuItem`
            &hereClass=`active`
            &activeClass=`active`
          ]]
        </ul>
      </div>
    </div>
  </nav>
</header>
