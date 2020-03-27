<?php /* Smarty version Smarty-3.1.15, created on 2020-03-26 00:40:38
         compiled from "C:\xampp\htdocs\bintangw\assets\template\templates\header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:6208852115e7bebf612fa18-60966375%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8b7b5d222b7b185a56e94bf53237b96f956e3fb6' => 
    array (
      0 => 'C:\\xampp\\htdocs\\bintangw\\assets\\template\\templates\\header.tpl',
      1 => 1585040370,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '6208852115e7bebf612fa18-60966375',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'site_url' => 0,
    'base_url' => 0,
    'logged' => 0,
    'user_type_id' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5e7bebf63eae37_52232119',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5e7bebf63eae37_52232119')) {function content_5e7bebf63eae37_52232119($_smarty_tpl) {?><!-- <a href="#mobile-menu-01" data-toggle="collapse" class="mobile-menu-toggle"> -->
                     <!-- Mobile Menu Toggle -->
                     </a>
                     <div class="container">
                        <h1 class="navbar-brand">
                           <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
" title="bintangwisata">
                           <img src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/assets/images/tes-logo-BW1.png" alt="" style="width: 209px;";/>
                           </a>
                        </h1>
                        <nav id="main-menu">
                           <ul class="menu">
                              <li>
                                 <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
">Pesawat</a>
                              </li>
                               <li>
                                 <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/page/benefit_jasindo_travel">Topup</a>
                              </li>
                               <li>
                                 <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/page/cara_pembayaran">PPOB</a>
                              </li>
                               <li>
                                
                              </li>
                              <!-- <li>
                                 <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/page/klaim_jasindo_travel">Klaim</a>
                              </li>
                              <li>
                                 <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/intermediary/register">Intermediary</a>
                              </li> -->
                              <li>
                                  <a href="#">Tentang Kami</a>
                                   <ul>
                                      <!--  <li> <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/page/tentang_jasindo_travel">Tentang Jasindo Travel</a></li>
                                       <li> <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/page/syarat_dan_ketentuan">Syarat dan Ketentuan</a></li>
                                       <li> <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/page/hubungi_kami">Hubungi Kami</a></li> -->
                                   </ul>
                              </li>
                              <?php if ($_smarty_tpl->tpl_vars['logged']->value==true) {?>
                              <li>
                                <?php if ($_smarty_tpl->tpl_vars['user_type_id']->value==4) {?>

                                 <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/intermediary/profile_intermediary">My Profile</a>                           
                                <?php } else { ?>
                                 <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/user_panel">My Profile</a>                           
                                <?php }?>
                              </li>
                              <?php }?>

                              <li>
                                 <?php if ($_smarty_tpl->tpl_vars['logged']->value==true) {?>
                                    <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/logout">Logout</a>
                                 <?php } else { ?>
                                 
                                    <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/login"><button class="btn-medium sky-blue1">LOGIN</button></a>
                                 <?php }?>                                 
                              </li>
                           </ul>
                        </nav>
                     </div>
                     <!-- <nav id="mobile-menu-01" class="mobile-menu collapse"> -->
                        <!-- <ul id="mobile-primary-menu" class="menu"> -->
                           <!-- <li class=" "> -->
                                <!-- <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
" title="Jasindo Travel"> -->
                           <!-- <img src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/assets/images/jasindotravel_trans.png" alt="" /> -->
                           <!-- </a> -->
                              <!-- </li> -->
                            <!--   <li class="menu-item-has-children">
                                 <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/page/paket_asuransi">Paket Asuransi</a>
                              </li> -->
                              <!-- </li> -->
                               <!-- <li class="menu-item-has-children">
                                 <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/page/benefit_jasindo_travel">Benefit</a>
                              </li>
                               <li class="menu-item-has-children">
                                 <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/page/syarat_dan_ketentuan">Syarat dan Ketentuan</a>
                              </li>
                              <li class="menu-item-has-children">
                                 <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/page/klaim_jasindo_travel">Klaim</a>
                              </li>
                              <li class="menu-item-has-children">
                                 <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/page/tentang_jasindo_travel">Tentang Jasindo Travel</a>
                              </li>
                              <li class="menu-item-has-children">
                                 <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/page/hubungi_kami">Hubungi Kami</a>
                              </li> -->
                              <?php if ($_smarty_tpl->tpl_vars['logged']->value==true) {?>
                              <!-- <li class="menu-item-has-children"> -->
                                  <?php if ($_smarty_tpl->tpl_vars['user_type_id']->value==4) {?>

                                 <!-- <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/intermediary/profile_intermediary">My Profile</a>                            -->
                                <?php } else { ?>
                                 <!-- <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/user_panel">My Profile</a>                            -->
                                <?php }?>                           
                              <!-- </li> -->
                              <?php }?>   
                              <!-- <li class="menu-item-has-children"> -->
                                 <?php if ($_smarty_tpl->tpl_vars['logged']->value==true) {?>
                                    <!-- <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/logout">Logout</a> -->
                                 <?php } else { ?>
                                 
                                    <!-- <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/login">LOGIN</a> -->
                                 <?php }?>                                 
                              <!-- </li> -->
                        <!-- </ul> -->
                     <!-- </nav> --><?php }} ?>
