<div class="page-title-container">
            <div class="container">
                <div class="page-title pull-left sky-blue1">
                    <h2 class="entry-title">Berita</h2>
                </div>
               <!--  <ul class="breadcrumbs pull-right">
                    <li><a href="#">HOME</a></li>
                    <li><a href="#">PAGES</a></li>
                    <li class="active">Blog Full Width</li>
                </ul> -->
            </div>
        </div>

        <section id="content">
            <div class="container">
                <div id="main">
                    <div class="page">
                        <span style="display: none;" class="entry-title page-title">Blog Full Width</span>
                        <span style="display: none;" class="vcard"><span class="fn"><a rel="author" title="Posts by admin" href="#">admin</a></span></span>
                        <span style="display:none;" class="updated">2014-06-20T13:35:34+00:00</span>
                        <div class="post-content">
                            <div class="blog-infinite">
                                {foreach from=$list_news item=d}
                                    <li></li>
                               

                                <div class="post without-featured-item">
                                    <div class="post-content-wrapper">
                                      <!--   <figure class="image-container">
                                            <a href="pages-blog-read.html" class="hover-effect"><img src="http://placehold.it/1170x342" alt="" /></a>
                                        </figure> -->
                                        <div class="details">
                                            <h2 class="entry-title"><a href="{$site_url}/news/detail/{$d.news_id}">{$d.news_title}</a></h2>
                                            <div class="excerpt-container">
                                                <p>{$d.news_desc}</p>
                                            </div>
                                            <div class="post-meta">
                                                <div class="entry-date">
                                                    <label class="date">{$d.tgl}</label>
                                                    <label class="month">{$d.bulan}</label>
                                                </div>
                                                <div class="entry-author fn">
                                                    <i class="icon soap-icon-user"></i> Posted By:
                                                    <a href="#" class="author">{$d.username}</a>
                                                </div>
                                              <!--   <div class="entry-action">
                                                    <a href="#" class="button entry-comment btn-small"><i class="soap-icon-comment"></i><span>30 Comments</span></a>
                                                    <a href="#" class="button btn-small"><i class="soap-icon-wishlist"></i><span>22 Likes</span></a>
                                                    <span class="entry-tags"><i class="soap-icon-features"></i><span><a href="#">Adventure</a>, <a href="#">Romance</a></span></span>
                                                </div> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                 {/foreach}


                                </div>
                            </div>
                            <!-- <a href="#" class="button btn-large full-width">LOAD MORE POSTS</a> -->
                        </div>
                    </div>
                </div>
            </div>
        </section>