<footer id="footer" style="{$footer_display}">
                 

                  <div class="footer-wrapper">
                     <div class="container">
                      <p>&nbsp;</p>
                        <div class="row">
                           <div class="col-sm-6 col-md-3">
                              <h2>Berita Terkini</h2>
                              <ul class="travel-news">
                                 <li>
                                    <div class="thumb">
                                       <a href="#">
                                       <img src="{$base_url}upload/{$footer_news[0].news_image}" alt="" width="63" height="63">
                                       </a>
                                    </div>
                                    <div class="description">
                                       <h5 class="s-title"><a href="{$site_url}/news/detail/{$footer_news[0].news_id}">{$footer_news[0].news_title}</a></h5>
                                       <p class="footer_text">{$footer_news[0].news_desc}</p>
                                       <span class="date">{$footer_news[0].datein}</span>
                                    </div>
                                 </li>
                                 <li>
                                    <div class="thumb">
                                       <a href="#">
                                       <img src="{$base_url}upload/{$footer_news[1].news_image}" alt="" width="63" height="63">
                                       </a>
                                    </div>
                                    <div class="description">
                                       <h5 class="s-title"><a href="{$site_url}/news/detail/{$footer_news[1].news_id}">{$footer_news[1].news_title}</a></h5>
                                       <p class="footer_text">{$footer_news[1].news_desc}</p>
                                       <span class="date">{$footer_news[1].datein}</span>
                                    </div>
                                 </li>
                              </ul>
                           </div>
                           <div class="col-sm-6 col-md-3">
                              <h2><span style="color:#297ec5;">-----</span></h2>
                              <ul class="travel-news">
                                 <li>
                                    <div class="thumb">
                                       <a href="#">
                                       <img src="{$base_url}upload/{$footer_news[2].news_image}" alt="" width="63" height="63">
                                       </a>
                                    </div>
                                    <div class="description">
                                       <h5 class="s-title"><a href="{$site_url}/news/detail/{$footer_news[2].news_id}">{$footer_news[2].news_title}</a></h5>
                                       <p class="footer_text">{$footer_news[2].news_desc}</p>
                                       <span class="date">{$footer_news[2].datein}</span>
                                    </div>
                                 </li>
                                 <li>
                                    <div class="thumb">
                                       <a href="#">
                                       <img src="{$base_url}upload/{$footer_news[3].news_image}" alt="" width="63" height="63">
                                       </a>
                                    </div>
                                    <div class="description">
                                       <h5 class="s-title"><a href="{$site_url}/news/detail/{$footer_news[3].news_id}">{$footer_news[3].news_title}</a></h5>
                                       <p class="footer_text">{$footer_news[3].news_desc}</p>
                                       <span class="date">{$footer_news[3].datein}</span>
                                    </div>
                                 </li>
                              </ul>
                           </div>
                           <div class="col-sm-6 col-md-3">
                              <h2>Dukungan Pembayaran</h2>
                              <p>Pembayaran melalui ATM | Mobile Banking | Online Banking | E-Wallet.</p>
                              <br>
                              <div>
                                 <img src="{$base_url}assets/images/web_payment.png" width="280">
                              </div>
                              <br>
                              <p>Secured By.</p>
                              <img src="{$assets_url}images/RapidSSL_SEAL-90x50.gif">&nbsp;
                              
                              <!-- <span>We respect your privacy</span> -->
                           </div>
                          
                           <div class="col-sm-6 col-md-3 customer-care">
                             <!--  <h2>Hubungi Contact Center</h2>
                              <address class="contact-details">
                                 <span class="contact-phone icon-box" style="color:#f0f0f0;"><i class="icon"></i> <a href="tel:{$settings.cs_phone1}">{$settings.cs_phone1}</a> </span>
                                 <center><a href="mailto:{$settings.cs_email1}">{$settings.cs_email1}</a></center>
                                 <br>
                              </address> -->
                              <div id="question_box_result" style="display:none;"></div>
                              <div id="question_box">
                                <!-- <h2>Ada Pertanyaan?</h2> -->

                                   <!-- <input type="text" id="question_email_footer" class="input-text full-width" placeholder="Masukkan alamat email"> -->
                                   <!-- <input type="text" id="question_message_footer" class="input-text full-width" placeholder="Masukkan pertanyaan"> -->
                                   <!-- <a href="#" class="contact-email">help@jasindotravel.com</a> -->
                                 <!-- <button class="button btn-small sky-blue1" id="btn_submit_message_footer" style="float:right;"> -->
                                 <!-- Kirim -->
                                 <!-- </button> -->
                              </div>
                           </div>
                            <!-- <div class="col-sm-6 col-md-3 customer-care">
                              <h2>Telah Terdaftar dan Diawasi</h2>
                              <center><img src="{$base_url}assets/images/aomq-1496392241-ojk-indone.png" width="150"></center>
                              <br><br>
                           </div> -->
                        </div>
                     </div>
                  </div>

                  <div class="bottom">
                     <div class="container">
                        <!-- <div class="logo pull-left">
                           <a href="index.html" title="Jasindo Travel - home">
                               <img src="{$assets_url}images/logo.png" alt="Jasindo Travel HTML5 Template">
                           </a>
                           </div> -->
                        <div class="pull-right">
                           <a id="back-to-top" href="#" class="animated" data-animation-type="bounce"><i class="soap-icon-longarrow-up circle"></i></a>
                        </div>
                        <div class="copyright pull-right">
                           <p>© {$year_now} Bintang Wisata</p>
                        </div>
                     </div>
                  </div>
               </footer>