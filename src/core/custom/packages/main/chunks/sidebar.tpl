<div class="sidebar">
  <div class="row">
    <div class="col-lg-12">
      <div class="sidebar-item search">
        <form id="search_form" name="gs" method="GET" action="[~5~]">
          <input type="text" name="search" class="searchText" placeholder="type to search..." autocomplete="on" value="[+search+]">
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
            [[DocLister?
              &parents=`5`
              &depth=`1`
              &display=`3`
              &orderBy=`publishedon DESC`
              &tvList=`image,category,tags`
              &dateSource=`publishedon`
              &dateFormat=`%B %d, %Y`
              &tpl=`dlRecent`
              &noneWrapOuter=`0`
            ]]
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
            [[$categories]]
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
            [[$tagCloud]]
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
