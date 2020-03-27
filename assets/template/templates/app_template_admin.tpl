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
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <!-- Theme Styles -->
            <link rel="stylesheet" href="{$assets_url}css/bootstrap.min.css">
            <link rel="stylesheet" href="{$assets_url}css/font-awesome.min.css">
            <!-- <link href='https://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'> -->
            <link rel="stylesheet" href="{$assets_url}css/animate.min.css">
            <!-- Current Page Styles -->
          
            <!-- Main Style -->
            <link id="main-style" rel="stylesheet" href="{$assets_url}css/style.css">
            <!-- Custom Styles -->
            <link rel="stylesheet" href="{$assets_url}css/custom.css">
            <!-- Updated Styles -->
            <link rel="stylesheet" href="{$assets_url}css/updates.css">
            <!-- Responsive Styles -->
            <link rel="stylesheet" href="{$assets_url}css/responsive.css">
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



    <script src='{$base_url}/assets/js/ext/ext-all.js'></script>
    <script src='{$base_url}/assets/js/ext/ext-theme-neptune.js'></script>
    <script src='{$base_url}/assets/js/SearchField4.js'></script>
    <link href="{$base_url}/assets/js/ext/resources/css/ext-all-neptune.css" rel="stylesheet">

    <script type="text/javascript">
    var SITE_URL = '{$site_url}';
    var dir_sys = '{$dir_app}/assets.js.app.';

    </script>

    <style type="text/css">
      #page-wrapper {
      position: relative;
      overflow: visible;
      background-color: #FFF;
    }
    </style>
            <script type="text/javascript" src="{$assets_url}js/jquery-1.11.1.min.js"></script>
         </head>
         <body >
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

               <section id="content" {$home_opt} style="padding-top: 0px;">
                  <div class="container">
                    {include file="$content_tpl"}
                    <div id="content_div"></div>

                    <p>&nbsp;</p>
                     <div id="content_div2"></div>
                  </div>
               </section>
               
            </div>

            <script type="text/javascript">            
                function goBack() {
                    window.history.back();
                }
            </script>
         </body>
      </html>