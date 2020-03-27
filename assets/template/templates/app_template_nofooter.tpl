<!DOCTYPE html>
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
            <title>{$site_title}</title>
            <!-- Meta Tags -->
            <meta charset="utf-8">
            <meta name="keywords" content="Jasindo, Travel, Asuransi, Perjalanan, Indonesia" />
            <meta name="description" content="Jasindo Travel Insurance Merupakan Asuransi Perjalanan yang memberikan manfaat pelayanan biaya medis (rawat inap dan rawat jalan), bantuan darurat di seluruh dunia , perlindungan kecelakaan diri dan santunan meninggal dunia karena kecelakaan, dan ketidaknyamanan perjalanan (termasuk pembatalan perjalanan dan kehilangan bagasi) untuk wisatawan yang akan melakukan perjalanan lintas negeri (domestic) maupun lintas Negara (internasional). ">
            <meta name="author" content="Jasindo Travel">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <!-- Theme Styles -->
            <link rel="stylesheet" href="{$assets_url}css/bootstrap.min.css">
            <link rel="stylesheet" href="{$assets_url}css/font-awesome.min.css">
            <link href='https://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>
            <link rel="stylesheet" href="{$assets_url}css/animate.min.css">
            <!-- Current Page Styles -->
            <link rel="stylesheet" type="text/css" href="{$assets_url}components/revolution_slider/css/settings.css" media="screen" />
            <link rel="stylesheet" type="text/css" href="{$assets_url}components/revolution_slider/css/style.css" media="screen" />
            <link rel="stylesheet" type="text/css" href="{$assets_url}components/jquery.bxslider/jquery.bxslider.css" media="screen" />
            <link rel="stylesheet" type="text/css" href="{$assets_url}components/flexslider/flexslider.css" media="screen" />
            <!-- Main Style -->
            <link id="main-style" rel="stylesheet" href="{$assets_url}css/style.css">
            <!-- Custom Styles -->
            <link rel="stylesheet" href="{$assets_url}css/custom.css">
            <!-- Updated Styles -->
            <link rel="stylesheet" href="{$assets_url}css/updates.css">
            <!-- Responsive Styles -->
            <link rel="stylesheet" href="{$assets_url}css/responsive.css">
            <link rel="stylesheet" type="text/css" href="{$assets_url}jslibs/popdown/css/jquery.popdown.css">
            <!-- CSS for IE -->
            <!--[if lte IE 9]>
            <link rel="stylesheet" type="text/css" href="{$assets_url}css/ie.css" />
            <![endif]-->
            <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
            <!--[if lt IE 9]>
            <script type='text/javascript' src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
            <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.js"></script>
            <![endif]-->
            <style type="text/css">
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
               background-image: url({$base_url}assets/images/sprite.png);
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
    </style>

    <script type="text/javascript">
    var SITE_URL = '{$site_url}';
    </script>
            <script type="text/javascript" src="{$assets_url}js/jquery-1.11.1.min.js"></script>
         </head>
         <body>
            <div id="page-wrapper">
               <header id="header" class="navbar-static-top">
                  <!-- <div class="topnav hidden-xs">
                     <div class="container">
                         <ul class="quick-menu pull-left">
                             <li><a href="#">MY ACCOUNT</a></li>
                             <li class="ribbon">
                                 <a href="#">English</a>
                                 <ul class="menu mini">
                                     <li><a href="#" title="Dansk">Dansk</a></li>
                                     <li><a href="#" title="Deutsch">Deutsch</a></li>
                                     <li class="active"><a href="#" title="English">English</a></li>
                                     <li><a href="#" title="Español">Español</a></li>
                                     <li><a href="#" title="Français">Français</a></li>
                                     <li><a href="#" title="Italiano">Italiano</a></li>
                                     <li><a href="#" title="Magyar">Magyar</a></li>
                                     <li><a href="#" title="Nederlands">Nederlands</a></li>
                                     <li><a href="#" title="Norsk">Norsk</a></li>
                                     <li><a href="#" title="Polski">Polski</a></li>
                                     <li><a href="#" title="Português">Português</a></li>
                                     <li><a href="#" title="Suomi">Suomi</a></li>
                                     <li><a href="#" title="Svenska">Svenska</a></li>
                                 </ul>
                             </li>
                         </ul>
                         <ul class="quick-menu pull-right">
                             <li><a href="#travelo-login" class="soap-popupbox">LOGIN</a></li>
                             <li><a href="#travelo-signup" class="soap-popupbox">SIGNUP</a></li>
                             <li class="ribbon currency">
                                 <a href="#" title="">USD</a>
                                 <ul class="menu mini">
                                     <li><a href="#" title="AUD">AUD</a></li>
                                     <li><a href="#" title="BRL">BRL</a></li>
                                     <li class="active"><a href="#" title="USD">USD</a></li>
                                     <li><a href="#" title="CAD">CAD</a></li>
                                     <li><a href="#" title="CHF">CHF</a></li>
                                     <li><a href="#" title="CNY">CNY</a></li>
                                     <li><a href="#" title="CZK">CZK</a></li>
                                     <li><a href="#" title="DKK">DKK</a></li>
                                     <li><a href="#" title="EUR">EUR</a></li>
                                     <li><a href="#" title="GBP">GBP</a></li>
                                     <li><a href="#" title="HKD">HKD</a></li>
                                     <li><a href="#" title="HUF">HUF</a></li>
                                     <li><a href="#" title="IDR">IDR</a></li>
                                 </ul>
                             </li>
                         </ul>
                     </div>
                     </div> -->
                  <div class="main-header">
                     {include file="{$header_tpl}"}
                  </div>
               </header>
               <p>&nbsp;</p>

               {if $slideshow eq true}
                {include file="slideshow_banner.tpl"}
               {/if}

               <section id="content" {$home_opt}>
                  <div class="container">
                    {include file="$content_tpl"}
                    <div id="content_div"></div>
                  </div>
               </section>

               <footer id="footer" style="margin-top:-100px; {$footer_display}">
                  
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
                           <p>© {$year_now} Jasindo Travel</p>
                        </div>
                     </div>
                  </div>
               </footer>
            </div>
            <!-- Javascript -->
            
            <script type="text/javascript" src="{$assets_url}js/jquery.noconflict.js"></script>
            <script type="text/javascript" src="{$assets_url}js/modernizr.2.7.1.min.js"></script>
            <script type="text/javascript" src="{$assets_url}js/jquery-migrate-1.2.1.min.js"></script>
            <script type="text/javascript" src="{$assets_url}js/jquery.placeholder.js"></script>
            <script type="text/javascript" src="{$assets_url}js/jquery-ui.1.10.4.min.js"></script>
            <script src="{$assets_url}jslibs/popdown/lib/jquery.popdown.js"></script>
           
               
            <!-- Twitter Bootstrap -->
            <script type="text/javascript" src="{$assets_url}js/bootstrap.js"></script>
            <!-- load revolution slider scripts -->
            <script type="text/javascript" src="{$assets_url}components/revolution_slider/js/jquery.themepunch.plugins.min.js"></script>
            <script type="text/javascript" src="{$assets_url}components/revolution_slider/js/jquery.themepunch.revolution.min.js"></script>
            <!-- Flex Slider -->
            <script type="text/javascript" src="{$assets_url}components/flexslider/jquery.flexslider-min.js"></script>
            <!-- load BXSlider scripts -->
            <script type="text/javascript" src="{$assets_url}components/jquery.bxslider/jquery.bxslider.min.js"></script>
            <!-- parallax -->
            <script type="text/javascript" src="{$assets_url}js/jquery.stellar.min.js"></script>
            <!-- waypoint -->
            <script type="text/javascript" src="{$assets_url}js/waypoints.min.js"></script>
            <!-- load page Javascript -->
            <script type="text/javascript" src="{$assets_url}js/theme-scripts.js"></script>
            <script type="text/javascript" src="{$assets_url}js/scripts.js"></script>

            <script type="text/javascript" src="{$base_url}assets/js/typeahead.js"></script>
            <script type="text/javascript">
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

                   

               });

            </script>

<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5cc7b60bd07d7e0c639134d6/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
         </body>
      </html>