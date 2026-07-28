<div class="sidebar">
  <div class="row">
    <div class="col-lg-12">
      <div class="sidebar-item search">
        <form id="search_form" name="gs" method="GET" action="[~5~]" role="search">
          <input type="text" name="search" class="searchText" placeholder="пошук маршрутів..." autocomplete="off" value="[+search+]">
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
            [[DocLister?
              &parents=`5`
              &depth=`1`
              &display=`3`
              &orderBy=`publishedon DESC`
              &tvList=`image,category,tags`
              &dateSource=`publishedon`
              &dateFormat=`%d.%m.%Y`
              &tpl=`dl/recent`
              &noneWrapOuter=`0`
            ]]
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
            [[blogTaxonomy? &type=`category`]]
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
            [[blogTaxonomy? &type=`tags`]]
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
