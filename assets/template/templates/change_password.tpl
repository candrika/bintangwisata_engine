<section id="content"  style="background-color:#FFF;">
            <div class="container">
            	<center><h2> <i class="soap-icon-settings circle"></i> Ubah Password</h2></center>
			<div class="col-sm-10 col-md-8 col-lg-6 no-float no-padding center-block block">
			    <form class="login-form">
			        <div class="form-group input-password">
			            <label>Masukkan Password Saat Ini</label>
			            <input type="password" class="input-text input-large full-width" id="password_old" name="password_old">
			        </div>
			        <div class="form-group input-password">
			            <label>Password baru</label>
			            <input type="password" class="input-text input-large full-width" id="password_new" name="password_new">
			        </div>
			        <div class="form-group input-password">
			            <label>Ulangi Password baru</label>
			            <input type="password" class="input-text input-large full-width" id="password_new_ver" name="password_new_ver">
			        </div>
			        <button id="btnChangePass" class="btn-large full-width yellow">
			            Simpan
			            <i class="soap-icon-check circle"></i>
			        </button>
			        <br>
			        
			    </form>

			</div> 
			<center><h3><span id="msg"></h3></center>
			</div>
</section>
<p>&nbsp;</p>

<script type="text/javascript">
 jQuery(document).ready(function($) {
       $('form').submit(function(e) {
           e.preventDefault();
       });

        $("#btnChangePass").click(function() {


         $("#msg").html('Loading...');      
         // $("#form_login").show(1000);    

         	if($('#password_new').val()!=$('#password_new_ver').val()){
         		$("#msg").html('<font color=red>Password baru tidak sama</font>'); 
         	} else {
         		$.ajax({ 
	                  type: 'POST', 
	                  url: '{$site_url}/user_panel/save_password', 
	                  data: { 
	                  	password_old: $('#password_old').val(),
	                    password_new: $('#password_new').val()
	                  }, 
	                  dataType: 'json',
	                  success: function (data) { 
	                    $("#msg").html(data.message); 
	                  }
	             });  
         	}

         	              
       });

  });
</script>