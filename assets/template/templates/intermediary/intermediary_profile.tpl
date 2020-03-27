
                                <div class="person-information">
                                     <div class="search-content">
                                      <form class="booking-form" id="form_intermediary" enctype="multipart/form-data" >
                                             <h5 class="title">Data Perusahaan</h5>
                                             <div class="row">
                                                <div class="col-md-6">
                                                   <input type="hidden" class="input-text full-width departure_id" id="intermediary_id" name="intermediary_id" value="{$data.intermediary_id}" />
                                                   <input type="hidden" class="input-text full-width departure_id" id="user_id" name="user_id" value="{$data.user_id}" />
                                                   <label>Nama Perusahaan</label>
                                                   <input type="text" class="input-text full-width departure_id" id="name_intermadiary" name="name_intermadiary" value="{$data.intermediary_name}" disabled/>
                                                </div>
                                                <div class="col-md-6">
                                                   <label>Nama Legal</label>
                                                    <input type="text" class="input-text full-width destination_id" id="legal_name" name="legal_name" value="{$data.intermediary_legal_name}"disabled/>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-12">
                                                   <label>Alamat</label>
                                                   <textarea style="width: 100%;" id="intermediary_address"  name="intermediary_address" value="" disabled>{$data.intermediary_address}</textarea>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-6">
                                                   <label>No Telepon</label>
                                                   <input type="text" class="input-text full-width departure_id" id="intermediary_phone" name="intermediary_phone" value="{$data.intermediary_phone}"disabled/>
                                                </div>
                                                <div class="col-md-6">
                                                   <label>Nomor Fax</label>
                                                    <input type="text" class="input-text full-width destination_id" name="intermediary_fax" id="intermediary_fax" value="{$data.intermediary_fax}"disabled/>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-6">
                                                   <label>Website</label>
                                                   <input type="text" class="input-text full-width departure_id" id="intermediary_web" name="intermediary_web" value="{$data.intermediary_web}"disabled/>
                                                </div>
                                                <div class="col-md-6">
                                                   <label>Alamat Email</label>
                                                    <input type="text" class="input-text full-width destination_id" name="intermediary_email" id="intermediary_email" value="{$data.intermediary_email}"disabled/>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-12">
                                                   <label>Nama Bank</label>
                                                   <input type="text" class="input-text full-width departure_id " id="intermediary_bankname" name="intermediary_bankname" value="{$data.intermediary_bankname}"disabled/>
                                                </div>
                                             </div>
                                              <div class="row">
                                                <div class="col-md-12">
                                                   <label>Nomor Akun Bank</label>
                                                   <input type="text" class="input-text full-width departure_id" id="intermediary_accountnumber" name="intermediary_accountnumber" value="{$data.intermediary_accountnumber}"disabled/>
                                                </div>
                                             </div>
                                              <div class="row">
                                                <div class="col-md-12">
                                                   <label>Nama Pemegang Akun</label>
                                                   <input type="text" class="input-text full-width departure_id" id="intermediary_accountname" name="intermediary_accountname" value="{$data.intermediary_accountname}"disabled/>
                                                </div>
                                             </div>
                                             <div class="form-group row" id="intermediary_mou_file_donwload">
                                                <div class="col-md-12 col-md-12">
                                                  <label>Dokumen PKS</label>
                                                  <a href="{$download_link}/upload/{$data.intermediary_mou_file}" target="_blank">{$data.intermediary_mou_file}</a>
                                                  <button class="btn-mini red" id="bntchangefile"/>ganti file
                                                </div>
                                             </div>  
                                              <div class="row" id="intermediary_mou_file_uplaod">
                                                <div class="col-md-6">
                                                   <label>Dokumen PKS</label>
                                                   <input type="file" class="input-text full-width departure_id" name="intermediary_mou_file" id="intermediary_mou_file" value="{$data.intermediary_mou_file}"disabled/>
                                               <!--  </div>
                                                <div class="col-md-6"> -->   
                                                   <button class="btn-mini red" id="bntcancelchangefile"/>Batal
                                                </div>
                                             </div>
                                             <div class="form-group row">
                                                <div class="col-sm-4 col-md-4">
                                                    <button type="submit" class="btn-small red" id="cancel_edit_intermediary">Batal</button>
                                                    <button type="submit" class="btn-small orange" id="edit_intermediary">Ubah Data</button>
                                                    <button type="submit" class="btn-small" id="save_intermediary">Simpan</button>
                                                </div>
                                             </div>
                                      </form>
                                      <form class="booking-form" id="form_agent_intermediary" >
                                             <hr>
                                             <h5 class="title">Informasi Agen</h5>
                                             <!-- <label>Mulai</label> -->
                                             <div class="row">
                                                <div class="col-md-6">
                                                  <input type="hidden" class="input-text full-width departure_id" id="intermediary_id" name="intermediary_id" value="{$data.intermediary_id}" />
                                                  <input type="hidden" class="input-text full-width departure_id" id="user_id" name="user_id" value="{$data.user_id}" />
                                                   <label>Email</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->

                                                      <input type="text"  class="input-text full-width" name="intermediary_agent_email" id="intermediary_agent_email" value="{$data.intermediary_agent_email}" disabled/>
                                                   <!-- </div> -->
                                                </div>
                                                <div class="col-md-6">
                                                   <label>Kata Kunci</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="password"  class="input-text full-width" name="intermediary_agent_password" id="intermediary_agent_password" value="{$data.password}"disabled/>
                                                   <!-- </div> -->
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-12">
                                                   <label>Nama Lengkap</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="text"  class="input-text full-width" name="intermediary_agent_name" id="intermediary_agent_name" value="{$data.intermediary_agent_name}"disabled/>
                                                   <!-- </div> -->
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-6">
                                                   <label>No Handphone</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="text" class="input-text full-width"  name="intermediary_agent_handphone" id="intermediary_agent_handphone" value="{$data.intermediary_agent_handphone}"disabled/>
                                                   <!-- </div> -->
                                                </div>
                                                <div class="col-md-6">
                                                   <label>No Telepon</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="text" id="intermediary_agent_telephone" class="input-text full-width" name="intermediary_agent_telephone" value="{$data.intermediary_agent_telephone}"disabled/>
                                                   <!-- </div> -->
                                                </div>
                                             </div>
                                              <div class="row">
                                                <div class="col-md-12">
                                                   <label>Alamat</label>
                                                   <textarea style="width: 100%;" id="intermediary_agent_address" name="intermediary_agent_address" value="{$data.intermediary_agent_address}" disabled>{$data.intermediary_agent_address}</textarea>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-md-6">
                                                   <label>Tanggal Lahir</label>
                                                   <div class="datepicker-wrap-order">
                                                      <input type="text" class="input-text full-width"  id="intermediary_agent_birthdate" name="intermediary_agent_birthdate" value="{$data.intermediary_agent_birthdate}" disabled/>
                                                   </div>
                                                </div>
                                                <div class="col-md-6">
                                                   <label>No KTP</label>
                                                   <!-- <div class="datepicker-wrap-order"> -->
                                                      <input type="text" class="input-text full-width" name="intermediary_agent_noid" id="intermediary_agent_noid" value="{$data.intermediary_agent_noid}" disabled/>
                                                   <!-- </div> -->
                                                </div>
                                             </div>

                                             <div class="form-group row">
                                                <div class="col-sm-4 col-md-4">
                                                    <button type="submit" class="btn-small red" id="cancel_edit_agent">Batal</button>
                                                    <button type="submit" class="btn-small orange" id="edit_agent">Ubah Data</button>
                                                    <button type="submit" class="btn-small" id="save_intermediary_agent">Simpan</button>
                                                </div>
                                             </div>
                                          </div>
                                </div>
                                <hr>
                                
