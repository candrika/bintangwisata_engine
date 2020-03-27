 <style>
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



                             <form class="login-form" method="POST" action ="{$site_url}/intermediary/save_register_intermediary" id="register_form_intermediary" enctype="multipart/form-data">
                                <div class="row">

                                    <div class="col-sm-12">
                                        <div class="search-box-wrapper style1">
                              <div class="search-box">
                                 <div class="search-tab-content  container-content-shadow" style="">
                                   
                                    <div class="tab-pane fade active in" id="flights-tab">
                                       
                                          <div class="title-container">
                                             <h2 class="search-title">Travel Agent</h2>
                                             <p>Masukan data-data yang dibutuhkan melalui form dibawah ini.</p>
                                             <i class="soap-icon-plane-right takeoff-effect"></i>
                                          </div>
                                         <div class="search-content">
                                             <h5 class="title">Data Perusahaan</h5>
                                             <div class="row">
                                                <div class="col-md-6">
                                                   <label>Nama Perusahaan</label>
                                                   <input type="text" class="input-text full-width departure_id" name="company_name" id="company_name" placeholder="Masukkan Nama Perusahaan"/>
                                                   <span id="company_name_ch"></span>
                                                </div>
                                                <div class="col-md-6">
                                                   <label>Nama Legal</label>
                                                    <input type="text" class="input-text full-width destination_id" name="legal_name" id="legal_name" placeholder="Masukkan Nama Legal Perusahaan"/>
                                                    <span id="legal_name_ch"></span>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-12">
                                                   <label>Alamat</label>
                                                   <textarea style="width: 100%;" id="address" name="address" placeholder="Masukkan Alamat"></textarea>
                                                   <span id="address_ch"></span>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-6">
                                                   <label>No Telepon</label>
                                                   <input type="text" class="input-text full-width departure_id" id="company_phone" name="company_phone" placeholder="Masukkan No Telephon"/>
                                                   <span id="company_phone_ch"></span>
                                                </div>
                                                <div class="col-md-6">
                                                   <label>Nomor Fax</label>
                                                    <input type="text" class="input-text full-width destination_id" name="company_fax_number" id="company_fax_number" placeholder="Masukkan No Fax"/>
                                                    <span id="company_fax_number_ch"></span>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-6">
                                                   <label>Website</label>
                                                   <input type="text" class="input-text full-width departure_id" name="company_web" id="company_web" placeholder="Masukkan Alamat web Perusahaan"/>
                                                </div>
                                                <div class="col-md-6">
                                                   <label>Alamat Email</label>
                                                    <input type="text" class="input-text full-width destination_id" id="email_office" name="email_office" placeholder="Masukkan Alamat Email Perusahaan"/>
                                                    <span id="email_office_ch"></span>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-12">
                                                   <label>Nama Bank</label>
                                                   <input type="text" class="input-text full-width departure_id" name="company_bank_name" id="company_bank_name" placeholder="Masukkan  Nama Bank"/>
                                                   <span id="company_bank_name_ch"></span> 
                                                </div>
                                             </div>
                                              <div class="row">
                                                <div class="col-md-12">
                                                   <label>Nomor Akun Bank</label>
                                                   <input type="text" class="input-text full-width departure_id" name="account_number" id="account_number"placeholder="Masukkan Nomor Akun Bank"/><span id="account_number_ch"></span>
                                                </div>
                                             </div>
                                              <div class="row">
                                                <div class="col-md-12">
                                                   <label>Nama Pemegang Akun</label>
                                                   <input type="text" class="input-text full-width departure_id" id="account_name" name="account_name" id="account_name" placeholder="Masukkan Nama Pemegang Akun"/>
                                                   <span id="account_name_ch"></span>
                                                </div>
                                             </div>
                                              <div class="row">
                                                <div class="col-md-12">
                                                   <label>Dokumen PKS</label>
                                                   <input type="file" class="input-text full-width departure_id" id="pks_file" name="pks_file"/>
                                                   <span id="pks_file_ch"></span>
                                                </div>
                                             </div>
                                             <hr>
                                             <h5 class="title">Informasi Agen</h5>
                                             <!-- <label>Mulai</label> -->
                                             <div class="row">
                                                <div class="col-md-6">
                                                   <label>Email</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="text" id="email_agent" name="email_agent" class="input-text full-width" placeholder="Masukkan Email Agen"/>
                                                      <span id="email_agent_ch"></span>
                                                   <!-- </div> -->
                                                </div>
                                                <div class="col-md-6">
                                                   <label>Kata Kunci</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="password" name="password_agent" id="password_agent" class="input-text full-width" placeholder="Masukkan Password Agen"/>
                                                      <span id="password_agent_ch"></span>
                                                   <!-- </div> -->
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-12">
                                                   <label>Nama Lengkap</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="text" id="fullname_agent" name="fullname_agent" class="input-text full-width" placeholder="Masukkan Nama Lengkap"/>
                                                      <span id="fullname_agent_ch"></span>
                                                   <!-- </div> -->
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-6">
                                                   <label>No Handphone</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="text" id="phone_number_agent" name="phone_number_agent"  class="input-text full-width" placeholder="Masukkan No Handphone Agen"/>
                                                   <!-- </div> -->
                                                   <span id="phone_number_agent_ch"></span>
                                                </div>
                                                <div class="col-md-6">
                                                   <label>No Telepon</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="text" name="phone_number_agent1" id="phone_number_agent1" class="input-text full-width" placeholder="Masukkan No Telepon Agen"/>
                                                   <!-- </div> -->
                                                   <span id="phone_number_agent1_ch"></span>
                                                </div>
                                             </div>
                                              <div class="row">
                                                <div class="col-md-12">
                                                   <label>Alamat</label>
                                                   <textarea style="width: 100%;" name="intermediary_agent_address" id="address_agent" placeholder="Masukkan Alamat Agen"></textarea>
                                                   <span id="address_agent_ch"></span> 
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-6">
                                                   <label>Tanggal Lahir</label>
                                                   <div class="datepicker-wrap-order">
                                                      <input type="text" name="birthdate_agent" id="birthdate_agent" class="input-text full-width" placeholder="Masukkan Tanggal Lahir Agen"/>
                                                      <span id="birthdate_agent_ch"></span>
                                                   </div>
                                                </div>
                                                <div class="col-md-6">
                                                   <label>No KTP</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="text" name="identity_no_agent" id="identity_no_agent" class="input-text full-width" placeholder="Masukkan No KTP Agen"/>
                                                      <span id="identity_no_agent_ch"></span>
                                                   <!-- </div> -->
                                                </div>
                                             </div>
                                             <!-- <hr> -->
                                             <br>
                                                   <button id="btn_submit_register_intermediary" class="button btn-large sky-blue1" style="width:100%;">Daftar
                                          </div>
                                       
                                    </div>
                                 </div>
                              </div>
                           </div>
                                    </div>

                                </div></form>
                            
                        </div>

