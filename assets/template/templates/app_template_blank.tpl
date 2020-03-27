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
            

                  <div class="container">
                    {include file="$content_tpl"}
                    <div id="content_div"></div>
                  </div>

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
         </body>
      </html>