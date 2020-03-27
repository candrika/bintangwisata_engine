<!DOCTYPE html>
<!--[if IE 8]>          <html class="ie ie8"> <![endif]-->
<!--[if IE 9]>          <html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->  <html class=""> <!--<![endif]-->
<head>
    <!-- Page Title -->
    <!-- <title>Travelo | Responsive HTML5 Travel Template</title> -->
    
    <!-- Meta Tags -->
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Theme Styles -->
    <link rel="stylesheet" href="<?=base_url()?>/assets/tpl/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?=base_url()?>/assets/tpl/css/font-awesome.min.css">
    <link rel="stylesheet" href="<?=base_url()?>/assets/tpl/css/animate.min.css">
    
    <!-- Main Style -->
    <link id="main-style" rel="stylesheet" href="<?=base_url()?>/assets/tpl/css/style.css">
    
    <!-- Custom Styles -->
    <link rel="stylesheet" href="<?=base_url()?>/assets/tpl/css/custom.css">

    <!-- Updated Styles -->
    <link rel="stylesheet" href="<?=base_url()?>/assets/tpl/css/updates.css">
    
    <!-- Responsive Styles -->
    <link rel="stylesheet" href="<?=base_url()?>/assets/tpl/css/responsive.css">
    
    <!-- CSS for IE -->
    <!--[if lte IE 9]>
        <link rel="stylesheet" type="text/css" href="<?=base_url()?>/assets/tpl/css/ie.css" />
    <![endif]-->
    
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type='text/javascript' src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
      <script type='text/javascript' src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.js"></script>
    <![endif]-->
</head>
<body class="coming-soon-page style1 body-blank">
	<img src="cid:logo.png" border="0">
    <div id="page-wrapper" class="wrapper-blank">
        <div class="wrapper">
            <section id="content" style="background: #fff;">
                <div class="container">
                    <div id="main">
                        <h1 class="logo block">
                            <a href="<?=site_url()?>">
                                <img src="<?=base_url()?>/assets/tpl/images/logo.png" width="150"/>
                            </a>
                        </h1>
                        <div class="text-center yellow-color box" style="font-size: 2em; font-weight: 300; line-height: 1em;">Selamat!</div>
                        <p class="light-blue-color block" style="font-size: 1.3333em;">Anda telah mengajukan klaim asuransi Jasindo Travel dengan informasi sebagai berikut:</p>
                        <div class="col-sm-8 col-md-6 col-lg-5 no-float no-padding center-block">
                            <ul class="clock block clearfix">
                                <li>
                                    <h5>No Klaim : <?=$d['no_claim']?></h5>
                                </li>
                                <li>
                                    <h5>No Polis : <?=$policy_no?></h5>
                                </li>
                                <li>
                                    <h5>Diajukan Oleh : <?=$d['diajukan_oleh']?></h5>
                                </li>
                                <li>
                                    <h5>Hubungan : <?=$d['hub_insured']?></h5>
                                </li>
                                <li>
                                    <h5>Alamat Pemohon : <?=$d['alamat_pemohon']?></h5>
                                </li>
                                <li>
                                    <h5>Jenis Klaim : <?=$d['claim_type_name']?></h5>
                                </li>

                            </ul>
                          <!--   <ul class="social-icons clearfix inline-block box">
                                <li><a href="#" title="Twitter" data-toggle="tooltip"><i class="soap-icon-twitter"></i></a></li>
                                <li><a href="#" title="GooglePlus" data-toggle="tooltip"><i class="soap-icon-googleplus"></i></a></li>
                                <li><a href="#" title="Facebook" data-toggle="tooltip"><i class="soap-icon-facebook"></i></a></li>
                                <li><a href="#" title="Linkedin" data-toggle="tooltip"><i class="soap-icon-linkedin"></i></a></li>
                                <li><a href="#" title="Vimeo" data-toggle="tooltip"><i class="soap-icon-vimeo"></i></a></li>
                                <li><a href="#" title="Dribble" data-toggle="tooltip"><i class="soap-icon-dribble"></i></a></li>
                                <li><a href="#" title="Flickr" data-toggle="tooltip"><i class="soap-icon-flickr"></i></a></li>
                            </ul> -->
                            <div class="copyright" style=" margin-top: 20%;">
                                <p>&copy; <?=date('Y')?> Jasindo Travel</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>


    <!-- Javascript -->

</body>
</html>