<script type="text/javascript">
// $( "#forgot_btn" ).click(function( event ) {
//   event.preventDefault();
//   window.location = SITE_URL+'/login/forgot';
// });

// $( "#register_btn" ).click(function( event ) {
//   event.preventDefault();
//   window.location = SITE_URL+'/register';
// });

function myFunction() {
    // Get the snackbar DIV

    var x = document.getElementById("snackbar")

    // Add the "show" class to DIV
    x.className = "show";

    // After 3 seconds, remove the show class from DIV
    // setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}


jQuery(document).ready(function($){

  $("#birthdate_agent").datepicker({
    dateFormat: 'dd-mm-yy'
  }); 

  $('#register_form_intermediary').on('keyup keypress', function(e) {
        var keyCode = e.keyCode || e.which;
        console.log(keyCode);
        if (keyCode === 13) {
            e.preventDefault();
            return false;
        }
  });

  $('#register_form_intermediary').submit(function(e) {
      e.preventDefault(); 
      console.log($('#pks_file').val());
      console.log($('form').serializeArray());
      console.log($('#email_agent').val());
      console.log($('#email_office').val());
      // alert('submit')

      var x = document.getElementById("snackbar");
      x.className = "show";

      if(field_check()){
        x.className = "show";
        $.ajax({
            url:$('form').attr("action"),
            type:"post",
            data:new FormData(this),
            processData:false,
            contentType:false,
            cache:false,
            success: function(data){
              console.log(data)
              var d =jQuery.parseJSON(data)
              if(d.success==true){
                alert(d.message);
                window.location = d.url_direct;           
              }else{
                alert(d.message);
                e.preventDefault();
              }

            },failure:function(d){
              console.log(d)

            }
        });          
      }else{
        e.preventDefault();  
        alert("Harap periksa kembali data-data anda");
        x.className = x.className.replace("show", "");
      }
  })

  function field_check(){
    
      //validasi untuk form perusahaan
      var company_name_ch = validateInputText('#company_name','#company_name_ch');
      var legal_name_ch = validateInputText('#legal_name','#legal_name_ch');
      var address_ch = validateInputText('#address','#address_ch');
      var company_phone_ch = validateInputText('#company_phone','#company_phone_ch');
      var email_office_ch = validateInputText('#email_office','#email_office_ch');
      var company_fax_number_ch = validateInputText('#company_fax_number','#company_fax_number_ch');
      var company_bank_name_ch = validateInputText('#company_bank_name','#company_bank_name_ch');
      var account_number_ch = validateInputText('#account_number','#account_number_ch');
      var account_name_ch = validateInputText('#account_name','#account_name_ch');
      var pks_file_ch = validateInputText('#pks_file','#pks_file_ch');

      //validasi untuk form agent
      var email_agent_ch = validateInputText('#email_agent','#email_agent_ch');
      var password_agent_ch = validateInputText('#password_agent','#password_agent_ch');
      var fullname_agent_ch = validateInputText('#fullname_agent','#fullname_agent_ch');
      var phone_number_ch = validateInputText('#phone_number','#phone_number_ch');
      var phone_number_agent_ch = validateInputText('#phone_number_agent','#phone_number_agent_ch');
      var phone_number_agent1_ch = validateInputText('#phone_number_agent1','#phone_number_agent1_ch');
      var address_agent_ch = validateInputText('#address_agent','#address_agent_ch');
      var birthdate_agent_ch = validateInputText('#birthdate_agent','#birthdate_agent_ch');
      var identity_no_agent_ch = validateInputText('#identity_no_agent','#identity_no_agent_ch');
    
      if(!company_name_ch){
          return false;

      }else if(!legal_name_ch){
          return false;

      }else if(!address_ch){
          return false;

      }else if(!company_phone_ch){
          return false;

      }else if(!company_fax_number_ch){
          return false;

      }else if(!company_bank_name_ch){
          return false;

      }else if(!account_number_ch){
          return false;

      }else if(!account_name_ch){
          return false;

      }else if(!validateEmail($('#email_agent').val())){
          $("#email_agent_ch").text('Format Email Salah');
          $("#email_agent_ch").css("color", "red")
          return false;

      }else if(!validateEmail($('#email_office').val())){
          $("#email_office_ch").text('Format Email Salah');
          $("#email_office_ch").css("color", "red")
          return false;

      }else if(!password_agent_ch){
          return false;

      }else if(!phone_number_ch){
          return false;

      }else if(!phone_number_agent1_ch){
          return false;

      }else if(!address_agent_ch){
          return false;

      }else if(!birthdate_agent_ch){
          return false;

      }else if(!identity_no_agent_ch){
          return false;

      }else if(!pks_file_ch){
        return false;
      }else{
          return true; 
      }
  }

  field_check();
  setInterval(field_check, 1000);
  window.XMLHttpRequest = newXHR;
});
</script>