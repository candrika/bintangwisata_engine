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
#voucher_code{
    float: left;
    left: 11px;
    top: -7px;
}
/* Extra small devices (phones, 600px and down) */
/*@media only screen and (max-width: 360px) {
  
  #voucher_code{
    position: relative !important;
    right: 1px !important;
    width: 75% !important;
  }
  #voucher_code_btn{
    position: relative;
    left: 201px;
  }
  #cancel_disc{
    right: -42px !important;
    top: 28px;
  }
}*/
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
    right:122px !important;
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
<link rel="stylesheet" href="{$base_url}assets/tpl/css/update.css">

<!-- <div id="loading_top_bar" style="width:100%; position:absolute; bottom:0px border:0px; background-color:#232323; color:#ffffff; padding-top:5px; padding-bottom:5px; font-size:12px" align="center">
</div> -->
            <section id="content" style="background: #fff; margin-top: 20px; border-radius: 20px;">
                <div class="container container-content-shadow">
                     <div class="row">
                        <div id="main" class="col-sm-12 col-md-12">
                           <div class="booking-section travelo-box">
                              <form id="order_form" class="cruise-booking-form" action="{$site_url}/order/proceed" method="POST" novalidate>
                                <input type="hidden" name="form_valid" id="form_valid">
                                <input type="hidden" name="booking_id" id="insured_id">
                                <input type="hidden" name="birthdate_logged" id="birthdate_logged">
                                <input type="hidden" name="user_id" id="user_id">
                                <input type="hidden" name="type_id" id="type_id">
                                <input type="hidden" name="total_amount" id="total_amount_field" value="">
                                  <nav style="margin-bottom: 40px;">
                                    <ol class="cd-multi-steps text-bottom count">
                                      <li class="visited"><a href="#0">Pilih Pesawat</a></li>
                                      <li class="visited"><a href="#1">Preview</a></li>
                                      <li class="current"><a href="#2">Pemesanan</a></li>
                                      <li><em>Pembayaran</em></li>
                                    </ol>
                                  </nav>
                                  
                                <h1>Data Pesanan</h1>

                                          {if $logged eq true}
                                             <div class="row" id="row_info_success_login">
                                               <div class="form-group col-sm-6 col-md-4">
                                                   <label><b>Anda Mendaftar Sebagai: <span id="name_login"></span></b></label>
                                                </div>
                                             </div>
                                          {/if}

                                <div class="row" id="form_login" style="display:none;">
                                       <hr>
                                       <div class="col-xs-11">
                                          <h2><i class="soap-icon-user" style="color: #01b7f2;"></i> Login</h2>
                                         

                                          {if $logged eq false}
                                          <div class="row" id="row_info_login">
                                             <div class="form-group col-sm-6 col-md-4">
                                                <label>Email</label>
                                                <input type="email" class="input-text full-width" id="email_login" name="email_login">
                                             </div>
                                             <div class="form-group col-sm-6 col-md-4">
                                                <!-- <div class="row"> -->
                                                <!-- <div class="col-xs-7"> -->
                                                <label>Password</label>
                                                <input type="password" class="input-text full-width" id="pass_login" name="pass_login">
                                                <!-- </div> -->
                                                <!--  <div class="col-xs-5">
                                                   <label><span style="color:#FFF;">-</span></label>
                                                   <button data-animation-duration="1" data-animation-type="bounce" class="full-width icon-check animated bounce" type="submit" style="animation-duration: 1s; visibility: visible;">Login</button>
                                                   </div> -->
                                                <!-- </div> -->
                                             </div>
                                             <div class="form-group col-sm-6 col-md-2">
                                                <label><span style="color:#FFF;">-</span></label>
                                                <label id="btnSubmitLogin" data-animation-duration="1" data-animation-type="bounce" class="full-width icon-check animated bounce" style="padding:5px 5px 5px 5px; background-color:#7db921; color:#FFF; animation-duration: 1s; visibility: visible;">&nbsp;&nbsp;&nbsp;<b>Login</b></label> 

                                                <span id="loadingLogin" style="display:none;">Loading...</span>
                                                <!-- <a href="#">Lupa Password?</a> -->
                                             </div>
                                          </div>
                                          {/if}

                                          <div class="form-group">
                                             <!-- <div class="checkbox"> -->
                                             <label>
                                             <a id="show_reg_form"><span class="skin-color">Belum memiliki akun?</span></a>.
                                             </label>
                                             <!-- </div> -->
                                          </div>
                                       </div>
                                    </div>

                                    {if $logged eq false}
                                    <div class="person-information" style="display:block;" id="form_pendaftaran">
                                      <hr>
                                      <h2><i class="soap-icon-doc-plus" style="color: #01b7f2;"></i> Pendaftaran</h2>
                                      <div class="form-group">
                                       <label id="show_login_form">
                                          <div class="icon-box style1"><i class="soap-icon-notice"></i>Sudah memiliki akun?</div>
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
                                                <input type="text" value="{$birthdate}" id="datebirth_reg" placeholder="dd-mm-yy" class="input-text full-width" name="datebirth" placeholder="select date" />
                                                
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
                                           <!--   <div class="col-md-6">
                                                <label>Kota</label>
                                                <input type="text" class="input-text full-width" id="city" name="city">
                                                <span id="city_ch">
                                             </div>
                                             <div class="col-md-6">
                                                <label>Kode POS</label>
                                                <input type="text" class="input-text full-width" id="zipcode" name="zipcode">
                                                <span id="zipcode_ch">
                                             </div> -->
                                          </div>
                                       </div>
                                    </div>
                                    <!-- <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>Nama Keluarga yang dapat dihubungi</label>
                                          <input type="text" class="input-text full-width" name="heirs_name" id="heirs_name">
                                          <span id="heirs_name_ch">
                                       </div>
                                       <div class="form-group col-sm-6 col-md-5">
                                          <div class="row">
                                             <div class="col-md-6">
                                                <label>No Handphone Keluarga yang dapat dihubungi</label>
                                                <input type="text" class="input-text full-width" name="heirs_phone" id="heirs_phone">
                                                <span id="heirs_phone_ch">
                                             </div>
                                             <div class="col-md-6">
                                                <label>Tanggal Lahir Keluarga yang dapat dihubungi</label>
                                                <div class="datepicker-wrap">
                                                   <input type="text" placeholder="dd-mm-yy" class="input-text full-width" id="heirs_datebirth" name="heirs_datebirth" placeholder="select date" />
                                                   
                                                </div>
                                                <span id="heirs_datebirth_ch">
                                             </div>
                                          </div>
                                       </div>
                                    </div> -->
                                  </div>
                                    <!-- <div class="form-group">
                                       <div class="checkbox">
                                          <label>
                                          <input type="checkbox" name="cb_promo" value="1"> Saya ingin menerima promosi dari <span class="skin-color">Jasindo Travel</span> melalui email
                                          </label>
                                       </div>
                                    </div>
                                 </div> -->
                                  {/if}

                                 <div class="card-information">
                                    <div class="row">
                                       <div class="col-md-4">
                                          <label>Jumlah Dewasa {$paxAdult} Orang</label>
                                          <!-- <div class="selector">
                                             {$cb_participant}
                                          </div> -->
                                       </div>
                                       <div class="col-md-4">
                                          <label>Jumlah Anak {$paxChild} Orang</label>
                                          <!-- <div class="selector">
                                             {$cb_participant}
                                          </div> -->
                                       </div>
                                       <div class="col-md-4">
                                          <label>Jumlah {$paxInfant} Orang</label>
                                          <!-- <div class="selector">
                                             {$cb_participant}
                                          </div> -->
                                       </div>
                                    </div>
                                    <!-- <br> -->
                                     <hr>
                                 <div class="row">
                                   <div class="col-md-4">
                                          <label>Jumlah Penumpang Dewasa {$paxAdult} Orang</label>
                                          {if $paxAdult ge 1}
                                          {for $foo=1 to $paxAdult}
                                            <div class="form-group col-sm-6 col-md-4">
                                              <select class="full-width" name="adult_title[]" value="">
                                                   <option value="Nyonya">Nyonya</option>
                                                   <option value="Tuan">Tuan</option>
                                                   <option value="Nona">Nona</option>
                                              </select>
                                            <span id="adult_title">
                                          </div>
                                          <div class="form-group col-md-8">
                                            <!-- <label>No KTP/KITAS/Passport</label> -->
                                              <input type="text" class="input-text full-width" id="adult_name" name="adult_name[]">
                                             <span id="adult_name_ch">
                                          </div>
                                          <div class="form-group col-sm-6 col-md-4">
                                              <select class="full-width" name="phone_id[]" value="">
                                                   <!-- <option value="Nyonya">Nyonya</option>
                                                   <option value="Tuan">Tuan</option>
                                                   <option value="Nona">Nona</option> -->
                                              </select>
                                            <span id="adult_title">
                                          </div>
                                          <div class="form-group col-md-8">
                                            <!-- <label>No KTP/KITAS/Passport</label> -->
                                              <input type="text" class="input-text full-width" id="phone_no" name="phone_no[]">
                                             <span id="adult_name_ch">
                                          </div>
                                          {/for}
                                          {else}
                                          <div class="form-group col-sm-6 col-md-4">
                                              <select class="full-width" name="adult_title[]" value="">
                                                   <option value="Nyonya">Nyonya</option>
                                                   <option value="Tuan">Tuan</option>
                                                   <option value="Nona">Nona</option>
                                              </select>
                                            <span id="adult_title">
                                          </div>
                                          <div class="form-group col-md-8">
                                            <!-- <label>No KTP/KITAS/Passport</label> -->
                                              <input type="text" class="input-text full-width" id="adult_name" name="adult_name[]">
                                             <span id="adult_name_ch">
                                          </div>
                                          <div class="form-group col-sm-6 col-md-4">
                                              <select class="full-width" name="phone_id[]" value="">
                                                   <!-- <option value="Nyonya">Nyonya</option>
                                                   <option value="Tuan">Tuan</option>
                                                   <option value="Nona">Nona</option> -->
                                              </select>
                                            <span id="adult_title">
                                          </div>
                                          <div class="form-group col-md-8">
                                            <!-- <label>No KTP/KITAS/Passport</label> -->
                                              <input type="text" class="input-text full-width" id="phone_no" name="phone_no[]">
                                             <span id="adult_name_ch">
                                          </div>
                                          {/if}
                                       </div>
                                       <div class="col-md-4">
                                          <label>Jumlah Penumpang Anak {$paxChild} Orang</label>
                                          {if $paxChild ge 1}
                                          {for $foo=1 to $paxChild}
                                          <div class="form-group col-sm-6 col-md-4">
                                              <select class="full-width" name="child_title[]" value="">
                                                   <option value="Nyonya">Nyonya</option>
                                                   <option value="Tuan">Tuan</option>
                                                   <option value="Nona">Nona</option>
                                              </select>
                                            <span id="child_title">
                                          </div>
                                          <div class="form-group col-md-8">
                                            <!-- <label>No KTP/KITAS/Passport</label> -->
                                              <input type="text" class="input-text full-width" id="child_name" name="child_name[]">
                                             <span id="child_name_ch">
                                          </div>

                                          {/for}
                                          {else}
                                             <div class="form-group col-sm-6 col-md-4">
                                              <select class="full-width" name="child_title[]" value="">
                                                   <option value="Nyonya">Nyonya</option>
                                                   <option value="Tuan">Tuan</option>
                                                   <option value="Nona">Nona</option>
                                              </select>
                                            <span id="child_title">
                                          </div>
                                          <div class="form-group col-md-8">
                                            <!-- <label>No KTP/KITAS/Passport</label> -->
                                              <input type="text" class="input-text full-width" id="child_name" name="child_name[]">
                                             <span id="child_name_ch">
                                          </div>
                                          {/if}
                                       </div>
                                       <div class="col-md-4">
                                          <label>Jumlah Penumpang Bayi {$paxInfant} Orang</label>
                                          {if $paxInfant ge 1}
                                          {for $foo=1 to $paxInfant}
                                            <div class="form-group col-sm-6 col-md-4">
                                              <select class="full-width" name="infant_title[]" value="">
                                                   <option value="Nyonya">Nyonya</option>
                                                   <option value="Tuan">Tuan</option>
                                                   <option value="Nona">Nona</option>
                                              </select>
                                            <span id="child_title">
                                          </div>
                                          <div class="form-group col-md-8">
                                            <!-- <label>No KTP/KITAS/Passport</label> -->
                                              <input type="text" class="input-text full-width" id="infant_name" name="infant_name[]">
                                             <span id="infant_name_ch">
                                          </div>
                                          {/for}
                                          {else}
                                             <div class="form-group col-sm-6 col-md-4">
                                              <select class="full-width" name="infant_title[]" value="">
                                                   <option value="Nyonya">Nyonya</option>
                                                   <option value="Tuan">Tuan</option>
                                                   <option value="Nona">Nona</option>
                                              </select>
                                            <span id="child_title">
                                          </div>
                                          <div class="form-group col-md-8">
                                            <!-- <label>No KTP/KITAS/Passport</label> -->
                                              <input type="text" class="input-text full-width" id="infant_name" name="infant_name[]">
                                             <span id="infant_name_ch">
                                          </div>
                                          {/if}
                                       </div>
                                    <!-- <hr> -->
                                    <!-- <a id="add_participant_form">Tambah</a> -->
                                    <!-- </div> -->
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
                                 
                              </form>
                           </div>
                        </div>
                     </div>
                  </div>
            </section><p>&nbsp;</p>


