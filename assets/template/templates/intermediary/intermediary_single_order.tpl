<style type="text/css">
input.input-text-voucher {
    padding-left: 15px;
    padding-right: 15px;
    height: 34px;
    border-radius: 5px;
    background: #f5f5f5;
    border: none;
    line-height: normal;
    width: 50% !important; 
    /* margin-bottom: 10px; */
}

/* Extra small devices (phones, 600px and down) */
/*@media only screen and (max-width: 360px) {
  
  #voucher_code{
    position: relative !important;
    right: 1px !important;
    width: 100% !important;
  }
  #voucher_code_btn{
    position: relative;
    left: 111px;
  }
  #cancel_disc{
    right: -42px !important;
    top: 28px;
  }
}*/

/* Extra small devices (phones, 600px and down) */
@media only screen and (min-width: 360px) {
  
  #voucher_code{
    position: relative !important;
    right: 1px !important;
    /*width: 50% !important;*/
  }
  #voucher_code_btn{
    position: relative;
    /*left: 111px;*/
  }
  #cancel_disc{
    right: -42px !important;
    top: 28px;
  }
}

/* Small devices (portrait tablets and large phones, 600px and up) */
@media only screen and (min-width: 600px) {
  #voucher_code{
    position: relative !important;
    right: 2px !important;
    /*width: 75% !important;*/
  }
  #voucher_code_btn{
    position: relative;
    /*left: 201px;*/
    /*top:5px;*/
  }
  #cancel_disc{
    right: -42px !important;
    top: 28px;
  }
}

/* Medium devices (landscape tablets, 768px and up) */
@media only screen and (min-width: 768px) {
   #voucher_code{
    position: relative !important;
    /*right: 2px !important;*/
    /*width: 25% !important;*/
  }
  #voucher_code_btn{
    position: relative;
    /*left: 201px;*/
    /*margin-top: -6px*/
  }
  #cancel_disc{
    right: -42px !important;
    top: 28px;
  }
}
/* Large devices (laptops/desktops, 992px and up) */
@media only screen and (min-width: 992px) {
   #voucher_code{
    position: relative !important;
    right: 2px !important;
    width: 50% !important;
  }

  #voucher_code_btn{
      left: 51px;
  }

  #cancel_disc{
    right: 8px !important;
    top: 1px;
  }
}

/* Extra large devices (large laptops and desktops, 1200px and up) */
@media only screen and (min-width: 1200px) {
   #voucher_code{
    position: relative !important;
    right: 2px !important;
    width: 30% !important;
  }
  #voucher_code_btn{
      left: 10px;
  }

  #cancel_disc{
    right: 8px !important;
    top: 1px;
  }

}
</style>
<link rel="stylesheet" href="{$base_url}assets/tpl/css/style-header-step.css">
<link href = "https://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"
         rel = "stylesheet">
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<!-- <div id="loading_top_bar" style="width:100%; position:absolute; bottom:0px border:0px; background-color:#232323; color:#ffffff; padding-top:5px; padding-bottom:5px; font-size:12px" align="center">
</div> -->
            <section id="content" style="background: #fff; margin-top: 20px; border-radius: 20px;">
                <div class="container container-content-shadow">
                     <div class="row">
                        <div id="main" class="col-sm-12 col-md-12">
                           <div class="booking-section travelo-box">
                              <form id="intermediary_single_order" class="cruise-booking-form" action="{$site_url}/Order_intermediary/proceed" method="POST" novalidate>
                                <input type="hidden" name="form_valid" id="form_valid">
                                <input type="hidden" name="intermediary_id" id="intermediary_id" value="{$intermediary_id}">
                                <input type="hidden" name="insured_id" id="insured_id">
                                <input type="hidden" name="birthdate_logged" id="birthdate_logged">
                                <input type="hidden" name="user_id" id="user_id">
                                <input type="hidden" name="price_gold_field" id="price_gold_field">
                                <input type="hidden" name="price_platinum_field" id="price_platinum_field">
                                <input type="hidden" name="price_diamond_field" id="price_diamond_field">
                                <input type="hidden" name="price_gold_field" id="price_gold_field">
                                <input type="hidden" name="premium_id" id="premium_id">
                                <input type="hidden" name="total_perluasan" id="total_perluasan_field">
                                <input type="hidden" name="total_ex_premi" id="total_ex_premi_field">
                                <input type="hidden" name="total_premi" id="total_premi_field">
                                <input type="hidden" name="other_fee" id="other_fee_field">
                                <input type="hidden" name="payment_fee" id="payment_fee_field">
                                <input type="hidden" name="discount_amount" id="discount_amount_field" value="">
                                <input type="hidden" name="total_amount" id="total_amount_field" value="">

                                  <nav style="margin-bottom: 40px;">
                                    <ol class="cd-multi-steps text-bottom count">
                                      <!-- <li class="visited"><a href="#0">Pilih Destinasi</a></li> -->
                                      <li class="current" ><a href="#0">Isi Form Pemesanan</a></li>
                                      <li><em>Pembayaran</em></li>
                                    </ol>
                                  </nav>

                                <h1>Pemesanan Asuransi Perjalanan Jasindo Travel</h1>

                                        <!--   {if $logged eq true}
                                             <div class="row" id="row_info_success_login">
                                               <div class="form-group col-sm-6 col-md-4">
                                                   <label><b>Anda Mendaftar Sebagai: <span id="name_login"></span></b></label>
                                                </div>
                                             </div>
                                          {/if}
 -->
                                <div class="row" id="form_login" style="display:none;">
                                       <hr>
                                       <div class="col-xs-11">
                                          <h2><i class="soap-icon-user" style="color: #01b7f2;"></i>Daftar Peserta</h2>
                                            <div class="row" id="row_info_login">
                                             <div class="form-group col-sm-6 col-md-4">
                                                <label>Nama Peserta</label>
                                                <input type="text" class="form-control" id="participant_name" name="participant_name" value="{$participant_name}"><!-- {$participant_name} -->
                                             </div>
                                            </div>
                                            <div class="row" >
                                              <div class="form-group col-sm-6 col-md-4">
                                                 <!-- <div class="checkbox"> -->
                                                 <label>
                                                 <a id="show_reg_form"><span class="skin-color">Batal</span></a>.
                                                 </label>
                                                 <!-- </div> -->
                                              </div>
                                            </div>
<!--                                  </div>

                                          {if $logged eq true}
                                          <div class="row" id="row_info_login">
                                             <div class="form-group col-sm-6 col-md-4">
                                                <label>Email</label>
                                                <input type="email" class="input-text full-width" id="email_login" name="email_login">
                                             </div>
                                             <div class="form-group col-sm-6 col-md-4"> -->
                                                <!-- <div class="row"> -->
                                                <!-- <div class="col-xs-7"> -->
                                                <!-- <label>Password</label>
                                                <input type="password" class="input-text full-width" id="pass_login" name="pass_login"> -->
                                                <!-- </div> -->
                                                <!--  <div class="col-xs-5">
                                                   <label><span style="color:#FFF;">-</span></label>
                                                   <button data-animation-duration="1" data-animation-type="bounce" class="full-width icon-check animated bounce" type="submit" style="animation-duration: 1s; visibility: visible;">Login</button>
                                                   </div> -->
                                                <!-- </div> -->
