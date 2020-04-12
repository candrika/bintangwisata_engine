 <style>
        h1 {
            font-size: 20px;
            color: #111;
        }
        .checkbox-square{
          border-radius: 0 0 0 0;
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



                             <form id ="register_form" action="{$site_url}/register/save" method="post">
                                <div class="row">

                                    <div class="col-sm-12">
                                        <div class="search-box-wrapper style1">
                              <div class="search-box">
                                 <div class="search-tab-content  container-content-shadow" style="">
                                   
                                    <div class="tab-pane fade active in" id="flights-tab">
                                          <input type="hidden" name="form_valid" id="form_valid">
                                          <div class="title-container">
                                             <h2 class="search-title">Daftar</h2>
                                             <p>Masukan data-data yang dibutuhkan melalui form dibawah ini.</p>
                                             <i class="soap-icon-doc-plus"></i>
                                          </div>
                                         <div class="search-content">
<!--                                              <h5 class="title">Profil</h5>
                                             <label>Mulai</label>
 -->
                                             <div class="row">
                                                <div class="col-md-6">
                                                   <label>Nama Depan</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="text" id="firstname" name="firstname" class="input-text full-width" placeholder="Masukkan Nama Depan"/>
                                                      <span id="fullname_ch">
                                                   <!-- </div> -->
                                                </div>
                                                <div class="col-md-6">
                                                   <label>Nama Belakang</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="text" id="fullname" name="lastname" class="input-text full-width" placeholder="Masukkan Nama Belakang"/>
                                                      <span id="fullname_ch">
                                                   <!-- </div> -->
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-6">
                                                   <label>Email</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="text" id="email" class="input-text full-width"name="email" placeholder="Masukkan Email "/>
                                                      <span id="email_ch">
                                                   <!-- </div> -->
                                                </div>
                                                <div class="col-md-6">
                                                   <label>Kata Kunci</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="password" id="password" class="input-text full-width"name="password" placeholder="Masukkan Password "/>
                                                      <span id="password_ch">
                                                   <!-- </div> -->
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-6">
                                                   <label>No Handphone</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="text" id="phone_number" class="input-text full-width" name="phone_number" placeholder="Masukkan No Handphone"/>
                                                      <span id="phone_number_ch">

                                                   <!-- </div> -->
                                                </div>
                                                <div class="col-md-6">
                                                   <label>No Telepon</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="text" id="phone_number1" class="input-text full-width"name="phone_number1"placeholder="Masukkan No Telephone"/>
                                                      <span id="phone_number1_ch">
                                                   <!-- </div> -->
                                                </div>
                                             </div>
                                              <div class="row">
                                                <div class="col-md-12">
                                                   <label>Alamat</label>
                                                   <textarea style="width: 100%;"name="address" id="address" placeholder="Masukkan Alamat"></textarea>
                                                   <span id="address_ch">
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-6">
                                                   <label>Tanggal Lahir</label>
                                                   <div class="datepicker-wrap-order">
                                                      <input type="text" id="birthdate" class="input-text full-width" name="birthdate" placeholder="Masukkan Tanggal Lahir"/>
                                                      <span id="birthdate_ch">
                                                   </div>
                                                </div>
                                                <div class="col-md-6">
                                                   <label>No KTP/KITAS/PASSPORT</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="text" id="identity_no" class="input-text full-width"name="identity_no" placeholder="Masukkan No KTP/KITAS/PASSPORT"/>
                                                      <span id="identity_no_ch">
                                                   <!-- </div> -->
                                                </div>
                                             </div>
                                             <div class="row">
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
                                                <div class="col-md-6">
                                                   <label>Pemegang Polis?</label>
                                                    <!-- <div class="checkbox"> -->
                                                      <label>
                                                        <input type="checkbox" name="policy_holder" value="1" checked="checked" class="checkbox checkbox-inline checkbox-square"> Ya
                                                      </label>
                                                    <!-- </div> -->
                                                </div>
                                             </div>
                                             <br>
                                                   <button id="btn_submit_register" class="button btn-large sky-blue1" style="width:100%;" id="btn_register">Daftar
                                          </div>
                                       
                                    </div>
                                 </div>
                              </div>
                           </div>
                                    </div>

                                </div></form>
                            
                        </div>

<script type="text/javascript">
var logged = '{$logged}';
console.log(logged);
console.log('nam');
function myFunction() {
    // Get the snackbar DIV
    var x = document.getElementById("snackbar")

    // Add the "show" class to DIV
    x.className = "show";

    // After 3 seconds, remove the show class from DIV
    // setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}

jQuery(document).ready(function($){
  $("#birthdate").datepicker({
      dateFormat: 'dd-mm-yy'
  });
  
  $("#heirs_birthdate").datepicker({
      dateFormat: 'dd-mm-yy'
  });
  
  $('#register_form').on('keyup keypress', function(e) {
        var keyCode = e.keyCode || e.which;
        console.log(keyCode);
        if (keyCode === 13) {
            e.preventDefault();
            return false;
        }
  });

  $('form').submit(function(e) {
      e.preventDefault();  
      // alert('submit')

      var x = document.getElementById("snackbar");
      x.className = "show";

      if(field_check()){
          x.className = "show";
          tjq.ajax({
              type: 'GET',
              async: false,
              url: SITE_URL + '/register/email_checking',
              data: {
                  email: $('#email').val(),
                  logged:logged
              },
              dataType: 'json',
              success: function(data) {
                if (data.success) {
                      var url = $('form').attr("action");
                      var form_input = $('form').serializeArray();
                      $.ajax({
                        type: 'POST',
                        cache: false,
                        url: $('form').attr("action"),
                        data: form_input,
                        datatype: 'json',
                        success: function(data) {
                          var obj = jQuery.parseJSON(data);
                          console.log(obj)
                          if (obj.success) {
                              alert(obj.message);
                              window.location = obj.url_direct;
                          } else {
                              x.className = x.className.replace("show", "");
                          }
                        }
                    });        
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
  });

  function field_check(){

      var fullname_ch = validateInputText('#fullname', '#fullname_ch');
      var address_ch = validateInputText('#address', '#address_ch');
      var identity_no_ch = validateInputText('#identity_no', '#identity_no_ch');
      var heirs_identity_no_ch = validateInputText('#heirs_identity_no', '#heirs_identity_no_ch');
      var phone_number_ch = validateInputText('#phone_number', '#phone_number_ch');
      // var phone_number1_ch = validateInputText('#phone_number1', '#phone_number1_ch');
      var birthdate_ch = validateInputText('#birthdate', '#birthdate_ch');
      var heirs_name_ch = validateInputText('#heirs_name', '#heirs_name_ch');
      var heirs_phone_ch = validateInputText('#heirs_phone', '#heirs_phone_ch');
      // var heirs_phone_ch = validateInputText('#heirs_phone', '#heirs_phone_ch');
      var heirs_birthdate_ch = validateInputText('#heirs_birthdate', '#heirs_birthdate_ch');
      var email_reg_ch = validateInputText('#email', '#email_ch');
      var password_ch = validateInputText('#password', '#password_ch');

      if(!fullname_ch){
          $('#form_valid').val('false');
          return false;
      }

      else if (!identity_no_ch) {
          $('#form_valid').val('false');
          return false;
      }
      else if (!validateEmail($('#email').val())) {
            // console.log('Format Email Salah');
          $('#form_valid').val('false');
          $("#email_ch").text('Format Email Salah');
          $("#email_ch").css("color", "red");
          return false;
      }
      else if(!address_ch){
          $('#form_valid').val('false');
          return false;
      }
      else if(!heirs_identity_no_ch){
          $('#form_valid').val('false');
          return false;
      }
      else if(!phone_number_ch){
          $('#form_valid').val('false');
          return false;
      }
      else if(!birthdate_ch){
          $('#form_valid').val('false');
          return false;
      }
      else if(!heirs_name_ch){
          $('#form_valid').val('false');
          return false;
      }
      else if(!heirs_birthdate_ch){
          $('#form_valid').val('false');
          return false;
      }
      else if(!heirs_phone_ch){
          $('#form_valid').val('false');
          return false;
      }else{
         if($('#form_valid').val()!='submit'){
            //    alert($('#form_valid').val())
               // $('#btn_submit_order').show();
               $('#form_valid').val('true');

          } else {

          }

        return true;
      } 
  }    
  

  field_check();
  setInterval(field_check, 1000);
  window.XMLHttpRequest = newXHR;

});   
</script>