<script type="text/javascript">

var logged = 0;

function myFunction() {
    // Get the snackbar DIV
    var x = document.getElementById("snackbar")

    // Add the "show" class to DIV
    x.className = "show";

    // After 3 seconds, remove the show class from DIV
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}

jQuery(document).ready(function($) {

  $("#voucher_code").prop('disabled',true);
  
  $(".feature").hide();
  $(".value").hide();
  $("#voucher_code").hide();

  console.log(logged);
  if('{$airlinePrice->promoCode}'!=''){
      $(".feature").show();
      $(".value").show();
      $("#voucher_code").show();
  }

  if(logged==1){
    $('#voucher_code_btn').css('right','-147px');
  }

  $("#success_msg").hide();
   try {
      $("input[type='text']").each(function(){
                     $(this).attr("autocomplete","off");
                  });
  }
  catch (e)
  { }
   var x = document.getElementById("snackbar");
   x.className = "show";
   setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000); 

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
                     window.location = '{$site_url}/order/page?startdate=' + $('#startdate').val() + '&enddate=' + $('#enddate').val() + '&departure_id=' + $('#cb_depart').val() + '&destination_id=' + $('#cb_dest').val() + '&type=single&num_person=' + this.value + '&datebirth='+$('#datebirth_reg').val();

                    $('#row_info_login').hide();
                    $('#show_reg_form').hide();
                    $('#row_info_success_login').show();
                    $('#name_login').html(data.fullname);
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
       window.location = '{$site_url}/order/page?startdate=' + $('#startdate').val() + '&enddate=' + $('#enddate').val() + '&departure_id=' + $('#cb_depart').val() + '&destination_id=' + $('#cb_dest').val() + '&type=single&num_person=' + this.value + '&datebirth='+$('#datebirth_reg').val();
    });

    $("#cb_depart").change(function() {
        // set_package();
    });

    $("#cb_dest").change(function() {
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

    if($('#datebirth_reg').val()==''){
      // alert('saya')
     
      // $('#cancel_disc').css('top','311px');
    }

   

    $("#show_reg_form").click(function() {
        $("#form_pendaftaran").show(1000);
        $("#form_login").hide(1000);
    });

    $("#show_login_form").click(function() {
        $("#form_pendaftaran").hide(1000);
        $("#form_login").show(1000);
    });

    $("#num_participant").change(function() {
        // $('#list_participant').empty();
        // jQuery('#list_participant div').html('');
        // set_participant(this.value)
    });

    $("#cb_family").change(function() {
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

    function set_participant(num) {
        set_package();
        // console.log('num:'+this.value);
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

    function set_total(pilih) {
        console.log('set_total');
    }

    function set_package() {
        console.log('set_package');


        console.log($('#cb_depart').val());
        if ($('#cb_depart').val() == '') {
            $("#notif_searchbox").show(200);
            $('#search_msg').html("Pilih Keberangkatan");
        } else if ($('#cb_dest').val() == '') {
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
                    depart_id: $('#cb_depart').val(),
                    destination_id: $('#cb_dest').val(),
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
        window.location = '{$site_url}/order/page?startdate=' + $('#startdate').val() + '&enddate=' + $('#enddate').val() + '&departure_id=' + $('#cb_depart').val() + '&destination_id=' + $('#cb_dest').val() + '&type=single&num_person=' + $('#num_participant').val() + '&selected_package=' + $("#orderBtn").val();
    });


    $("#add_participant_form").click(function() {
        $('#form_participant').clone().appendTo('#list_participant');
    });


    // set_package();
    set_participant($("#num_participant").val());

    
    if (logged * 1 == 1) {
        $('#row_info_success_login').show();
        $('#show_reg_form').hide();
        $('#name_login').html('{$fullname}');
        

    } else {
      // alert('s')
        $('#row_info_success_login').hide();
        $('#show_reg_form').show();
        $('#name_login').html(null);
        $('#birthdate_logged').val(null);
    }

    var birthdate_val = '{$birthdate}';
    $('#birthdate_logged').val(birthdate_val);

    // alert($('#birthdate_logged').val())

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
            $('#form_valid').val('false');
            $('#message_order').show();
            $("#datebirth_reg_ch").text('Umur penanggung minimal 17 tahun');
            $("#datebirth_reg_ch").css("color", "red");
            return false;
        } else if (!validateEmail($('#email_reg').val())) {
         // console.log('Format Email Salah');
            $('#form_valid').val('false');
            $("#email_reg_ch").text('Format Email Salah');
            $("#email_reg_ch").css("color", "red");
            $('#message_order').show();
            return false;
        } else 
        if (!firstname_ch) {
            $('#form_valid').val('false');
            $('#message_order').show();

            // $('#message_order_button').html('Tentukan nama depan');
            return false;
        } else if (!identity_no_ch) {
             $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan nama depan');
            return false;
        }  else if (!phone_number_reg_ch) {
             $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan nama depan');
            return false;
        } else if (!lastname_ch) {
             $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan nama belakang');
            return false;
        } else if (!address_ch) {
          $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan alamat sesuai KTP/KITAS/Passport');
            return false;
        } else if (!datebirth_reg_ch) {
          $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan tanggal lahir');
            return false;
        } else if (!city_ch) {
          $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan kota');
            return false;
        } else if (!zipcode_ch) {
          $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan kode pos');
            return false;
        } else if (!heirs_name_ch) {
          $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan nama pewaris');
            return false;
        } else if (!heirs_phone_ch) {
          $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan nomor telepon/handphone pewaris');
            return false;
        } else if (!heirs_datebirth_ch) {
          $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan tanggal lahir pewaris');
            return false;
        } else if (!email_reg_ch) {
          $('#form_valid').val('false');
            $('#message_order').show();
            // $('#message_order_button').html('Tentukan alamat email');
            return false;
        } 
        // else if (!validateEmail($('#email_reg').val())) {
        //  console.log('Format Email Salah');
        //     $('#form_valid').val('false');
        //     $("#email_reg_ch").text('Format Email Salah');
        //     $("#email_reg_ch").css("color", "red");
        //     $('#message_order').show();
        //     return false;
        // } 
        else if (diffDays < 0) {
          $('#form_valid').val('false');
            $('#message_order').show();
            $("#startdate_ch").text('Tanggal mulai tidak boleh melebihi tanggal akhir');
            $("#startdate_ch").css("color", "red");
            return false;
        } else if (diffDays == 0) {
          $('#form_valid').val('false');
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
               $('#form_valid').val('true');

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

    $("#cb_dest").keyup(function() {
      
         $('#success_msg').hide();
       
    });
    
    $("#voucher_code_btn").on('click',function(e){
        e.preventDefault();
        field_checking()
        // $('#success_msg').css("position","relative");
        // $('#success_msg').css("top","-19px");
        // $('#success_msg').css("top","-19px");
        
        $.ajax({
            method:'GET',
            url:SITE_URL +'product/check_voucher',
            data:{
              voucher_code:$('#voucher_code').val(),
              destination_name:$('#cb_dest').val()
            },
            dataType: 'json',
            success:function(data){
              
              console.log(data.status)
              console.log(data.message)
                // var d =parseJSON(data);


                if(data.status==true){
                  if($('#total_amount').val()==''){  
                
                    $('#voucher_code_btn').css('display','none');
                    $('#cancel_disc').css('display','inline');
                    $("#success_msg").show();
                    // $("#success_msg").html(data.message);
                     
                    $("#success_msg").css('font-size','9px');
                    $("#success_msg").css('color','#c0c0c0');
                
                  }else{
                    
                    // $("#success_msg").html("Oops, Total Pembayaran Masih kosong silihkan pilih harga");
                    $("#success_msg").css('font-size','9px');
                    $("#success_msg").css('color','#c0c0c0');
                  }  
                  var d         = data.data;
                  var price     = $('#total_amount_field').val();
                  var new_price = price.replace(/,/g,'');
                  console.log(new_price)
                  if(d.disc_type==2){
                    var diskon      = (d.disc_percentage/100)
                    diskon_amount   =  diskon*new_price;
                    var total_price = new_price-diskon_amount;
                    //total_amount_field
                    
                    if($('#total_amount_field').val()!=''){
                      console.log(diskon)
                      $("#success_msg").html("Selamat Kode Voucher Valid. Anda mendapatkan diskon sebesar Rp "+diskon_amount.toLocaleString());    
                      // $("#success_msg").show();
                      // $("#success_msg").html(data.message);
                      $('#total_amount').html(total_price.toLocaleString())
                      $('#total_amount_field').val(total_price.toLocaleString())  
                      $('#discount_amount_field').val(d.disc_percentage*1)  
                      $('#id_voucher_code_field').val(d.id_voucher*1)  
                    }else{
                      alert("Oops, Total Pembayaran Masih kosong silihkan pilih harga");  
                    }
                    

                  }else if(d.disc_type==1){

                    diskon = d.disc_amount;
                    console.log(new_price);
                    var total_price =new_price-diskon;
                    if($('#total_amount_field').val()!='' ){
                      $("#success_msg").show();
                      $("#success_msg").html("Selamat Kode Voucher Valid. Anda mendapatkan diskon sebesar Rp "+diskon.toLocaleString());    

                      // $("#success_msg").html(data.message);
                      $('#total_amount').html(total_price.toLocaleString())
                      $('#total_amount_field').val(total_price.toLocaleString())  
                      $('#discount_amount_field').val(d.disc_amount)  
                      $('#id_voucher_code_field').val(d.id_voucher)  
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
        set_package();
        console.log(set_package())
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