<!--                                              </div>
                                             <div class="form-group col-sm-6 col-md-2">
                                                <label><span style="color:#FFF;">-</span></label>
                                                <label id="btnSubmitLogin" data-animation-duration="1" data-animation-type="bounce" class="full-width icon-check animated bounce" style="padding:5px 5px 5px 5px; background-color:#7db921; color:#FFF; animation-duration: 1s; visibility: visible;">&nbsp;&nbsp;&nbsp;<b>Login</b></label> 

                                                <span id="loadingLogin" style="display:none;">Loading...</span> -->
                                                <!-- <a href="#">Lupa Password?</a> -->
<!--                                              </div>
                                          </div>
                                          {/if} -->

                                       </div>
                                    </div>

                                    {if $logged eq true}
                                    <div class="person-information" style="display:block;" id="form_pendaftaran">
                                    <hr>
                                    <h2><i class="soap-icon-doc-plus" style="color: #01b7f2;"></i> Pendaftaran</h2>
                                    <div class="form-group">
                                       <label id="show_login_form">
                                          <div class="icon-box style1"><i class="soap-icon-notice"></i>Pilih Peserta</div>
                                          <!-- <a id="show_login_form"><label class="btn-medium sky-blue1">Sudah memiliki akun?</label></a> -->
                                       <!-- <a id="show_login_form"><span class="skin-color btn-medium sky-blue1">Sudah memiliki akun?</span></a>. -->
                                       </label>
                                    </div>
                                    <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>Nama Depan</label>
                                          <input type="text" class="input-text full-width" name="firstname" id="firstname">
                                          <span id="firstname_ch">
                                       </div>
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>Nama Belakang</label>
                                          <input type="text" class="input-text full-width" id="lastname" name="lastname">
                                          <span id="lastname_ch">
                                       </div>
                                    </div>
                                    <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>Alamat Email</label>
                                          <input type="text" class="input-text full-width" name="email_reg" id="email_reg">
                                          <span id="email_reg_ch">
                                       </div>
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>No KTP/KITAS/Passport</label>
                                          <input type="text" class="input-text full-width" id="identity_no" name="identity_no">
                                          <span id="identity_no_ch">
                                       </div>
                                    </div>
                                    <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>No Handphone</label>
                                          <input type="text" class="input-text full-width" id="phone_number" name="phone_number">
                                          <span id="phone_number_reg_ch">
                                       </div>
                                       <div class="form-group col-sm-6 col-md-5">
                                          <div class="row">
                                             <div class="col-md-6">
                                                <label>Tanggal Lahir</label>
                                                <div class="datepicker-wrap">
                                                <input type="text" value="" id="datebirth_reg" placeholder="dd-mm-yy" class="input-text full-width" name="datebirth" placeholder="select date" />
                                                
                                             </div>
                                             <span id="datebirth_reg_ch">
                                             </div>
                                             <div class="col-md-6">
                                                <label>Jenis Kelamin</label>
                                                <div>
                                                   <label class="radio radio-inline radio-square checked">
                                                   <input type="radio" name="gender_reg" checked="checked" value="1">Pria
                                                   </label>
                                                   <label class="radio radio-inline radio-square">
                                                   <input type="radio" name="gender_reg" value="2">Wanita
                                                   </label>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="row">
                                     <!--   <div class="form-group col-sm-6 col-md-5">
                                          <label>Country code</label>
                                          <div class="selector">
                                             <select class="full-width" name="country_code">
                                                <option value="1">Indonesia (+62)</option>
                                             </select>
                                          </div>
                                       </div> -->
                                       <!-- <div class="form-group col-sm-6 col-md-5">
                                          <label>Phone number</label>
                                          <input type="text" class="input-text full-width" name="phone_number">
                                       </div> -->
                                    </div>
                                    <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>Alamat <small>(harus sesuai dengan KTP/KITAS/Passport)</small></label>
                                          <input type="text" class="input-text full-width" id="address" name="address">
                                          <span id="address_ch">
                                       </div>
                                       <div class="form-group col-sm-6 col-md-5">
                                          <div class="row">
                                             <!-- <div class="col-xs-6">
                                                <label>State</label>
                                                <div class="selector full-width">
                                                   <select>
                                                      <option value="uk">UK</option>
                                                   </select>
                                                   <span class="custom-select">UK</span>
                                                </div>
                                             </div> -->
                                             <div class="col-md-6">
                                                <label>Kota</label>
                                                <input type="text" class="input-text full-width" id="city" name="city">
                                                <span id="city_ch">
                                             </div>
                                             <div class="col-md-6">
                                                <label>Kode POS</label>
                                                <input type="text" class="input-text full-width" id="zipcode" name="zipcode">
                                                <span id="zipcode_ch">
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>Nama Keluarga yang bisa dihubungi</label>
                                          <input type="text" class="input-text full-width" name="heirs_name" id="heirs_name">
                                          <span id="heirs_name_ch">
                                       </div>
                                       <div class="form-group col-sm-6 col-md-5">
                                          <div class="row">
                                             <div class="col-md-6">
                                                <label>No Handphone Keluarga yang bisa dihubungi</label>
                                                <input type="text" class="input-text full-width" name="heirs_phone" id="heirs_phone">
                                                <span id="heirs_phone_ch">
                                             </div>
                                             <div class="col-md-6">
                                                <label>Tanggal Lahir Keluarga yang bisa dihubungi</label>
                                                <div class="datepicker-wrap">
                                                   <input type="text" placeholder="dd-mm-yy" class="input-text full-width" id="heirs_datebirth" name="heirs_datebirth" placeholder="select date" />
                                                   
                                                </div>
                                                <span id="heirs_datebirth_ch">
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="form-group">
                                       <div class="checkbox">
                                          <label>
                                          <input type="checkbox" name="promo" value="1"> I want to receive <span class="skin-color">Jasindo Travel</span> promotional offers in the future
                                          </label>
                                       </div>
                                    </div>
                                 </div>
                                  {/if}

                                 <div class="card-information">
                                   <hr>
                                    <h2><i class="soap-icon-bag" style="color: #01b7f2;"></i> Data Pemesanan</h2>
                                    <h5 class="title">Destinasi</h5>
                                    <div class="row">
                                       <div class="col-md-6">
                                          <label>Dari</label>
                                           <input type="text" class="input-text full-width departure_id" placeholder="Ketikkan kota keberangkatan" id="depart" name="departure_id" value="{$departure_id}"/>
                                          <!--- <input type="text" class="input-text full-width" placeholder="enter your location" />-->
                                       </div>
                                       <div class="col-md-6">
                                          <label>Tujuan</label>
                                          <input type="text" class="input-text full-width destination_id" placeholder="Ketikkan kota tujuan" id="dest" name="destination_id" value="{$destination_id}"/>
                                       </div>
                                    </div>
                                    <br>
                                    <h5 class="title">Periode</h5>
                                    <!-- <label>Mulai</label> -->
                                    <div class="row">
                                       <div class="col-md-6">
                                          <label>Mulai</label>
                                          <div class="datepicker-wrap">
                                             <input type="text" id="startdate" class="input-text full-width" placeholder="select date" name="startdate" value="{$startdate}"/ >
                                             <span id="startdate_ch"/>
                                          </div>
                                       </div>
                                       <div class="col-md-6">
                                          <label>Sampai</label>
                                          <div class="datepicker-wrap">
                                             <input type="text" id="enddate" class="input-text full-width" placeholder="select date" name="enddate" value="{$enddate}"/>
                                          </div>
                                       </div>
                                    </div>
                                    <br>
                                    <!-- <h5 class="title">Periode</h5> -->
                                    <!-- <label>Mulai</label> -->
                                    <div class="row">
                                       <div class="col-md-6">
                                          <label>Jumlah Orang</label>
                                          <div class="selector">
                                             {$participant}
                                          </div>
                                       </div>
                                       <div class="col-md-6">
                                          <label>Keterangan</label>
                                          <div class="selector" style="margin-top:12px;">
                                             {if $num_person eq 2}
                                                <h3>Paket Pasangan</h3>
                                             {else if $num_person > 2}
                                               <h3> Paket Family (Harus keluarga inti)</h3>
                                             {/if}
                                          </div>
                                       </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                       <div class="col-md-6">
                                          <h5 class="title">Paket Yang Dipilih: <span id="name_region"></span></h5>
                                       </div>
                                    </div>

                                    <div class="block" id="package_domestic" style="display:none;">
                                       <div class="row image-box style3">
                                          <div class="col-sm-6 col-md-4">
                                             <article class="box">
                                                <div class="details text-center">                
                                                   <br>
                                                   <label>Paket Domestik</label>
                                                   <div class="radio" style="width:20px; margin:0 auto;">
                                                      <input type="radio" name="pilih_paket"  value="4" {$rb_domestic}>                                                      
                                                   </div>
                                                    <h4 class="box-title" style="margin-top:5px;"><span id="price_domestic"></h4>
                                                </div>
                                             </article>
                                          </div>
                                       </div>
                                    </div>

                                    <div class="block" id="package_international" style="display:none;">
                                       <div class="row image-box style3">
                                          <div class="col-sm-4 col-md-4">
                                             <article class="box">
                                               <!--  <figure>
                                                   <a class="hover-effect" href="#" title=""><img src="http://placehold.it/270x160" alt="" width="270" height="160" /></a>
                                                </figure> -->
                                                <div class="details text-center">
                                                  
                                                   <br>
                                                   <!-- <p class="offers-content">Rp 120.000</p> -->
                                                   <!--  <div class="five-stars-container" title="4 stars" data-toggle="tooltip" data-placement="bottom">
                                                      <span class="five-stars" style="width: 80%;"></span>
                                                      </div> -->
                                                   <!-- <a href="pemesanan.html" title="" class="button btn-small sky-blue1" style="width:100%;">Pilih</a> -->
                                                   <label>Paket GOLD</label>
                                                   <div class="radio" style="width:20px; margin:0 auto;">
                                                      <input type="radio" name="pilih_paket"  {$rb_gold} value="1">                                                      
                                                   </div>
                                                    <h4 class="box-title" style="margin-top:5px;"><span id="price_gold"></h4>
                                                </div>
                                             </article>
                                          </div>
                                          <div class="col-sm-4 col-md-4">
                                             <article class="box">
                                              <!--   <figure>
                                                   <a class="hover-effect" href="#" title=""><img src="http://placehold.it/270x160" alt="" width="270" height="160" /></a>
                                                </figure> -->
                                                <div class="details text-center">
                                                   
                                                   <br>
                                                   <!-- <p class="offers-content">Rp 220.000</p> -->
                                                   <!--   <div class="five-stars-container" title="4 stars" data-toggle="tooltip" data-placement="bottom">
                                                      <span class="five-stars" style="width: 80%;"></span>
                                                      </div> -->
                                                       <label>Paket PLATINUM</label>
                                                   <div class="radio" style="width:20px; margin:0 auto;">
                                                      <input type="radio"  name="pilih_paket" {$rb_platinum} value="2"> 
                                                   </div>
                                                   <h4 class="box-title" style="margin-top:5px;"><span id="price_platinum"></h4>
                                                </div>
                                             </article>
                                          </div>
                                          <div class="col-sm-4 col-md-4">
                                             <article class="box">
                                               <!--  <figure>
                                                   <a class="hover-effect" href="#" title=""><img src="http://placehold.it/270x160" alt="" width="270" height="160" /></a>
                                                </figure> -->
                                                <div class="details text-center">
                                                  
                                                   <br>
                                                   <!-- <p class="offers-content">Rp 320.000</p> -->
                                                   <!--   <div class="five-stars-container" title="4 stars" data-toggle="tooltip" data-placement="bottom">
                                                      <span class="five-stars" style="width: 80%;"></span>
                                                      </div> -->
                                                      <label>Paket DIAMOND</label>
                                                   <div class="radio" style="width:20px; margin:0 auto;">
                                                      <input type="radio" name="pilih_paket" {$rb_diamond} value="3"> 
                                                   </div>
                                                    <h4 class="box-title"  style="margin-top:5px;"><span id="price_diamond"></h4>
                                                </div>
                                             </article>
                                          </div>
                                       </div>
                                    </div>

                                     <hr>
                                    <h2><i class="soap-icon-bag" style="color: #01b7f2;"></i> Pilih Perluasan</h2>

                                    
                                    <div class="row block">

                                    <div class="row hotel-list image-box hotel listing-style1 add-clearfix">
                                    <div class="col-md-4">
                                        <article class="box has-discount">
                                            <div class="details">
                                                <span class="price"><small>Premi</small>Rp 95.000</span>
                                                <h5 class="box-title"><i class="soap-icon-user circle green-color"></i>&nbsp;Kegiatan Ekstrim</h5>
                                                {* <div class="feedback">
                                                    <div data-placement="bottom" data-toggle="tooltip" class="five-stars-container" title="" data-original-title="4 stars"><span style="width: 80%;" class="five-stars"></span></div>
                                                    <span class="review">75 reviews</span>
                                                </div> *}
                                                <p class="description" style="height:60px;border-top: 1px solid #f5f5f5;">Cacat Tetap atau Meninggal Dunia Akibat Kecelakaan. Kegiatan Menyelam, Kegiatan Arung Jeram, Kegiatan Paralayang.</p>
                                                <div class="action">
                                                    <center><label><input type="checkbox" id="extension1" name="extension[]" value="1"> PILIH PERLUASAN</label></center>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <div class="col-md-4">
                                        <article class="box has-discount">
                                            <div class="details">
                                                <span class="price">
                                                    <small>Premi</small>
                                                    Rp 100.000
                                                </span>
                                                <h5 class="box-title"><i class="soap-icon-friends circle yellow-color"></i>&nbsp;Kehilangan Barang Teknologi</h5>
                                                {* <div class="feedback">
                                                    <div data-placement="bottom" data-toggle="tooltip" class="five-stars-container" title="" data-original-title="4 stars"><span style="width: 80%;" class="five-stars"></span></div>
                                                    <span class="review">423 reviews</span>
                                                </div> *}
                                                <p class="description" style="height:60px;border-top: 1px solid #f5f5f5;">Kamera (Tidak Termasuk Lensa) atau Telepon Selular.</p>
                                                <div class="action">
                                                    <center><label><input type="checkbox" id="extension2" name="extension[]" value="2"> PILIH PERLUASAN</label></center>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <div class="col-md-4">
                                        <article class="box has-discount">
                                            <div class="details">
                                                <span class="price"><small>Premi</small>Rp 7.500</span>
                                                <h5 class="box-title"><i class="soap-icon-suitcase circle blue-color"></i>&nbsp;Perlindungan Rumah</h5>
                                                {* <div class="feedback">
                                                    <div data-placement="bottom" data-toggle="tooltip" class="five-stars-container" title="" data-original-title="4 stars"><span style="width: 80%;" class="five-stars"></span></div>
                                                    <span class="review">199 reviews</span>
                                                </div> *}
                                                <p class="description" style="height:60px;border-top: 1px solid #f5f5f5;">Perlindungan Rumah Atas Risiko Kebakaran.</p>
                                                <div class="action">
                                                   <center><label><input type="checkbox" id="extension3" name="extension[]" value="3"> PILIH PERLUASAN</label></center>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                </div>


             
                                    
                                    <!--   <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                           <label>Credit Card Type</label>
                                           <div class="selector">
                                               <select class="full-width">
                                                       <option>select a card</option>
                                                   </select><span class="custom-select full-width">select a card</span>
                                           </div>
                                       </div>
                                       <div class="form-group col-sm-6 col-md-5">
                                           <label>Card holder name</label>
                                           <input type="text" class="input-text full-width" placeholder="">
                                       </div>
                                       </div>
                                       <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                           <label>Card number</label>
                                           <input type="text" class="input-text full-width" placeholder="">
                                       </div>
                                       <div class="form-group col-sm-6 col-md-5">
                                           <label>Card identification number</label>
                                           <input type="text" class="input-text full-width" placeholder="">
                                       </div>
                                       </div>
                                       <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                           <label>Expiration Date</label>
                                           <div class="constant-column-2">
                                               <div class="selector">
                                                   <select class="full-width">
                                                           <option>month</option>
                                                       </select><span class="custom-select full-width">month</span>
                                               </div>
                                               <div class="selector">
                                                   <select class="full-width">
                                                           <option>year</option>
                                                       </select><span class="custom-select full-width">year</span>
                                               </div>
                                           </div>
                                       </div>
                                       <div class="form-group col-sm-3 col-md-2">
                                           <label>billing zip code</label>
                                           <input type="text" class="input-text full-width" placeholder="">
                                       </div>
                                       </div> -->
                                 </div>
                                 
                                 <div class="row">
                                    <hr>
                                    <!-- <a id="add_participant_form">Tambah</a> -->

                               

                                    <div class="col-xs-11" id="other_participant">
                                       <h2><i class="soap-icon-myspace" style="color: #01b7f2;"></i> Peserta lain yang diasuransikan</h2>
                                       
                                       <div class="row" id="form_participant">
                                          <div class="form-group col-sm-6 col-md-3">
                                             <label>Nama Lengkap</label>
                                             <input type="text" class="input-text full-width" name="fullname[]">
                                          </div>
                                          <div class="form-group col-sm-6 col-md-2">
                                             <label>Hubungan</label>
                                             <div class="selector">
                                                <select name="relationship[]">
                                                    {if $num_person eq 2}
                                                      <option value="2">Suami/Istri</option>
                                                      <option value="5">Pasangan</option>
                                                   {else if $num_person > 2}
                                                      <option value="2">Suami/Istri</option>
                                                     <!-- <option value="1">Orang Tua</option> -->
                                                      <!-- <option value="2">Suami/Istri</option> -->
                                                      <option value="3">Anak</option>
                                                      <!-- <option value="4">Saudara Kandung</option> -->
                                                   {/if}
                                                   
                                                  
                                                </select>
                                             </div>
                                          </div>
                                          <div class="form-group col-sm-6 col-md-2">
                                             <label>Gender</label>
                                             <div class="selector">
                                                <select name="gender[]">
                                                   <option value="1">Laki-laki</option>
                                                   <option value="2">Perempuan</option>
                                                </select>
                                             </div>
                                          </div>
                                          <div class="form-group col-sm-6 col-md-2">
                                             <label>Tanggal lahir</label>
                                             <div class="datepicker-wrap">
                                                <input type="text" placeholder="dd-mm-yy" class="input-text full-width" name="datebirth_participant[]" placeholder="select date" />
                                             </div>
                                          </div>
                                          <div class="form-group col-sm-6 col-md-3">
                                             <label>NO KTP/KITAS/Passport</label>
                                             <input type="text" class="input-text full-width" name="no_identity[]">
                                          </div>

                                          <hr>
                                       </div>



                                      
                                         <div id="list_participant"></div>

                                    </div>

                                    
                                 </div>
                                 <!-- <hr> -->
                                 <div class="card-information" style="display:none;">
                                    <h2>Your Card Information</h2>
                                    <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>Credit Card Type</label>
                                          <div class="selector">
                                             <select class="full-width">
                                                <option>select a card</option>
                                             </select>
                                             <span class="custom-select full-width">select a card</span>
                                          </div>
                                       </div>
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>Card holder name</label>
                                          <input type="text" class="input-text full-width" placeholder="">
                                       </div>
                                    </div>
                                    <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>Card number</label>
                                          <input type="text" class="input-text full-width" placeholder="">
                                       </div>
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>Card identification number</label>
                                          <input type="text" class="input-text full-width" placeholder="">
                                       </div>
                                    </div>
                                    <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>Expiration Date</label>
                                          <div class="constant-column-2">
                                             <div class="selector">
                                                <select class="full-width">
                                                   <option>month</option>
                                                </select>
                                                <span class="custom-select full-width">month</span>
                                             </div>
                                             <div class="selector">
                                                <select class="full-width">
                                                   <option>year</option>
                                                </select>
                                                <span class="custom-select full-width">year</span>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group col-sm-3 col-md-2">
                                          <label>billing zip code</label>
                                          <input type="text" class="input-text full-width" placeholder="">
                                       </div>
                                    </div>
                                 </div>
                                 <hr>
                                 <div class="card-information">
                                    <h2><i class="soap-icon-availability" style="color: #01b7f2;"></i> Ringkasan Pemesanan</h2>
                                    <div class="row">
                                       <div class="form-group col-sm-6 col-md-6">
                                          <!-- <label>Credit Card Type</label> -->
                                          <div class="booking-details travelo-box">
                                             <!-- <h2>Ringkasan Pembayaran</h2> -->
                                             <article class="image-box cruise listing-style1">
                                                <div class="details">
                                                   <div class="constant-column-3 timing clearfix">
                                                      <div class="check-in">
                                                         <label>Mulai</label>
                                                         <span id="startdate_sum"></span>
                                                      </div>
                                                      <div class="duration text-center">
                                                         <i class="soap-icon-clock"></i>
                                                         <span id="days"><</span>
                                                      </div>
                                                      <div class="check-out">
                                                         <label>Akhir</label>
                                                         <span id="enddate_sum"></span>
                                                      </div>
                                                   </div>
                                                </div>
                                             </article>
                                             <!-- <h4>Detil</h4> -->
                                             <dl class="other-details">
                                                <dt class="feature">Premi Perluasan:</dt>
                                                <dd class="value">Rp <span id="total_perluasan"></span></dd>
                                                <dt class="feature">Premi:</dt>
                                                <dd class="value">Rp <span id="total_premi"></span></dd>

                                                  <dt class="feature" id="extra_premi_summary">Ekstra Premi: <br>
                                                    <font style="font-size:9px; color:#c0c0c0;">Umur melebihi > {$settings.min_age_extra_premi} dikenakan premi tambahan sebesar {$settings.percent_extra_premi} %</font>
                                                  </dt>
                                                  <dd class="value" id="extra_premi_summary_value">Rp <span id="total_ex_premi"></span>
                                                  </dd>

                                                <div id="container_other_fee">
                                                  <dt class="feature">Biaya Polis dan Materai:</dt>
                                                  <dd class="value">Rp <span id="other_fee"></span></dd>
                                              </div>

                                                {* <dt class="feature">Metode Pembayaran: </dt>
                                                   <dd class="value"> 
                                                        <label class="radio radio-inline radio-square checked">
                                                      <input type="radio" name="payment_type_reg" checked="checked" value="1">Bank Transfer (Virtual Account)
                                                      </label>
                                                      <label class="radio radio-inline radio-square">
                                                      <input type="radio" name="payment_type_reg" value="2">Kartu Kredit
                                                      </label>
                                                   </dd>

                                                <dt class="feature">Biaya Transaksi: <span id="payment_desc"></span></dt>
                                                <dd class="value">Rp <span id="payment_fee"></span></dd> *}

                                                 <dt class="feature">Kode Voucher/Promo: <span id="payment_desc"></span></dt>
                                                  <dd class="value"> 
                                                             <input type="text" class="input-text" id="voucher_code" name="voucher_code" placeholder="Masukan kode disini..."/>
                                                            <button class="btn-medium btn-warning"  id="voucher_code_btn">Cek Kode</button>
                                                          <button id="cancel_disc" class="btn-medium btn-danger" style="display:none">Batal</button>
                                                    <!-- </div> -->
                                                      <br>
                                                      <span id="success_msg"><p style="text-transform: none;">Selamat Kode Voucher Valid. Anda mendapatkan diskon sebesar <b>Rp. 45.000</b></p></span>
                                                     
                                                 </dd>

                                                <dt class="total-price" style="font-size: 24px;">Total Pembayaran</dt>
                                                <dd class="total-price-value" style="font-size: 24px;font-weight: bolder;">Rp <span id="total_amount"></span></dd>
                                             </dl>
                                          </div>
                                       </div>
                                       <div class="form-group col-sm-6 col-md-6" style="margin-top:10%;">
                                          <!-- <label>Card holder name</label> -->
                                          <!-- <div class="form-group col-sm-6 col-md-5"> -->
                                             <!-- <h2>Ringkasan Pembayaran</h2> -->
                                               <div class="form-group">
                                       <div class="checkbox">
                                          <label>
                                          <input type="checkbox" name="cb_notif_family" value="1" checked> Saya ingin memberikan informasi penerbitan polis kepada data kontak keluarga yang bisa dihubungi melalui SMS
                                          </label>
                                       </div>
                                             <div class="checkbox">
                                                <label>
                                                <input type="checkbox" name="accept_tnc"> By continuing, you agree to the <a href="{$site_url}/page/syarat_dan_ketentuan" target="_blank"><span class="skin-color">Terms and Conditions</span></a>.
                                                </label>
                                             </div>
                                          <!-- </div> -->
                                          <!-- <div class="form-group row"> -->
                                             <div class="col-sm-6 col-md-7">
                                                 <span id="loadingBtn" style="display:none;"><center><h1>Sedang Memproses...</h1></center></span>
                                                 
                                                 <span id="message_order_button" style="color:red;"></span>
                                                 <span id="message_order" style="color:red; display:none;">Mohon periksa kembali data-data diatas untuk melanjutkan ke tahap berikutnya</span>
                                                 <button id="btn_submit_order" class="button btn-large sky-blue1">LANJUT KE PEMBAYARAN</button> 
                                               <!--  <button type="submit" class="full-width btn-large">&nbsp;Lanjut Ke Pembayaran&nbsp;</button> -->
                                             </div>
                                          <!-- </div> -->
                                       </div>
                                    </div>
                                 </div>
                              </form>
                           </div>
                        </div>
                        <div class="sidebar col-sm-4 col-md-3">
                           <!--  <div class="travelo-box contact-box">
                              <h4>Need Jasindo Travel Help?</h4>
                              <p>We would be more than happy to help you. Our team advisor are 24/7 at your service to help you.</p>
                              <address class="contact-details">
                                      <span class="contact-phone"><i class="soap-icon-phone"></i> 1-800-123-HELLO</span>
                                      <br>
                                      <a class="contact-email" href="#">help@jasindotravel.com</a>
                                  </address>
                              </div> -->
                        </div>
                     </div>
                  </div>
            </section><p>&nbsp;</p>

 <script type="text/javascript">

