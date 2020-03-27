<!-- <a href="#mobile-menu-01" data-toggle="collapse" class="mobile-menu-toggle"> -->
                     <!-- Mobile Menu Toggle -->
                     </a>
                     <div class="container">
                        <h1 class="navbar-brand">
                           <a href="{$site_url}" title="bintangwisata">
                           <img src="{$base_url}/assets/images/tes-logo-BW1.png" alt="" style="width: 209px;";/>
                           </a>
                        </h1>
                        <nav id="main-menu">
                           <ul class="menu">
                              <li>
                                 <a href="{$site_url}">Pesawat</a>
                              </li>
                               <li>
                                 <a href="{$site_url}/page/benefit_jasindo_travel">Topup</a>
                              </li>
                               <li>
                                 <a href="{$site_url}/page/cara_pembayaran">PPOB</a>
                              </li>
                               <li>
                                
                              </li>
                              <!-- <li>
                                 <a href="{$site_url}/page/klaim_jasindo_travel">Klaim</a>
                              </li>
                              <li>
                                 <a href="{$site_url}/intermediary/register">Intermediary</a>
                              </li> -->
                              <li>
                                  <a href="#">Tentang Kami</a>
                                   <ul>
                                      <!--  <li> <a href="{$site_url}/page/tentang_jasindo_travel">Tentang Jasindo Travel</a></li>
                                       <li> <a href="{$site_url}/page/syarat_dan_ketentuan">Syarat dan Ketentuan</a></li>
                                       <li> <a href="{$site_url}/page/hubungi_kami">Hubungi Kami</a></li> -->
                                   </ul>
                              </li>
                              {if $logged eq true}
                              <li>
                                {if $user_type_id eq 4}

                                 <a href="{$site_url}/intermediary/profile_intermediary">My Profile</a>                           
                                {else}
                                 <a href="{$site_url}/user_panel">My Profile</a>                           
                                {/if}
                              </li>
                              {/if}

                              <li>
                                 {if $logged eq true}
                                    <a href="{$site_url}/logout">Logout</a>
                                 {else}
                                 
                                    <a href="{$site_url}/login"><button class="btn-medium sky-blue1">LOGIN</button></a>
                                 {/if}                                 
                              </li>
                           </ul>
                        </nav>
                     </div>
                     <!-- <nav id="mobile-menu-01" class="mobile-menu collapse"> -->
                        <!-- <ul id="mobile-primary-menu" class="menu"> -->
                           <!-- <li class=" "> -->
                                <!-- <a href="{$site_url}" title="Jasindo Travel"> -->
                           <!-- <img src="{$base_url}/assets/images/jasindotravel_trans.png" alt="" /> -->
                           <!-- </a> -->
                              <!-- </li> -->
                            <!--   <li class="menu-item-has-children">
                                 <a href="{$site_url}/page/paket_asuransi">Paket Asuransi</a>
                              </li> -->
                              <!-- </li> -->
                               <!-- <li class="menu-item-has-children">
                                 <a href="{$site_url}/page/benefit_jasindo_travel">Benefit</a>
                              </li>
                               <li class="menu-item-has-children">
                                 <a href="{$site_url}/page/syarat_dan_ketentuan">Syarat dan Ketentuan</a>
                              </li>
                              <li class="menu-item-has-children">
                                 <a href="{$site_url}/page/klaim_jasindo_travel">Klaim</a>
                              </li>
                              <li class="menu-item-has-children">
                                 <a href="{$site_url}/page/tentang_jasindo_travel">Tentang Jasindo Travel</a>
                              </li>
                              <li class="menu-item-has-children">
                                 <a href="{$site_url}/page/hubungi_kami">Hubungi Kami</a>
                              </li> -->
                              {if $logged eq true}
                              <!-- <li class="menu-item-has-children"> -->
                                  {if $user_type_id eq 4}

                                 <!-- <a href="{$site_url}/intermediary/profile_intermediary">My Profile</a>                            -->
                                {else}
                                 <!-- <a href="{$site_url}/user_panel">My Profile</a>                            -->
                                {/if}                           
                              <!-- </li> -->
                              {/if}   
                              <!-- <li class="menu-item-has-children"> -->
                                 {if $logged eq true}
                                    <!-- <a href="{$site_url}/logout">Logout</a> -->
                                 {else}
                                 
                                    <!-- <a href="{$site_url}/login">LOGIN</a> -->
                                 {/if}                                 
                              <!-- </li> -->
                        <!-- </ul> -->
                     <!-- </nav> -->