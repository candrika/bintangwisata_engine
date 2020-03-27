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
                        
                        <div class="booking-information travelo-box">
                            <h2>Konfirmasi Pemesanan</h2>
                            <hr>
                             <?php
                            if($mode!=='preview' && $mode!=='email_confirm'){
                                ?>
                            
                            
                                    <div class="booking-confirmation clearfix">
                                        <i class="soap-icon-recommend icon circle"></i>
                                        <div class="message">
                                            <h4 class="main-message">Thank You. Your Order is Confirmed Now.</h4>
                                            <p>A confirmation email has been sent to your provided email address.</p>
                                        </div>
                                    </div>
                                    <?php
                                } else {
                                    ?>
                                    <div class="booking-confirmation clearfix">
                                        <i class="soap-icon-recommend icon circle"></i>
                                        <div class="message">
                                            <h4 class="main-message">Thank You. Your Order is Confirmed Now.</h4>
                                            <p>Here is your detail order.</p>
                                        </div>
                                    </div>
                                    <?php
                                }
                                ?>
                            <hr>
                            <h2>Informasi Tertanggung</h2>
                            <dl class="term-description">
                                <dt>Order number:</dt>
                                <dd><?=$d['order_no']?></dd>
                                <dt>First name:</dt>
                                <dd><?=$d['firstname']?></dd>
                                <dt>Last name:</dt>
                                <dd><?=$d['lastname']?></dd>
                                <dt>E-mail address:</dt>
                                <dd><?=$d['email']?></dd>
                                <dt>Street Address and number:</dt>
                                <dd><?=$d['address']?></dd>
                                <dt>Town / City:</dt>
                                <dd><?=$d['city']?></dd>
                                <dt>ZIP code:</dt>
                                <dd><?=$d['zipcode']?></dd>
                                <dt>Country:</dt>
                                <dd><?=$d['country_name']?></dd>
                            </dl>
                            <hr>
                            <h2>Informasi Pemesanan</h2>
                            <dl class="term-description">
                                <dt>Keberangkatan:</dt>
                                <dd><?=$d['depart_name']?></dd>
                                <dt>Tujuan:</dt>
                                <dd><?=$d['dest_name']?></dd>
                                 <dt>Regional:</dt>
                                <dd><?=$d['region_name_detail']?></dd>
                                <dt>Mulai Tanggal:</dt>
                                <dd><?=$d['startdate']?></dd>
                                <dt>Sampai Tanggal:</dt>
                                <dd><?=$d['enddate']?></dd>
                                <dt>Kategori:</dt>
                                <dd><?=$d['category']?></dd>
                                <dt>Tipe:</dt>
                                <dd><?=$d['type']?></dd>
                                <dt>Total Premi:</dt>
                                <dd><?=number_format($d['total_premi'])?></dd>
                                <dt>Total Premi Perluasan:</dt>
                                <dd><?=number_format($d['total_perluasan'])?></dd>
                                <dt>Biaya Polis dan Materai:</dt>
                                <dd><?=number_format($d['other_fee'])?></dd>
                                <dt>Biaya Transaksi:</dt>
                                <dd><?=number_format($d['payment_fee'])?></dd>
                                <dt>Total Pembayaran:</dt>
                                <dd><?=number_format($d['total_amount'])?></dd>
                                <dt>Status Pemesanan:</dt>
                                <dd><?=$d['status']?></dd>
                            </dl>


                            <?php
                            if($mode!=='preview'){
                                ?>
                            <hr>
                            <h2>Payment</h2>
                            <!-- <p>Pembayaran via  <img src="<?=base_url()?>/assets/images/midtrans.png" height="25">.</p> -->
                            <br>
                            <div class="col-sm-6 col-md-11">
                              <h4>Pembayaran yang didukung:</h4>
                              <img src="<?=base_url()?>/assets/tpl/images/atmbersama.png" height="25">
                              <img src="<?=base_url()?>/assets/tpl/images/logoprima.jpg" height="25">&nbsp;
                              <img src="<?=base_url()?>/assets/tpl/images/logobca.png" height="25">&nbsp;
                              <img src="<?=base_url()?>/assets/tpl/images/klikbca.png" height="25">&nbsp;
                              <img src="<?=base_url()?>/assets/tpl/images/logomandiri.png" height="25">&nbsp;
                              <img src="<?=base_url()?>/assets/tpl/images/logobni.png" height="25">&nbsp;
                              <img src="<?=base_url()?>/assets/tpl/images/logobri.png" height="25">&nbsp;
                              <!-- <img src="<?=base_url()?>/assets/tpl/images/logomaybank.jpg" height="25">&nbsp; -->
                            <!--   <img src="<?=base_url()?>/assets/tpl/images/logocimb.png" height="25">&nbsp;
                              <img src="<?=base_url()?>/assets/tpl/images/logomastercard.png" height="25">&nbsp;
                              <img src="<?=base_url()?>/assets/tpl/images/logovisa.png" height="25">&nbsp;
                              <img src="<?=base_url()?>/assets/tpl/images/logocjb.png" height="25"> -->
                           </div><br>
                           
                           <br><br>
                            <hr>
                            <h2>Halaman Informasi Detail Pembayaran</h2>
                            <p>Klik link dibawah ini untuk melihat halaman detil tata cara pembayaran.</p>
                            <br>
                            <a href="<?=site_url()?>/payment/invoice_page/<?=$d['invoice_id']?>" class="red-color underline view-link"><?=site_url()?>/payment/invoice_page/<?=$d['invoice_id']?> </a>
                            <?php
                        }
                        ?>

                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>


    <!-- Javascript -->

</body>
</html>