var logged = '{$logged}';

function myFunction() {
    // Get the snackbar DIV
    var x = document.getElementById("snackbar")

    // Add the "show" class to DIV
    x.className = "show";

    // After 3 seconds, remove the show class from DIV
    // setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}

jQuery(document).ready(function($) {
    
      // $('#other_participant').css('display','none') 
      // $('#paket_pasangan').hide();
      // $('#keluarga_inti').hide();

      //on change
     //  $("#select_num_person").change(function(){
     //   var person =$("#select_num_person").val();
     //   console.log(person);
     //   if(person ==1){
     //      $('#other_participant').css('display','none')
     //      $('#paket_pasangan').show();
     //      $('#keluarga_inti').hide();
     //   }else if(person ==2){
     //      $('#other_participant').css('display','block')
     //      $('#paket_pasangan').show();
     //      $('#keluarga_inti').hide();
          
     //      for (i = 1; i < person; i++) {
     //        // console.log(i+' ')
     //        $('#form_participant').clone().appendTo('#list_participant');
     //      }
          
     //   }else if(person >=2){
     //      $('#other_participant').css('display','block')
     //      $('#keluarga_inti').show();

     //      for (i = 1; i < person; i++) {
     //        // console.log(i+' ')
     //        $('#form_participant').clone().appendTo('#list_participant');
     //      }

     //   }else{
     //      $('#other_participant').css('display','block')

     //   }
    
     // })
    if($('#participant_name').val()!=null){
       
      $("#form_pendaftaran").hide();
      $("#form_login").show(1000);
      $("#show_reg_form").show(1000);

    } 
      
    $('#participant_name').autocomplete({
      source: function( request, response ) {
            $.ajax( {
              url: SITE_URL + "intermediary/get_participant_name",
              method:'POST',
              dataType: "json",
              data: {
                query: request.term
              },
              success: function( d ) {

                // $.each(d,function(obj){
                //    console.log(obj)                  
                // });
                
                response(d);
              }
            });
      },
      minLength: 1,
      select: function( event, ui ) {
        console.log(ui.item)
        $("#participant_name").val(ui.item.label)
        $("#insured_id").val(ui.item.id)
        $.ajax({
              url: SITE_URL + "intermediary/agen_participantAjax"
,              method:'GET',
              dataType: "json",
              data: {
                id: $("#insured_id").val(),
              },
              success: function(datas) {
                console.log(datas)
                $.each(datas[0],function(i,o){
                  $("#user_id").val(o.user_id);
                  $('#firstname').val(o.firstname);
                  $('#lastname').val(o.lastname);
                  $('#address').val(o.address);
                  $('#identity_no',).val(o.identity_no);
                  $('#phone_number').val(o.phone_number);
                  $('#datebirth_reg').val(o.birthdate);
                  $('#city').val(o.city);
                  $('#zipcode').val(o.zipcode);
                  $('#heirs_name').val(o.heirs_name);
                  $('#heirs_phone').val(o.heirs_phone);
                  $('#heirs_datebirth').val(o.heirs_datebirth);
                  $('#email_reg').val(o.email);
                });

                // $("#insured_id").val();
                // $("#insured_id").val();
                // $("#insured_id").val();
                // $("#insured_id").val();
                // $("#insured_id").val();
              },failure:function(datas){

              }
        }) 
        //         // log( "Selected: " + ui.item.value + " aka " + ui.item.id );
      },
      upselect:function(){}
    });
    // console.log($("#insured_id").val())
    // if($("#insured_id").val() !=null){
    //   // alert('xxxxxxxxxxx')
    
    // }
  
  $("#success_msg").hide();
   try {
      $("input[type='text']").each(function(){
                     $(this).attr("autocomplete","off");
                  });
  }
  catch (e)
  { }


    $('form').submit(function(e) {
        e.preventDefault();
        // alert('submit')

       var x = document.getElementById("snackbar");
       x.className = "show";

        // $('input[type=checkbox][name=accept_tnc]').click(function(){
        // $('input[name="accept_tnc"]').click(function(){
        if ($('input[type=checkbox][name=accept_tnc]').prop("checked") == true) {

            // $('#btn_submit_order').hide();
            // $('#loadingBtn').show();
            // $('#form_valid').val('submit');
            if(field_checking()){
                  x.className = "show";

                  tjq.ajax({
                   type: 'GET',
                   async: false,
                   url: SITE_URL + '/order/email_checking',
                   data: {
                       email: $('#email_reg').val(),
                       logged:logged
                   },
                   dataType: 'json',
                   success: function(data) {
                       if (data.success) {
                           var url = $('form').attr("action");
                           var formData = $('form').serializeArray();
                           // console.log(formData);
                           // $.post(url, formData).done(function (data) {
                           //    if(data.success){
                           //      window.location = data.url_direct;
                           //    } else {
                           //      alert(data.message);
                           //    }
                           // });

                           if($('#total_amount_field').val()==''){
                              alert('Harap pilih paket asuransi terlebih dahulu');
                              // $('#btn_submit_order').show();
                              $('#loadingBtn').hide();
                           } else {
                              // $('#btn_submit_order').hide();
                              $.ajax({
                                  type: 'POST',
                                  cache: false,
                                  url: url,
                                  data: formData,
                                  datatype: 'json',
                                  success: function(data) {
                                      var obj = jQuery.parseJSON(data);
                                      if (obj.success) {
                                          window.location = obj.url_direct;
                                      } else {
                                          alert(obj.message);
                                           x.className = x.className.replace("show", "");
                                          // $('#btn_submit_order').show(500);
                                          // $('#loadingBtn').hide(500);
                                      }
                                  }
                              });
                           }
                           
                           
                       } else {
                           alert(data.message);
                            x.className = x.className.replace("show", "");
                       }

                   }
               });
            } else {
               alert("Harap periksa kembali data-data anda");
                x.className = x.className.replace("show", "");
            }
            
        } else if ($('input[type=checkbox][name=accept_tnc]').prop("checked") == false) {
            alert("Untuk melanjutkan anda harus menyetujui syarat dan ketentuan yang berlaku");
            x.className = x.className.replace("show", "");
        }
        // });




    });

    $('#order_form').on('keyup keypress', function(e) {
        var keyCode = e.keyCode || e.which;
        if (keyCode === 13) {
            e.preventDefault();
            return false;
        }
    });
    // $("#btn_submit_order").click(function() {
    //  // alert('sa');
    //    $( "#order_form" ).submit();
    //     // $('form').submit(function(e) {  });
    // });

    $("#btnSubmitLogin").click(function() {
      if($('#email_login').val()=='' || $('#pass_login').val()==''){
         alert('Harap memasukkan email dan password');
      } else {
         $('#btnSubmitLogin').hide();
         $('#loadingLogin').show();
         $('#loadingLogin').html('Loading...');

        $.ajax({
            type: 'POST',
            url: '{$site_url}/login/check',
            data: {
                email: $('#email_login').val(),
                password: $('#pass_login').val(),
                mode: 'ajax'
            },
            dataType: 'json',
            success: function(data) {
                console.log(data);
                if (data.success) {
                     window.location = '{$site_url}/order/page?startdate=' + $('#startdate').val() + '&enddate=' + $('#enddate').val() + '&departure_id=' + $('#depart').val() + '&destination_id=' + $('#dest').val() + '&type=single&num_person=' + this.value + '&datebirth='+$('#datebirth_reg').val();

                    $('#row_info_login').hide();
                    $('#show_reg_form').hide();
                    $('#row_info_success_login').show();
                    $('#name_login').html(data.fullname);
                    $('#insured_id').val(data.insured_id);
                    $('#user_id').val(data.user_id);

                    set_package();
                } else {
                    $('#loadingLogin').html(data.message);
                    $('#btnSubmitLogin').show();
                }

            },
        });
      }
        
    });



   $("#num_participant").change(function(value) {
       // alert($("#num_participant").val())
       window.location = '{$site_url}/intermediary/single_order?startdate=' + $('#startdate').val() + '&enddate=' + $('#enddate').val() + '&departure_id=' + $('#depart').val() + '&destination_id=' + $('#dest').val() + '&type=single&num_person=' + this.value + '&datebirth='+$('#datebirth_reg').val() + '&name='+$('#participant_name').val();
    });

    $("#depart").change(function() {
        // set_package();
    });

    $("#dest").change(function() {
        // set_package();
    });

    $("#startdate").change(function() {
        set_package();
    });

    $("#enddate").change(function() {
        set_package();
    });

    $("#datebirth_reg").change(function() {
        set_package();
        // $('#voucher_code_btn').css('left','201px');
    });



    $("#show_reg_form").click(function() {
        $("#form_pendaftaran").show(1000);
        $("#form_login").hide(1000);
        $("#participant_name").val(null);
        $("#user_id").val(null);
        $('#firstname').val(null);
        $('#lastname').val(null);
        $('#address').val(null);
        $('#identity_no').val(null);
        $('#phone_number').val(null);
        $('#datebirth_reg').val(null);
        $('#city').val(null);
        $('#zipcode').val(null);
        $('#heirs_name').val(null);
        $('#heirs_phone').val(null);
        $('#heirs_datebirth').val(null);
        $('#email_reg').val(null);
    });

    $("#show_login_form").click(function() {
        $("#form_pendaftaran").hide(1000);
        $("#form_login").show(1000);
        $("#show_reg_form").show(1000);
        //show_reg_form
    });

    $("#num_participant").change(function() {
        // $('#list_participant').empty();
        // jQuery('#list_participant div').html('');
        // set_participant(this.value)
    });

    $("#family").change(function() {
        set_package();
    });

    $('input[type=radio][name=pilih_paket]').change(function() {
        // set_total(this.value)
        // $('#voucher_code_btn').css('left','201px');
        set_package();
    });

    // $('input[type=checkbox][id=extension1').change(function() {
    //     // set_total(this.value)
    //     set_package();
    // });

    // $('input[type=checkbox][id=extension2').change(function() {
    //     // set_total(this.value)
    //     set_package();
    // });

    // $('input[type=checkbox][id=extension3').change(function() {
    //     // set_total(this.value)
    //     set_package();
    // });
$('input:checkbox').live('change', function(){
   if($('#voucher_code').val()!=''){

    }else{
      set_package();
    }
});
 

    $('input[type=radio][name=payment_type_reg]').change(function() {
        // set_total(this.value)
        set_package();
    });

    

    var num =$("#num_participant").val();
    function set_participant(num) {
        // set_package();
        console.log('num:'+this.value);
        var num = num * 1;

        if (num == 1) {
            $('#other_participant').hide();
        } else {
            $('#other_participant').show();
        }

        $('#form_participant').show();
        var button = '';
        for (i = 1; i < num; i++) {
            // console.log(i+' ')
            $('#form_participant').clone().appendTo('#list_participant');
        }

        $('#form_participant').hide();
    }

    // $("#num_participant").change(function(e){
    //    // e.preventDefault();
    //    var num =$("#num_participant").val();
    //    var num = num * 1;
    //    console.log(num);
    //     if (num == 1) {
    //         $('#other_participant').hide();
    //     } else {
    //         $('#other_participant').show();
    //     }

    //     $('#form_participant').show();
    //     var button = '';
    //     for (i = 1; i < num; i++) {
    //         // console.log(i+' ')
    //         $('#form_participant').clone().appendTo('#list_participant');
    //     }

    //     $('#form_participant').hide();
    // });

    function set_total(pilih) {
        console.log('set_total');
    }

    function set_package() {
        console.log('set_package');



        console.log($('#depart').val());
        if ($('#depart').val() == '') {
            $("#notif_searchbox").show(200);
            $('#search_msg').html("Pilih Keberangkatan");
        } else if ($('#dest').val() == '') {
            $("#notif_searchbox").show(200);
            $('#search_msg').html("Pilih Tujuan");
        } else if ($('#startdate').val() == '') {
            $("#notif_searchbox").show(200);
            $('#search_msg').html("Pilih Tanggal Mulai");
        } else if ($('#enddate').val() == '') {
            $("#notif_searchbox").show(200);
            $('#search_msg').html("Pilih Tanggal Akhir");
        } else {

            var favorite = [];
            if ($('#extension1').is(':checked') !== false) {
                favorite.push($('#extension1').val());
            }
            if ($('#extension2').is(':checked') !== false) {
                favorite.push($('#extension2').val());
            }
            if ($('#extension3').is(':checked') !== false) {
                favorite.push($('#extension3').val());
            }



            // $.each($("input[name='extension']:checked"), function(){            
            //     favorite.push($(this).val());
            // });
            // alert("My favourite sports are: " + favorite.join(","));
            $('#message_order_button').html(null);

            // alert($('input[name=payment_type_reg]:checked', '#order_form').val());

            $.ajax({
                type: 'GET',
                url: '{$site_url}/product/get_package_price',
                data: {
                    startdate: $('#startdate').val(),
                    enddate: $('#enddate').val(),
                    depart_id: $('#depart').val(),
                    destination_id: $('#dest').val(),
                    type: 'single',
                    num_person: $('#num_participant').val(),
                    selected: $("input[name='pilih_paket']:checked").val(),
                    datebirth_reg: $('#datebirth_reg').val(),
                    payment_type: $("input[name='payment_type_reg']:checked").val(),
                    extension: favorite
                },
                dataType: 'json',
                success: function(data) {
                    // alert(data.message)
                    if (!data.success) {
                        alert(data.message);
                        $('#message_order_button').html(data.message);
                        // $('#btn_submit_order').hide();

                        $('#package_domestic').hide();
                        $('#package_international').hide();


                        return false;
                    }

                    $('#payment_desc').html(data.payment_desc);
                    $('#payment_fee').html(data.payment_fee);
                    $('#payment_fee_field').val(data.payment_fee);


                    $('#startdate_sum').html(data.startdate);
                    $('#enddate_sum').html(data.enddate);


                    if (data.region_id * 1 == 4) {
                        $('#package_domestic').show();
                        $('#package_international').hide();

                        $('#price_domestic').html('Rp. ' + data.domestic_price);
                        $('#price_gold_field').val(data.domestic_price);

                    } else {
                        $('#package_domestic').hide();
                        $('#package_international').show();
                    }

                    // $('#btn_submit_order').show();

                    console.log(data);
                    $('#price_gold').html('Rp. ' + data.gold);
                    $('#price_gold_field').val(data.gold);
                    $('#price_platinum').html('Rp. ' + data.platinum);
                    $('#price_platinum_field').val(data.platinum);
                    $('#price_diamond').html('Rp. ' + data.diamond);
                    $('#price_diamond_field').val(data.diamond);

                    $('#premium_id').val(data.premium_id);
                    $('#days').html(data.days + ' Hari');
                    $('#total_perluasan').html(data.total_perluasan);
                    $('#total_premi').html(data.total_premi);
                    $('#total_ex_premi').html(data.total_extra_premi);
                    
                    if(data.other_fee=='0'){
                      $('#container_other_fee').hide();
                    } else {
                      $('#container_other_fee').show();
                    }
                    $('#other_fee').html(data.other_fee);

                    $('#total_amount').html(data.total_amount);

                    $('#total_perluasan_field').val(data.total_perluasan);
                    // alert(data.total_extra_premi)
                    if (data.total_extra_premi * 1 != 0) {
                        $('#extra_premi_summary').show();
                        $('#extra_premi_summary_value').show();
                    } else {
                        $('#extra_premi_summary').hide();
                        $('#extra_premi_summary_value').hide();
                    }

                    $('#total_ex_premi_field').val(data.total_extra_premi);
                    $('#total_premi_field').val(data.total_premi);
                    $('#other_fee_field').val(data.other_fee);
                    $('#total_amount_field').val(data.total_amount);

                    $('#name_region').html(data.region_name_detail);
                }
            });

        }

    }

    $('input.departure_id').typeahead({
        name: 'departure_id',
        remote: '{$site_url}/backend/get_departure?query=%QUERY'
    });

    $('input.departure_id').on('typeahead:selected', function(evt, item) {
        set_package();
    });

    $('input.destination_id').typeahead({
        name: 'destination_id',
        remote: '{$site_url}/backend/get_destination?query=%QUERY'
    });

    $('input.destination_id').on('typeahead:selected', function(evt, item) {
        set_package();
    });

    $("#orderBtn").click(function() {
        window.location = '{$site_url}/order/page?startdate=' + $('#startdate').val() + '&enddate=' + $('#enddate').val() + '&departure_id=' + $('#depart').val() + '&destination_id=' + $('#dest').val() + '&type=single&num_person=' + $('#num_participant').val() + '&selected_package=' + $("#orderBtn").val();
    });


    $("#add_participant_form").click(function() {
        $('#form_participant').clone().appendTo('#list_participant');
    });


    // set_package();
    set_participant($("#num_participant").val());

 

    //field checking
    function field_checking() {

        if(logged=='1'){
          return true;
        }
        // $('#btn_submit_order').hide();

        // console.log('check:'+$('#email_reg').val());

        var firstname_ch = validateInputText('#firstname', '#firstname_ch');
        var lastname_ch = validateInputText('#lastname', '#lastname_ch');
        var address_ch = validateInputText('#address', '#address_ch');
        var identity_no_ch = validateInputText('#identity_no', '#identity_no_ch');
        var phone_number_reg_ch = validateInputText('#phone_number', '#phone_number_reg_ch');
        var datebirth_reg_ch = validateInputText('#datebirth_reg', '#datebirth_reg_ch');
        var city_ch = validateInputText('#city', '#city_ch');
        var zipcode_ch = validateInputText('#zipcode', '#zipcode_ch');
        var heirs_name_ch = validateInputText('#heirs_name', '#heirs_name_ch');
        var heirs_phone_ch = validateInputText('#heirs_phone', '#heirs_phone_ch');
        var heirs_datebirth_ch = validateInputText('#heirs_datebirth', '#heirs_datebirth_ch');
        var email_reg_ch = validateInputText('#email_reg', '#email_reg_ch');
        // var validateEmail = validateEmail($('#email_reg').val());
        // console.log('heirs_datebirth_ch:'+heirs_datebirth_ch);

        var a = new Date(to_ymd($('#startdate').val()));
        var b = new Date(to_ymd($('#enddate').val()));
        var diffDays = dateDiffInDays(a, b);

        var umur = 0;
        if($('#datebirth_reg').val()!=''){
          if($('#datebirth_reg').val()===undefined){
             umur = getAge(to_ymd($('#birthdate_logged').val()));
          } else {
             umur = getAge(to_ymd($('#datebirth_reg').val()));
          }
         
        }
        

       console.log(umur);

         if (umur*1 < 17) {
            // $('#form_valid').val('false');
            $('#message_order').show();
            $("#datebirth_reg_ch").text('Umur penanggung minimal 17 tahun');
            $("#datebirth_reg_ch").css("color", "red");
            return false;
        } else if (!validateEmail($('#email_reg').val())) {
         // console.log('Format Email Salah');
            // $('#form_valid').val('false');
            $("#email_reg_ch").text('Format Email Salah');
            $("#email_reg_ch").css("color", "red");
            $('#message_order').show();
            return false;
        } else 
        if (!firstname_ch) {
            // $('#form_valid').val('false');
            $('#message_order').show();

            // $('#message_order_button').html('Tentukan nama depan');
            return false;
        } else if (!identity_no_ch) {
             // $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan nama depan');
            return false;
        }  else if (!phone_number_reg_ch) {
             // $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan nama depan');
            return false;
        } else if (!lastname_ch) {
             // $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan nama belakang');
            return false;
        } else if (!address_ch) {
          // $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan alamat sesuai KTP/KITAS/Passport');
            return false;
        } else if (!datebirth_reg_ch) {
          // $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan tanggal lahir');
            return false;
        } else if (!city_ch) {
          // $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan kota');
            return false;
        } else if (!zipcode_ch) {
          // $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan kode pos');
            return false;
        } else if (!heirs_name_ch) {
          // $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan nama pewaris');
            return false;
        } else if (!heirs_phone_ch) {
          // $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan nomor telepon/handphone pewaris');
            return false;
        } else if (!heirs_datebirth_ch) {
          // $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan tanggal lahir pewaris');
            return false;
        } else if (!email_reg_ch) {
          // $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan alamat email');
            return false;
        } 
        // else if (!validateEmail($('#email_reg').val())) {
        //  console.log('Format Email Salah');
            // $('#form_valid').val('false');
        //     $("#email_reg_ch").text('Format Email Salah');
        //     $("#email_reg_ch").css("color", "red");
        //     $('#message_order').show();
        //     return false;
        // } 
        else if (diffDays < 0) {
          // $('#form_valid').val('false');
            $('#message_order').show();
            $("#startdate_ch").text('Tanggal mulai tidak boleh melebihi tanggal akhir');
            $("#startdate_ch").css("color", "red");
            return false;
        } else if (diffDays == 0) {
          // $('#form_valid').val('false');
            $('#message_order').show();
            $("#startdate_ch").text('Tanggal mulai tidak boleh sama dengan tanggal akhir');
            $("#startdate_ch").css("color", "red");
            return false;
        }  else {
            
            $('#message_order').hide();
            $("#email_reg_ch").text('');
            $("#email_reg_ch").css("color", "green");

            if($('#form_valid').val()!='submit'){
            //    alert($('#form_valid').val())
               // $('#btn_submit_order').show();
               // $('#form_valid').val('true');

            } else {

            }
            
             return true;
        }

        

        if (!validateEmail($('#email_reg').val())) {
         console.log('Format Email Salah');
            $('#form_valid').val('false');
            $("#email_reg_ch").text('Format Email Salah');
            $("#email_reg_ch").css("color", "red");
            $('#message_order').show();
            return false;
        } 

   }

    if (logged * 1 == 1) {} else {
        field_checking();
        setInterval(field_checking, 1000);
    }

    //validation
    // field_checking();

    $("#dest").keyup(function() {
      
         $('#success_msg').hide();
       
    });
    


 $("#voucher_code_btn").on('click',function(e){
        e.preventDefault();
        // $('#success_msg').css("position","relative");
        // $('#success_msg').css("top","-19px");
        // $('#success_msg').css("top","-19px");
        console.log($('#dest').val())
        $.ajax({
            method:'GET',
            url:SITE_URL +'product/check_voucher',
            data:{
              voucher_code:$('#voucher_code').val(),
              destination_name:$('#dest').val()
            },
            dataType: 'json',
            success:function(data){
              
              console.log(data.status)
              console.log(data.message)
                // var d =parseJSON(data);


                if(data.status==true){
                  $('#voucher_code_btn').css('display','none');
                  $('#cancel_disc').css('display','inline');
                  
                  $("#success_msg").css('font-size','9px');
                  $("#success_msg").css('color','#c0c0c0');

                  var d         = data.data;
                  var price     = $('#total_amount_field').val();
                  var new_price = price.replace(/,/g,'');
                  console.log(new_price)
                  if(d.disc_type==2){

                    diskon = (d.disc_percentage/100)*new_price;
                    var total_price =new_price-diskon;
                    //total_amount_field
                    if($('#total_amount_field').val()!=''){
                      $("#success_msg").show();
                      $("#success_msg").html("Selamat Kode Voucher Valid. Anda mendapatkan diskon sebesar Rp. "+diskon);
                      $('#total_amount').html(total_price.toLocaleString())
                      $('#total_amount_field').val(total_price.toLocaleString())  
                      $('#discount_amount_field').val(d.disc_percentage*1)  
                    }else{
                      alert("Oops, Total Pembayaran Masih kosong silihkan pilih harga");
  
                    }
                    

                  }else if(d.disc_type==1){

                    diskon = d.disc_amount;
                    console.log(new_price);
                    var total_price =new_price-diskon;
                    if($('#total_amount_field').val()!='' ){
                      $("#success_msg").show();
                      $("#success_msg").html("Selamat Kode Voucher Valid. Anda mendapatkan diskon sebesar Rp. "+diskon);
                      $('#total_amount').html(total_price.toLocaleString())
                      $('#total_amount_field').val(total_price.toLocaleString())  
                      $('#discount_amount_field').val(d.disc_amount)  
                    }else{
                      alert("Oops, Total Pembayaran Masih kosong silihkan pilih harga");
                                           
                    }
                  }

                }else{
                  $("#success_msg").show();
                  $("#success_msg").html(data.message);
                  $("#success_msg").css('font-size','9px');
                  $("#success_msg").css('color','#c0c0c0');
                }

            },failure:function(data){
              // $('#voucher_code_btn').css('left','-69px');
              // $('#cancel_disc').css('display','block');
              // $('#cancel_disc').css('position','relative');
              // $('#cancel_disc').css('margin-left','451px');
              // $('#cancel_disc').css('top','-45px');
              // // top: -26px;
              // $('#cancel_disc').css('margin-bottom',' -19px');
            }
        });
    });
    $('#cancel_disc').click(function(e){
        e.preventDefault();
       
        $('#total_amount').html(null)
       
        set_package();
        
        console.log(set_package)
        // if()
        $('#voucher_code').val(null);
        $("#success_msg").hide();
        $('#voucher_code_btn').show();
        $('#cancel_disc').css('display','none');
        // set_package();
    });

    window.XMLHttpRequest = newXHR;


});              
</script>