

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



                             <!-- <form class="login-form" action="{$site_url}/login/check" method="post"> -->
                                <div class="row">

                                    <div class="col-sm-12">
                                        <div class="search-box-wrapper style1">
                              <div class="search-box">
                                 <div class="search-tab-content" style="">
                                   
                                    <div class="tab-pane fade active in" id="flights-tab">
                                       
                                          <div class="title-container">
                                             <h2 class="search-title">Buat Kata Kunci Baru</h2>
                                             <!-- <p>Ensure Your Travel.</p> -->
                                             <i class="soap-icon-plane-right takeoff-effect"></i>
                                          </div>
                                          <div class="search-content">
                                                
                                                <form class="login-form" action="{$site_url}/login/request_new_pass" method="post">
                                                        <div class="form-group input-login">
                                                            <label>Masukkan Alamat Email Anda</label>
                                                            <input type="text" name="email" class="input-text input-large full-width" >
                                                        </div>
                                                        {if $message neq null}
                                                        <div class="alert alert-notice">
                                                           {$message}
                                                        </div>
                                                        {/if}
                                                        <button type="submit" class="btn-large full-width yellow">
                                                            Buat Kata Kunci Baru
                                                            <i class="soap-icon-check circle"></i>
                                                        </button>
                                                    </form>
                                          </div>
                                       
                                    </div>
                                 </div>
                              </div>
                           </div>
                                    </div>

                                </div>
                            <!-- </form> -->
                            
                        </div>