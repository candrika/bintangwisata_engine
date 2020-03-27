<?php /* Smarty version Smarty-3.1.15, created on 2020-03-26 00:40:38
         compiled from "C:\xampp\htdocs\bintangw\assets\template\templates\footer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:5543789805e7bebf678ca17-73063504%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b999b36202621171c601b42860f13130d9fb4391' => 
    array (
      0 => 'C:\\xampp\\htdocs\\bintangw\\assets\\template\\templates\\footer.tpl',
      1 => 1585037705,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5543789805e7bebf678ca17-73063504',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'footer_display' => 0,
    'base_url' => 0,
    'footer_news' => 0,
    'site_url' => 0,
    'assets_url' => 0,
    'settings' => 0,
    'year_now' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5e7bebf6a24bb6_63731333',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5e7bebf6a24bb6_63731333')) {function content_5e7bebf6a24bb6_63731333($_smarty_tpl) {?><footer id="footer" style="<?php echo $_smarty_tpl->tpl_vars['footer_display']->value;?>
">
                 

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
                                       <img src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
upload/<?php echo $_smarty_tpl->tpl_vars['footer_news']->value[0]['news_image'];?>
" alt="" width="63" height="63">
                                       </a>
                                    </div>
                                    <div class="description">
                                       <h5 class="s-title"><a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/news/detail/<?php echo $_smarty_tpl->tpl_vars['footer_news']->value[0]['news_id'];?>
"><?php echo $_smarty_tpl->tpl_vars['footer_news']->value[0]['news_title'];?>
</a></h5>
                                       <p class="footer_text"><?php echo $_smarty_tpl->tpl_vars['footer_news']->value[0]['news_desc'];?>
</p>
                                       <span class="date"><?php echo $_smarty_tpl->tpl_vars['footer_news']->value[0]['datein'];?>
</span>
                                    </div>
                                 </li>
                                 <li>
                                    <div class="thumb">
                                       <a href="#">
                                       <img src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
upload/<?php echo $_smarty_tpl->tpl_vars['footer_news']->value[1]['news_image'];?>
" alt="" width="63" height="63">
                                       </a>
                                    </div>
                                    <div class="description">
                                       <h5 class="s-title"><a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/news/detail/<?php echo $_smarty_tpl->tpl_vars['footer_news']->value[1]['news_id'];?>
"><?php echo $_smarty_tpl->tpl_vars['footer_news']->value[1]['news_title'];?>
</a></h5>
                                       <p class="footer_text"><?php echo $_smarty_tpl->tpl_vars['footer_news']->value[1]['news_desc'];?>
</p>
                                       <span class="date"><?php echo $_smarty_tpl->tpl_vars['footer_news']->value[1]['datein'];?>
</span>
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
                                       <img src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
upload/<?php echo $_smarty_tpl->tpl_vars['footer_news']->value[2]['news_image'];?>
" alt="" width="63" height="63">
                                       </a>
                                    </div>
                                    <div class="description">
                                       <h5 class="s-title"><a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/news/detail/<?php echo $_smarty_tpl->tpl_vars['footer_news']->value[2]['news_id'];?>
"><?php echo $_smarty_tpl->tpl_vars['footer_news']->value[2]['news_title'];?>
</a></h5>
                                       <p class="footer_text"><?php echo $_smarty_tpl->tpl_vars['footer_news']->value[2]['news_desc'];?>
</p>
                                       <span class="date"><?php echo $_smarty_tpl->tpl_vars['footer_news']->value[2]['datein'];?>
</span>
                                    </div>
                                 </li>
                                 <li>
                                    <div class="thumb">
                                       <a href="#">
                                       <img src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
upload/<?php echo $_smarty_tpl->tpl_vars['footer_news']->value[3]['news_image'];?>
" alt="" width="63" height="63">
                                       </a>
                                    </div>
                                    <div class="description">
                                       <h5 class="s-title"><a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/news/detail/<?php echo $_smarty_tpl->tpl_vars['footer_news']->value[3]['news_id'];?>
"><?php echo $_smarty_tpl->tpl_vars['footer_news']->value[3]['news_title'];?>
</a></h5>
                                       <p class="footer_text"><?php echo $_smarty_tpl->tpl_vars['footer_news']->value[3]['news_desc'];?>
</p>
                                       <span class="date"><?php echo $_smarty_tpl->tpl_vars['footer_news']->value[3]['datein'];?>
</span>
                                    </div>
                                 </li>
                              </ul>
                           </div>
                           <div class="col-sm-6 col-md-3">
                              <h2>Dukungan Pembayaran</h2>
                              <p>Pembayaran melalui ATM | Mobile Banking | Online Banking | E-Wallet.</p>
                              <br>
                              <div>
                                 <img src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
assets/images/web_payment.png" width="280">
                              </div>
                              <br>
                              <p>Secured By.</p>
                              <img src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
images/RapidSSL_SEAL-90x50.gif">&nbsp;
                              
                              <!-- <span>We respect your privacy</span> -->
                           </div>
                          
                           <div class="col-sm-6 col-md-3 customer-care">
                             <!--  <h2>Hubungi Contact Center</h2>
                              <address class="contact-details">
                                 <span class="contact-phone icon-box" style="color:#f0f0f0;"><i class="icon"></i> <a href="tel:<?php echo $_smarty_tpl->tpl_vars['settings']->value['cs_phone1'];?>
"><?php echo $_smarty_tpl->tpl_vars['settings']->value['cs_phone1'];?>
</a> </span>
                                 <center><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['settings']->value['cs_email1'];?>
"><?php echo $_smarty_tpl->tpl_vars['settings']->value['cs_email1'];?>
</a></center>
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
                              <center><img src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
assets/images/aomq-1496392241-ojk-indone.png" width="150"></center>
                              <br><br>
                           </div> -->
                        </div>
                     </div>
                  </div>

                  <div class="bottom">
                     <div class="container">
                        <!-- <div class="logo pull-left">
                           <a href="index.html" title="Jasindo Travel - home">
                               <img src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
images/logo.png" alt="Jasindo Travel HTML5 Template">
                           </a>
                           </div> -->
                        <div class="pull-right">
                           <a id="back-to-top" href="#" class="animated" data-animation-type="bounce"><i class="soap-icon-longarrow-up circle"></i></a>
                        </div>
                        <div class="copyright pull-right">
                           <p>© <?php echo $_smarty_tpl->tpl_vars['year_now']->value;?>
 Bintang Wisata</p>
                        </div>
                     </div>
                  </div>
               </footer><?php }} ?>
