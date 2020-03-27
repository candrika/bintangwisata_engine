<?php /* Smarty version Smarty-3.1.15, created on 2020-03-26 00:32:19
         compiled from "C:\xampp\htdocs\bintangw\assets\template\templates\login.tpl" */ ?>
<?php /*%%SmartyHeaderCode:13352289355e7bea03c8ad48-10730750%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '56b64f133d21b53b6c1bad61668fc0249a3683eb' => 
    array (
      0 => 'C:\\xampp\\htdocs\\bintangw\\assets\\template\\templates\\login.tpl',
      1 => 1561901699,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '13352289355e7bea03c8ad48-10730750',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'site_url' => 0,
    'message' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5e7bea03d7e943_86358447',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5e7bea03d7e943_86358447')) {function content_5e7bea03d7e943_86358447($_smarty_tpl) {?> <style>
        h1 {
            font-size: 20px;
            color: #111;
        }


         /* Mobile Styles */
         @media only screen and (min-width: 300px) and (max-width: 1324px) {
           .center_home_content {
               padding: 30px 0px 0px 0px;
               width: 100%; 
               margin: auto;
           }
           .container {
                margin-right: auto;
                margin-left: auto;
                padding-left: 0px;
                padding-right: 0px;
            }
         }

         @media only screen and (min-width: 1325px) {
           .center_home_content {
               padding: 30px 0px 0px 0px;
               width: 50%; 
               margin: auto;
           }
         }

 </style>

<div class="center_home_content">
                        <div class="contact-form">

                   </div>



                             <form class="login" action="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/login/check" method="post">
                                <div class="row">

                                    <div class="col-sm-12">
                                        <div class="search-box-wrapper style1">
                              <div class="search-box">
                                 <div class="search-tab-content  container-content-shadow" style="">
                                   
                                    <div class="tab-pane fade active in" id="flights-tab">
                                       
                                          <div class="title-container">
                                             <h2 class="search-title">Masuk Ke Dalam Akun Anda</h2>
                                             <!-- <p>Ensure Your Travel.</p> -->
                                             <i class="soap-icon-plane-right takeoff-effect"></i>
                                          </div>
                                          <div class="search-content">
                                                
                                                <form class="login-form" action="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/login/check" method="post">
                                                        <div class="form-group input-login">
                                                            <label>Email</label>
                                                            <input type="text" name="email" class="input-text input-large full-width" placeholder="enter your email">
                                                        </div>
                                                        <div class="form-group input-password">
                                                            <label>Password</label>
                                                            <input type="password" name="password" class="input-text input-large full-width" placeholder="enter your password">
                                                        </div>
                                                        <?php if ($_smarty_tpl->tpl_vars['message']->value!=null) {?>
                                                        <div class="alert alert-notice">
                                                           <?php echo $_smarty_tpl->tpl_vars['message']->value;?>

                                                        </div>
                                                        <?php }?>
                                                        <button type="submit" class="btn-large full-width yellow">
                                                            Masuk
                                                            <i class="soap-icon-check circle"></i>
                                                        </button>
                                                       
                                                        <center>
                                                        <button id="forgot_btn" class="btn-medium sky-blue1" style="margin-top:10px;">
                                                            Lupa Kata Kunci?
                                                        </button>

                                                         <button id="register_btn" class="btn-medium sky-blue1" style="margin-top:10px;">
                                                            Belum Punya Akun? Daftar Disini!
                                                        </button>
                                                    </form>
                                          </div>
                                       
                                    </div>
                                 </div>
                              </div>
                           </div>
                                    </div>

                                </div></form>
                            
                        </div>

<script type="text/javascript">
$( "#forgot_btn" ).click(function( event ) {
  event.preventDefault();
  window.location = SITE_URL+'/login/forgot';
});

$( "#register_btn" ).click(function( event ) {
  event.preventDefault();
  window.location = SITE_URL+'/register';
});
</script><?php }} ?>
