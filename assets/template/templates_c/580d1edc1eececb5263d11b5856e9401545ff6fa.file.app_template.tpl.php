<?php /* Smarty version Smarty-3.1.15, created on 2020-03-26 00:40:37
         compiled from "C:\xampp\htdocs\bintangw\assets\template\templates\app_template.tpl" */ ?>
<?php /*%%SmartyHeaderCode:179204485e7bebf5b9f6f3-86575305%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '580d1edc1eececb5263d11b5856e9401545ff6fa' => 
    array (
      0 => 'C:\\xampp\\htdocs\\bintangw\\assets\\template\\templates\\app_template.tpl',
      1 => 1585037142,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '179204485e7bebf5b9f6f3-86575305',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'site_title' => 0,
    'base_url' => 0,
    'site_keywords' => 0,
    'site_description' => 0,
    'assets_url' => 0,
    'site_url' => 0,
    'header_tpl' => 0,
    'slideshow' => 0,
    'home_opt' => 0,
    'content_tpl' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5e7bebf60f1209_04701837',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5e7bebf60f1209_04701837')) {function content_5e7bebf60f1209_04701837($_smarty_tpl) {?><!DOCTYPE html>
<!--[if IE 8]>          
<html class="ie ie8">
   <![endif]-->
   <!--[if IE 9]>          
   <html class="ie ie9">
      <![endif]-->
      <!--[if gt IE 9]><!-->
      <html>
         <!--<![endif]-->
         <head>
            <!-- Page Title -->
            <title><?php echo $_smarty_tpl->tpl_vars['site_title']->value;?>
</title>
            <!-- Meta Tags -->
            <link rel="icon" href="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/assets/images/cropped-LOGO-BARU-BINTANG-WISATA-32x32.png">
            <meta charset="utf-8">
            <meta name="keywords" content="<?php echo $_smarty_tpl->tpl_vars['site_keywords']->value;?>
" />
            <meta name="description" content="<?php echo $_smarty_tpl->tpl_vars['site_description']->value;?>
">
            <meta name="author" content="bintang wisata">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/> -->
            <link rel="alternate" hreflang="ID" href="https://www.bintangwisata.co.id">
            <!-- Theme Styles -->
            <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
css/bootstrap.min.css">
            <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
css/font-awesome.min.css">
            <link href='https://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>
            <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
css/animate.min.css">
            <!-- Current Page Styles -->
            <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
components/revolution_slider/css/settings.css" media="screen" />
            <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
components/revolution_slider/css/style.css" media="screen" />
            <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
components/jquery.bxslider/jquery.bxslider.css" media="screen" />
            <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
components/flexslider/flexslider.css" media="screen" />
            <!-- Main Style -->
            <link id="main-style" rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
css/style.css">
            <!-- Custom Styles -->
            <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
css/custom.css">
            <!-- Updated Styles -->
            <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
css/updates.css">
            <!-- Responsive Styles -->
            <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
css/responsive.css">
            <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
jslibs/popdown/css/jquery.popdown.css">
            <!-- CSS for IE -->
            <!--[if lte IE 9]>
            <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
css/ie.css" />
            <![endif]-->
            <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
            <!--[if lt IE 9]>
            <script type='text/javascript' src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
            <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.js"></script>
            <![endif]-->
            <style type="text/css">
            /*loading bar*/
            /* The snackbar - position it at the bottom and in the middle of the screen */
              #snackbar {
                  visibility: hidden; /* Hidden by default. Visible on click */
                  min-width: 250px; /* Set a default minimum width */
                  margin-left: -125px; /* Divide value of min-width by 2 */
                  background-color: #fdb714; /* Black background color */
                  color: #fff; /* White text color */
                  text-align: center; /* Centered text */
                  border-radius: 2px; /* Rounded borders */
                  font-weight: 'bold';
                  padding: 16px; /* Padding */
                  position: fixed; /* Sit on top of the screen */
                  z-index: 1; /* Add a z-index if needed */
                  left: 50%; /* Center the snackbar */
                  bottom: 100px; /* 30px from the bottom */
              }

              /* Show the snackbar when clicking on a button (class added with JavaScript) */
              #snackbar.show {
                  visibility: visible; /* Show the snackbar */

              /* Add animation: Take 0.5 seconds to fade in and out the snackbar. 
              However, delay the fade out process for 2.5 seconds */
                  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                  animation: fadein 0.5s, fadeout 0.5s 2.5s;
              }

              /* Animations to fade the snackbar in and out */
              @-webkit-keyframes fadein {
                  from { bottom: 0; opacity: 0; } 
                  to { bottom: 100px; opacity: 1; }
              }

              @keyframes fadein {
                  from { bottom: 0; opacity: 0; }
                  to { bottom: 100px; opacity: 1; }
              }

              @-webkit-keyframes fadeout {
                  from { bottom: 100px; opacity: 1; } 
                  to { bottom: 0; opacity: 0; }
              }

              @keyframes fadeout {
                  from { bottom: 100px; opacity: 1; }
                  to { bottom: 0; opacity: 0; }
              }
            /*end loading bar*/

             .payment_logo {
                  margin-top: 5px;
                  margin-bottom: 5px;
                  margin-right: 5px;
                  margin-left: 5px;
              }
               .customer-care .icon-box {
               width: 46px;
               /*margin-right: 8px;*/
               /*float: left;*/
               /*padding-top: 10px;*/
               }
               .customer-care .icon-box .icon {
               width: 46px;
               height: 46px;
               -webkit-background-size: 525px 300px;
               /*background-size: 525px 300px;*/
               background-position: 0 -42px;
               }
               .customer-care .detail {
               /*float: left;*/
               }
               .customer-care .icon-box .icon {
               background-color: transparent;
               background-image: url(<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
assets/images/sprite.png);
               background-repeat: no-repeat;
               display: inline-block;
               }
                   .tt-hint,
        .city {
            /*border: 2px solid #CCCCCC;*/
          /*  border-radius: 8px 8px 8px 8px;
            font-size: 24px;
            height: 45px;
            line-height: 30px;
            outline: medium none;
            padding: 8px 12px;
            width: 400px;*/
        }

        .tt-dropdown-menu {
            width: 200px;
            margin-top: 10px;
            padding: 1px 10px;
            background-color: #fff;
            border: 1px solid #ccc;
            border: 1px solid rgba(0, 0, 0, 0.2);
            border-radius: 8px 8px 8px 8px;
            font-size: 12px;
            color: #111;
            /*background-color: #F1F1F1;*/
        }

        .search-box-wrapper.style1 .search-tab-content {
          margin-top: 30px;
          margin-bottom: 30px;
          background: #ffffff;
          float: left;
          width: 100%;
          padding: 0;
          border-radius: 10px;
      }
      .search-box-wrapper.style1 .search-tab-content .title-container {
          background: #4bb7f2;
          padding: 15px 40px 0 25px;
          /*height: 60px;*/
          position: relative;
          border-radius: 10px;
      }
      .travelo-box {
          margin-top: 30px;
          background: #fff;
          padding: 20px;
          margin-bottom: 30px;
          border-radius: 10px;
      }
      .icon-box.style1 {
    height: 42px;
    background: #fff;
    line-height: 42px;
    /* font-size: 0.9167em; */
    font-weight: bold;
}