</form>
<script type="text/javascript">
jQuery(document).ready(function($){
//by default
  $("#intermediary_agent_birthdate").datepicker({
    dateFormat: 'dd-mm-yy'
  }); 
  // $("#heirs_birthdate").datepicker();

  $("#cancel_edit_intermediary").hide();
  $("#cancel_edit_intermediary").hide();
  $("#cancel_edit_agent").hide();
  $("#save_intermediary").hide();
  $("#save_intermediary_agent").hide();
  $("#intermediary_mou_file_uplaod").hide();
  $("#bntchangefile").prop('disabled', true);

  $("#bntchangefile").on('click',function(e){
      e.preventDefault();
      $("#intermediary_mou_file_uplaod").show();
      // $("#bntchangefile").off();
      // $("#bntchangefile").hide();
      $("#intermediary_mou_file_donwload").hide();
      
  });

  $("#bntcancelchangefile").on('click',function(e){
    e.preventDefault();
    $("#intermediary_mou_file_uplaod").hide();
    $("#intermediary_mou_file_donwload").show();
  });
  

// edit intermediary
  $("#edit_intermediary").on('click',function(e){
    alert('Click ok untuk melanjutkan');
    console.log('x12x');
    $("#edit_intermediary").hide();
    $("#cancel_edit_intermediary").show();
    $("#save_intermediary").show();
    e.preventDefault();
    // $("#save_intermediary").prop('disabled',false);
    $("#bntchangefile").prop('disabled', false);
    $('#name_intermadiary').prop('disabled', false)
    $('#legal_name').prop('disabled', false)
    $('#intermediary_address').prop('disabled', false)
    $('#intermediary_phone').prop('disabled', false)
    $('#intermediary_fax').prop('disabled', false)
    $('#intermediary_web').prop('disabled', false)
    $('#intermediary_email').prop('disabled', false)
    $('#intermediary_accountnumber').prop('disabled', false)
    $('#intermediary_accountname').prop('disabled', false)
    $('#intermediary_bankname').prop('disabled', false)
    $('#intermediary_mou_file').prop('disabled', false)
   
  });
// batal edit intermediary
  $("#cancel_edit_intermediary").on('click',function(e){

    $("#cancel_edit_intermediary").hide();
    $("#save_intermediary").hide();
    $("#edit_intermediary").show();
    e.preventDefault();
    $('#name_intermadiary').prop('disabled', true)
    $('#legal_name').prop('disabled', true)
    $('#intermediary_address').prop('disabled', true)
    $('#intermediary_phone').prop('disabled', true)
    $('#intermediary_fax').prop('disabled', true)
    $('#intermediary_web').prop('disabled', true)
    $('#intermediary_email').prop('disabled', true)
    $('#intermediary_accountnumber').prop('disabled', true)
    $('#intermediary_accountname').prop('disabled', true)
    $('#intermediary_bankname').prop('disabled', true)
    $('#intermediary_mou_file').prop('disabled', true)
  
  });

  $("#form_intermediary").submit(function(e){
    e.preventDefault();
      $.ajax({
        url:SITE_URL + '/intermediary/update_intermediary_ajax',
        type:"post",
        data:new FormData(this),
        processData:false,
        contentType:false,
        cache:false,
        async:false,
        success: function(data){
          console.log(data)
          var d = jQuery.parseJSON(data);
          alert(d.message);
          if(d.success==true){
            window.location = d.url_direct;
          }else if(d.success==false){
            e.preventDefault();
          }
        },failure:function(data){
            console.log(data)
        }
    });
  });

//edit profile agent
  $("#edit_agent").on('click',function(e){
    alert('Click ok untuk melanjutkan');
    console.log('xxxx');
    $("#edit_agent").hide();
    $("#cancel_edit_agent").show();
    $("#save_intermediary_agent").show();
    e.preventDefault();
    // $("#save_intermediary_agent").prop('disabled',false);
    $('#intermediary_agent_email').prop('disabled', false)
    $('#intermediary_agent_name').prop('disabled', false)
    $('#intermediary_agent_password').prop('disabled', false)
    $('#intermediary_agent_handphone').prop('disabled', false)
    $('#intermediary_agent_telephone').prop('disabled', false)
    $('#intermediary_agent_address').prop('disabled', false)
    $('#intermediary_agent_birthdate').prop('disabled', false)
    $('#intermediary_agent_noid').prop('disabled', false)
  });

//batal edit profile agent   
  $("#cancel_edit_agent").on('click',function(e){

    $("#edit_agent").show();
    $("#cancel_edit_agent").hide();
    $("#save_intermediary_agent").hide();
    
    e.preventDefault();

    $('#intermediary_agent_email').prop('disabled', true)
    $('#intermediary_agent_name').prop('disabled', true)
    $('#intermediary_agent_password').prop('disabled', true)
    $('#intermediary_agent_handphone').prop('disabled', true)
    $('#intermediary_agent_telephone').prop('disabled', true)
    $('#intermediary_agent_address').prop('disabled', true)
    $('#intermediary_agent_birthdate').prop('disabled', true)
    $('#intermediary_agent_noid').prop('disabled', true)
  
  });

  $("#form_agent_intermediary").submit(function(e){
    e.preventDefault();
    var data_form=$("#form_agent_intermediary").serializeArray();
    console.log(data_form);
      $.ajax({
        url:SITE_URL + '/intermediary/update_agent_ajax',
        type:"post",
        data:data_form,
        datatype: 'json',
        cache:false,
        success: function(data1){
          console.log(data1.success)
          var d1 = jQuery.parseJSON(data1);
          alert(d1.message);
          
        },failure:function(data1){
            console.log(data1)
        }
    });
  });
  
});
</script>