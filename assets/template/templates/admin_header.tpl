<style type="text/css">
#main-menu ul.menu>li, .chaser ul.menu>li {
    float: left;
    padding-left: 0px;
    padding-right: 20px;
}
</style>
<a href="#mobile-menu-01" data-toggle="collapse" class="mobile-menu-toggle">
                     Mobile Menu Toggle
                     </a>
                     <div class="container">
                        <h1 class="logo navbar-brand">
                           <a href="{$site_url}">
                           <img src="{$assets_url}images/logo.png" />
                           </a>
                        </h1>
                        <nav id="main-menu" role="navigation">
                           <ul class="menu">
                              <!--  <li class="menu-item-has-children">
                                 <a href="{$site_url}/admin_panel/import_order">Import Data</a>
                              </li> -->
                              <li class="menu-item-has-children">
                                 <a href="{$site_url}/admin_panel/participant">Peserta</a>
                              </li>
                              <li class="menu-item-has-children">
                                 <a href="{$site_url}/admin_panel/order">Pemesanan</a>
                              </li>
                               <li class="menu-item-has-children">
                                 <a href="{$site_url}/admin_panel/invoice">Invoice</a>
                              </li>
                              <li class="menu-item-has-children">
                                 <a href="{$site_url}/admin_panel/claim">Klaim</a>
                              </li>
                               <li class="menu-item-has-children">
                                 <a href="{$site_url}/admin_panel/news">Berita</a>
                              </li>
                              <li class="menu-item-has-children">
                                 <a href="{$site_url}/admin_panel/message">Perpesanan</a>
                              </li>
                             <!--  <li class="menu-item-has-children">
                                 <a href="{$site_url}/admin_panel/inbox">Kotak Masuk</a>
                              </li>
                              <li class="menu-item-has-children">
                                 <a href="{$site_url}/admin_panel/outbox">Kotak Keluar</a>
                              </li> -->
                               <li class="menu-item-has-children">
                                 <a href="{$site_url}/admin_panel/setting">Pengaturan</a>
                              </li>
                               <li class="menu-item-has-children">
                                 <a href="{$site_url}/admin_panel/user">Pengguna</a>
                              </li>
                              <!--   <li class="menu-item-has-children">
                                 <a href="{$site_url}/admin_panel/profil">Profil</a>
                              </li> -->
                              <li class="menu-item-has-children">
                                 {if $logged eq true}
                                    <a href="{$site_url}/logout">Logout</a>
                                 {else}
                                    <a href="{$site_url}/login">Login</a>
                                 {/if}                                 
                              </li>
                           </ul>
                        </nav>
                     </div>
                     <nav id="mobile-menu-01" class="mobile-menu collapse">
                        <ul id="mobile-primary-menu" class="menu">
                           <li class="menu-item-has-children">
                              <a href="index.html">Home</a>
                           </li>
                           <li class="menu-item-has-children">
                              <a href="paket-asuransi.html">Paket Asuransi</a>
                           </li>
                           <li class="menu-item-has-children">
                              <a href="user_panel.html">Klaim</a>
                           </li>
                           <li class="menu-item-has-children">
                              <a href="tentang.html">Tentang Jasindo Travel</a>
                           </li>
                           <li class="menu-item-has-children">
                              <a href="hubungi_kami.html">Hubungi Kami</a>
                           </li>
                           <li class="menu-item-has-children">
                              <a href="user_panel.html">Login</a>
                           </li>
                        </ul>
                     </nav>