.container-content-shadow {
  background: #fff; 
  box-shadow: 0 1px 2px 0 rgba(0,0,0,.23), 0 1px 5px 0 rgba(0,0,0,.16);  
  border-radius: 20px;
}
    </style>
    
    <script type="text/javascript">
    var SITE_URL = '<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
';
    </script>
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
js/jquery-1.11.1.min.js"></script>
         </head>
         <body>
            <div id="page-wrapper">
               <header id="header" class="navbar-static-top">
                  <div class="main-header">
                     <?php echo $_smarty_tpl->getSubTemplate (((string)$_smarty_tpl->tpl_vars['header_tpl']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

                  </div>
               </header>
               <!-- <p>&nbsp;</p> -->

               <?php if ($_smarty_tpl->tpl_vars['slideshow']->value==true) {?>
                <?php echo $_smarty_tpl->getSubTemplate ("slideshow_banner.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

               <?php }?>

               <section id="content" <?php echo $_smarty_tpl->tpl_vars['home_opt']->value;?>
 class='image-bg1'>
                  <div class="container">
                    <?php if ($_smarty_tpl->tpl_vars['content_tpl']->value!=null) {?>
                      <?php echo $_smarty_tpl->getSubTemplate (((string)$_smarty_tpl->tpl_vars['content_tpl']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

                    <?php }?>
                    <div id="content_div"></div>
                    
                  </div>
                  <div id="snackbar">Sedang memproses. Dimohon untuk menunggu...</div>
               </section>

               <?php echo $_smarty_tpl->getSubTemplate ("footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

            </div>
            <!-- Javascript -->
            <!--<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>-->
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
js/jquery.noconflict.js"></script>
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
js/modernizr.2.7.1.min.js"></script>
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
js/jquery-migrate-1.2.1.min.js"></script>
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
js/jquery.placeholder.js"></script>
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
js/jquery-ui.1.10.4.min.js"></script>
            <script src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
jslibs/popdown/lib/jquery.popdown.js"></script>
           
               
            <!-- Twitter Bootstrap -->
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
js/bootstrap.js"></script>
            <!-- load revolution slider scripts -->
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
components/revolution_slider/js/jquery.themepunch.plugins.min.js"></script>
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
components/revolution_slider/js/jquery.themepunch.revolution.min.js"></script>
            <!-- Flex Slider -->
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
components/flexslider/jquery.flexslider-min.js"></script>
            <!-- load BXSlider scripts -->
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
components/jquery.bxslider/jquery.bxslider.min.js"></script>
            <!-- parallax -->
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
js/jquery.stellar.min.js"></script>
            <!-- waypoint -->
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
js/waypoints.min.js"></script>
            <!-- load page Javascript -->
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
js/theme-scripts.js"></script>
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['assets_url']->value;?>
js/scripts.js"></script>
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
assets/js/typeahead.js"></script>
            <script type="text/javascript">


var oldXHR = window.XMLHttpRequest;

              function newXHR() {
                  var x = document.getElementById("snackbar")
                  var realXHR = new oldXHR();
                  realXHR.addEventListener("readystatechange", function() {
                      if(realXHR.readyState==1){
                        // $('#snackbar').show();
                        x.className = "show";
                          // $('#snackbar').html("server connection established");
                          // alert('server connection established');
                      }
                      if(realXHR.readyState==2){
                       // $('#snackbar').show();
                      x.className = "show";
                       // $('#snackbar').html("request received");
                          // alert('request received');
                      }
                      if(realXHR.readyState==3){
                        x.className = "show";
                       // $('#snackbar').show();
                       // $('#snackbar').html("processing request");
                          // alert('processing request');
                      }
                      if(realXHR.readyState==4){
                       // $('#snackbar').html("request finished and response is ready");
                        x.className = x.className.replace("show", "");
                       // $('#loading_top_bar').hide();
                          // alert('request finished and response is ready');
                      }
                  }, false);

                  return realXHR;
              }

               function packageList() {
               
               }
               
                tjq(document).ready(function() {
                   tjq('.revolution-slider').revolution({
                       // options: true,
                       adaptiveHeight: true,
                       // mode: 'horizontal',
                       // // dottedOverlay: "none",
                       delay: 2050,
                       // startwidth: 1704,
                       // startheight: 648,
                       // onHoverStop: "on",
                       // // hideThumbs: 10,
                       // fullWidth: "on",
                       forceFullWidth: "on",
                       // navigationType: "none",
                       // shadow: 0,
                       spinner: "spinner4",
                       hideTimerBar: "on",
                   });

                   try {
                        $("input[type='text']").each(function(){
                                       $(this).attr("autocomplete","off");
                                    });
                    }
                    catch (e)
                    { }
               });

                window.XMLHttpRequest = newXHR;

            </script>

<!--Start of Tawk.to Script-->

<!--End of Tawk.to Script-->

         </body>
      </html><?php }} ?>
