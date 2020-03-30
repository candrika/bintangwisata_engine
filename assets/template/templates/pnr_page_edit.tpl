
            <section id="content" style="background: #fff;">
                <div class="container">
                     <div class="row">
                        <div id="main" class="col-sm-8 col-md-12">
                           <div class="booking-section travelo-box">
                              <form id="order_form" class="cruise-booking-form" action="{$site_url}/order/proceed" method="POST">
                                <input type="hidden" name="insured_id" id="insured_id" value="{$data.insured_id}" >
                                <input type="hidden" name="user_id" id="user_id" value="{$data.user_id}">
                                <input type="hidden" name="price_gold_field" id="price_gold_field">
                                <input type="hidden" name="price_platinum_field" id="price_platinum_field">
                                <input type="hidden" name="price_diamond_field" id="price_diamond_field">
                                <input type="hidden" name="premium_id" id="premium_id" value="{$data.premium_id}">
                                <input type="hidden" name="total_perluasan" id="total_perluasan_field" value="{$data.total_perluasan}">
                                <input type="hidden" name="total_ex_premi" id="total_ex_premi_field" value="{$data.premium_id}">
                                <input type="hidden" name="total_premi" id="total_premi_field" value="{$data.total_premi}">
                                <input type="hidden" name="other_fee" id="other_fee_field" value="{$data.other_fee}">
                                <input type="hidden" name="total_amount" id="total_amount_field" value="{$data.premium_id}">

                                <h1>Pembelian Asuransi Perjalanan</h1>
                              

                                    <div class="person-information" id="form_pendaftaran">
                                    <!-- <hr> -->
                                    <h2><i class="soap-icon-doc-plus" style="color: #01b7f2;"></i> Penanggung Polis</h2>
                                  <!--   <div class="form-group">
                                       <label>
                                       <a id="show_login_form"><span class="skin-color">Sudah memiliki akun?</span></a>.
                                       </label>
                                    </div> -->
                                    <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>first name</label>
                                          <input type="text" class="input-text full-width" name="firstname" value="{$data.firstname}" readOnly>
                                       </div>
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>last name</label>
                                          <input type="text" class="input-text full-width" name="lastname" value="{$data.lastname}" readOnly>
                                       </div>
                                    </div>
                                    <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>email address</label>
                                          <input type="text" class="input-text full-width" name="email_reg" value="{$data.email}" readOnly>
                                       </div>
                                        <div class="form-group col-sm-6 col-md-5">
                                          <label>No KTP/KITAS/Passport</label>
                                          <input type="text" class="input-text full-width" id="identity_no" name="identity_no" value="{$data.identity_no}">
                                          <span id="identity_no_ch">
                                       </div>
                                    </div>
                                    <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>Phone number</label>
                                          <input type="text" class="input-text full-width" name="phone_number" value="{$data.phone_number}" readOnly>
                                       </div>
                                       <div class="form-group col-sm-6 col-md-5">
                                          <div class="row">
                                             <div class="col-xs-6">
                                                <label>Date of Birth</label>
                                                <div class="datepicker-wrap">
                                                <input type="text" id="datebirth_reg" placeholder="dd-mm-yy" class="input-text full-width" name="datebirth" placeholder="select date" value="{$data.birthdate}"/>
                                             </div>
                                             </div>
                                             <div class="col-xs-6">
                                                <label>Gender {$data.gender}</label>
                                                <div>
                                                   <label class="radio radio-inline radio-square">
                                                   <input type="radio" name="gender_reg" {if $data.gender eq 'Pria' } checked="checked" {/if} disabled>Male
                                                   </label>
                                                   <label class="radio radio-inline radio-square" >
                                                   <input disabled type="radio" name="gender_reg" {if $data.gender eq 'Wanita' } checked="checked" {/if}>Female
                                                   </label>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                   <!--  <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>Country code</label>
                                          <div class="selector">
                                             <select class="full-width" name="country_code" disabled="true">
                                                <option value="1">Indonesia (+62)</option>
                                             </select>
                                          </div>
                                       </div>
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>Phone number</label>
                                          <input type="text" class="input-text full-width" name="phone_number" value="{$data.phone_number}" readOnly>
                                       </div>
                                    </div> -->
                                    <div class="row">
                                       <div class="form-group col-sm-6 col-md-5">
                                          <label>Home Address</label>
                                          <input type="text" class="input-text full-width" name="address" value="{$data.address}" readOnly>
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
                                             <div class="col-xs-6">
                                                <label>City</label>
                                                <input type="text" class="input-text full-width" name="city" value="{$data.city}" readOnly>
                                             </div>
                                             <div class="col-xs-6">
                                                <label>Zipcode</label>
                                                <input type="text" class="input-text full-width" name="zipcode" value="{$data.zipcode}" readOnly>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                   <!--  <div class="form-group">
                                       <div class="checkbox">
                                          <label>
                                          <input type="checkbox" name="cb_promo" value="1"> I want to receive <span class="skin-color">Jasindo Travel</span> promotional offers in the future
                                          </label>
                                       </div>
                                    </div> -->
                                 </div>

                                 <div class="card-information">
                                   <hr>
                                    <h2><i class="soap-icon-bag" style="color: #01b7f2;"></i> Data Pemesanan</h2>
                                    <h5 class="title">Destinasi</h5>
                                    <div class="row">
                                       <div class="col-xs-6">
                                          <label>Dari</label>
                                           <input type="text" class="input-text full-width departure_id" placeholder="Ketikkan kota keberangkatan" id="cb_depart" name="departure_id" value="{$departure_id}"/>
                                          <!--- <input type="text" class="input-text full-width" placeholder="enter your location" />-->
                                       </div>
                                       <div class="col-xs-6">
                                          <label>Tujuan</label>
                                          <input type="text" class="input-text full-width destination_id" placeholder="Ketikkan kota tujuan" id="cb_dest" name="destination_id" value="{$destination_id}"/>
                                       </div>
                                    </div>
                                    <br>
                                    <h5 class="title">Periode</h5>
                                    <!-- <label>Mulai</label> -->
                                    <div class="row">
                                       <div class="col-xs-6">
                                          <label>Mulai</label>
                                          <div class="datepicker-wrap">
                                             <input type="text" id="startdate" class="input-text full-width" placeholder="select date" name="startdate" value="{$startdate}"/>
                                          </div>
                                       </div>
                                       <div class="col-xs-6">
                                          <label>Sampai</label>
                                          <div class="datepicker-wrap">
                                             <input type="text" id="enddate" class="input-text full-width" placeholder="select date" name="enddate" value="{$enddate}" />
                                          </div>
                                       </div>
                                    </div>
                                    <br>
                                    <!-- <h5 class="title">Periode</h5> -->
                                    <!-- <label>Mulai</label> -->
                                    <div class="row">
                                       <div class="col-xs-6">
                                          <label>Jumlah Orang</label>
                                          <div class="selector">
                                             {$cb_participant}
                                          </div>
                                       </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                       <div class="col-xs-6">
                                          <h5 class="title">Paket Yang Dipilih: <span id="name_region"></span></h5>
                                       </div>
                                    </div>
                                    <div class="block" id="package_domestic"  {if $data.region_name eq 'Domestik' } style="display:block;" {else} style="display:none;" {/if}>
                                       <div class="row image-box style3">
                                          <div class="col-sm-6 col-md-4">
                                             <article class="box">
                                                <div class="details text-center">                
                                                   <br>
                                                   <label>Paket Domestik</label>
                                                   <div class="radio" style="width:20px; margin:0 auto;">
                                                      <input type="radio" name="pilih_paket" value="4" checked="checked">                                                      
                                                   </div>
                                                    <h4 class="box-title" style="margin-top:5px;">{$data.total_premi}</h4>
                                                </div>
                                             </article>
                                          </div>
                                       </div>
                                    </div>

                                    <div class="block" id="package_international" {if $data.region_name neq 'Domestik' } style="display:block;" {else} style="display:none;" {/if}>
                                       <div class="row image-box style3">
                                          <div class="col-sm-6 col-md-4">
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
                                                      <input type="radio" name="pilih_paket" {$rb_gold} value="1">                                                      
                                                   </div>
                                                    <h4 class="box-title" style="margin-top:5px;"><span id="price_gold"></h4>
                                                </div>
                                             </article>
                                          </div>
                                          <div class="col-sm-6 col-md-4">
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
                                                      <input type="radio" name="pilih_paket" {$rb_platinum} value="2"> 
                                                   </div>
                                                   <h4 class="box-title" style="margin-top:5px;"><span id="price_platinum"></h4>
                                                </div>
                                             </article>
                                          </div>
                                          <div class="col-sm-6 col-md-4">
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
                                                    <h4 class="box-title" style="margin-top:5px;"><span id="price_diamond"></h4>
                                                </div>
                                             </article>
                                          </div>
                                       </div>
                                    </div>

                                     <hr>
                                    <h2><i class="soap-icon-bag" style="color: #01b7f2;"></i> Pilih Perluasan</h2>
                                    <div class="row block">
                    <div class="col-sm-4">
                        <div class="pricing-table white box">
                            <div class="header clearfix">
                                <i class="soap-icon-user circle green-color"></i>
                                <h4 class="box-title"><span style="font-size:12px;">Kegiatan Ekstrim</span></h4>
                                <span class="price" style="font-size:10px;">Rp 95.000</span>
                            </div>
                            <p class="description" style="height: 60px;">
                                Cacat Tetap atau Meninggal Dunia Akibat Kecelakaan. Kegiatan Menyelam, Kegiatan Arung Jeram, Kegiatan Paralayang
                            </p>
                            <center><label><input type="checkbox" name="extension" value="1" {$cb_ext_a} disabled> </label></center>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="pricing-table white box">
                            <div class="header clearfix">
                                <i class="soap-icon-friends circle yellow-color"></i>
                                <h4 class="box-title"><span style="font-size:12px;">Kehilangan Barang Teknologi</span></h4>
                                <span class="price" style="font-size:10px;">Rp 100.000</span>
                            </div>
                            <p class="description" style="height: 60px;">
                               Kamera (Tidak Termasuk Lensa) atau Telepon Selular.
                            </p>
                             <center><label><input type="checkbox" name="extension" value="2" {$cb_ext_b} disabled> </label></center>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="pricing-table white box">
                            <div class="header clearfix">
                                <i class="soap-icon-suitcase circle blue-color"></i>
                                <h4 class="box-title"><span style="font-size:12px;"> Perlindungan Rumah</span></h4>
                                <span class="price" style="font-size:10px;">Rp 7.500</span>
                            </div>
                            <p class="description" style="height: 60px;">
                                Perlindungan Rumah Atas Risiko Kebakaran.
                            </p>
                             <center><label><input type="checkbox" name="extension" value="3" {$cb_ext_c} disabled> </label></center>
                        </div>
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
                                       
                                       {foreach $data_member as $v}

                                          <div class="row" id="form_participant">
                                             <div class="form-group col-sm-6 col-md-3">
                                                <label>Nama Lengkap</label>
                                                {$v.fullname}
                                             </div>
                                             <div class="form-group col-sm-6 col-md-2">
                                                <label>Hubungan</label>
                                                <div class="selector">
                                                   {$v.relationship}
                                                </div>
                                             </div>
                                             <div class="form-group col-sm-6 col-md-2">
                                                <label>Gender</label>
                                                <div class="selector">
                                                    {$v.gender}
                                                </div>
                                             </div>
                                             <div class="form-group col-sm-6 col-md-2">
                                                <label>Tanggal lahir</label>
                                                <div class="">
                                                   {$v.datebirth}
                                                </div>
                                             </div>
                                             <div class="form-group col-sm-6 col-md-3">
                                                <label>NO Passport</label>
                                                {$v.no_identity}
                                             </div>
                                          </div>
                                       {/foreach}


                                      
                                         <div id="list_participant" style="display:none;"></div>

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
                                                         <span>{$startdate}</span>
                                                      </div>
                                                      <div class="duration text-center">
                                                         <i class="soap-icon-clock"></i>
                                                         <span id="days"><</span>
                                                      </div>
                                                      <div class="check-out">
                                                         <label>Akhir</label>
                                                         <span>{$enddate}</span>
                                                      </div>
                                                   </div>
                                                </div>
                                             </article>
                                             <!-- <h4>Detil</h4> -->
                                             <dl class="other-details">
                                                <dt class="feature">Premi Perluasan:</dt>
                                                <dd class="value">Rp {$data.total_perluasan|number_format:2:".":","}</dd>
                                                <dt class="feature">Premi:</dt>
                                                <dd class="value">Rp {$data.total_premi|number_format:2:".":","}</dd>

                                                  <dt class="feature" id="extra_premi_summary">Ekstra Premi: <br>
                                                    <font style="font-size:9px; color:#c0c0c0;">Umur melebihi > {$settings.min_age_extra_premi} dikenakan premi tambahan sebesar {$settings.percent_extra_premi} %</font>
                                                  </dt>
                                                  <dd class="value" id="extra_premi_summary_value">Rp {$data.total_ex_premi|number_format:2:".":","}</dd>

                                                <dt class="feature">Biaya Polis dan Materai:</dt>
                                                <dd class="value">Rp {$data.other_fee|number_format:2:".":","}</dd>
                                                <dt class="total-price">Total Pembayaran</dt>
                                                <dd class="total-price-value">Rp {$data.total_amount|number_format:2:".":","}</dd>
                                             </dl>
                                          </div>
                                       </div>
                                       <div class="form-group col-sm-6 col-md-6" style="margin-top:10%;">
                                          <!-- <label>Card holder name</label> -->
                                          <!-- <div class="form-group col-sm-6 col-md-5"> -->
                                             <!-- <h2>Ringkasan Pembayaran</h2> -->
                                            <!--  <div class="checkbox">
                                                <label>
                                                <input type="checkbox"> By continuing, you agree to the <a href="#"><span class="skin-color">Terms and Conditions</span></a>.
                                                </label>
                                             </div> -->
                                          <!-- </div> -->
                                          <!-- <div class="form-group row"> -->
                                             <!-- <div class="col-sm-6 col-md-7">
                                                 <span id="message_order_button" style="color:red;"></span>
                                                 <button id="btn_submit_order" class="button btn-large sky-blue1">LANJUT KE PEMBAYARAN</button>  -->
                                               <!--  <button type="submit" class="full-width btn-large">&nbsp;Lanjut Ke Pembayaran&nbsp;</button> -->
                                             <!-- </div> -->
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


               jQuery(document).ready(function($) {
                   $('form').submit(function(e) {
                       // e.preventDefault();
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
                        $('#btnSubmitLogin').hide();
                        $('#loadingLogin').show();
                        $('#loadingLogin').html('Loading...');
                        $.ajax({ 
                              type: 'POST', 
                              url: '{$site_url}/login/check', 
                              data: { 
                                email: $('#email_login').val(),
                                password: $('#pass_login').val(),
                                mode:'ajax'
                              }, 
                              dataType: 'json',
                              success: function (data) { 
                                console.log(data);
                                if(data.success){
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
                   });
               
                   $("#cb_depart").change(function() {
                       set_package();
                   });
               
                   $("#cb_dest").change(function() {
                       set_package();
                   });
               
                   $("#startdate").change(function() {
                       set_package();
                   });
               
                   $("#enddate").change(function() {
                        set_package();
                   });

                   $("#datebirth_reg").change(function() {
                        set_package();
                   });

                   

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
                        set_participant(this.value)                       
                   });
               
                   $("#cb_family").change(function() {
                        set_package();
                   });

                    $('input[type=radio][name=pilih_paket]').change(function() {
                        // set_total(this.value)
                        set_package();
                    });

                    $('input[type=checkbox][name=extension]').change(function() {
                        // set_total(this.value)
                        set_package();
                    });

                    function set_participant(num){
                        set_package();
                        // console.log('num:'+this.value);
                        var num = num*1;

                        if(num==1){
                            $('#other_participant').hide();
                        } else {
                            $('#other_participant').show();
                        }
                        // var p_el = $('#form_participant').clone();
                         var button = '';
                          // var e = $('#form_participant_element');
                          // var container = $('#form_participant').clone();
                        for(i=1;i<num;i++){
                            // $("#form_participant_element").css("display", "block");
                             $('#form_participant').clone().appendTo('#list_participant');
                           // $('#list_participant').append(container);
                            // e.clone().insertAfter('#list_participant');
                           // button += container;
                            // $('#list_participant').append(el_part);
                            // $("#form_participant_element").append( "#form_participant" );
                        }
                        // console.log(button)
                         // $('#list_participant').html(button);
                    }

                   function set_total(pilih){
                        console.log('set_total');
                       //  if(pilih=='1'){
                       //      $("#total_amount").html($("#price_gold_field").val());
                       // } else if(pilih=='2'){
                       //      $("#total_amount").html($("#price_platinum_field").val());
                       // } else if(pilih=='3'){
                       //      $("#total_amount").html($("#price_diamond_field").val());
                       // }
                   }
               
                   function set_package(){
                       // $("#notif_searchbox").hide(200);
                       // $("#package_chooser").hide(200);
               
                       console.log($('#cb_depart').val());
                       if($('#cb_depart').val()=='0'){
                            $("#notif_searchbox").show(200);
                           $('#search_msg').html("Pilih Keberangkatan");
                       } else if($('#cb_dest').val()=='0'){
                           $("#notif_searchbox").show(200);
                           $('#search_msg').html("Pilih Tujuan");
                       } else if($('#startdate').val()==''){
                           $("#notif_searchbox").show(200);
                           $('#search_msg').html("Pilih Tanggal Mulai");
                       }  else if($('#enddate').val()==''){
                           $("#notif_searchbox").show(200);
                           $('#search_msg').html("Pilih Tanggal Akhir");
                       }  else {
                            var favorite = [];
                            $.each($("input[name='extension']:checked"), function(){            
                                favorite.push($(this).val());
                            });
                            // alert("My favourite sports are: " + favorite.join(","));
                          $('#message_order_button').html(null);

                          $.ajax({ 
                              type: 'GET', 
                              url: '{$site_url}/product/get_package_price', 
                              data: { 
                                startdate: $('#startdate').val(),
                                enddate: $('#enddate').val(),
                                destination_id: $('#cb_dest').val(),
                                type:'single',
                                num_person:$('#num_participant').val(),
                                selected:$("input[name='pilih_paket']:checked").val(),
                                datebirth_reg:$('#datebirth_reg').val(),
                                extension:favorite
                              }, 
                              dataType: 'json',
                              success: function (data) { 
                                // alert(data.message)
                                if(!data.success){
                                  $('#message_order_button').html(data.message);
                                  $('#btn_submit_order').hide();
                                  return false;
                                }

                                $('#btn_submit_order').show();

                                console.log(data);
                                $('#price_gold').html('Rp. '+data.gold);
                                $('#price_gold_field').val(data.gold);
                                $('#price_platinum').html('Rp. '+data.platinum);
                                $('#price_platinum_field').val(data.platinum);
                                $('#price_diamond').html('Rp. '+data.diamond);
                                $('#price_diamond_field').val(data.diamond);

                                $('#premium_id').val(data.premium_id);
                                $('#days').html(data.days+' Hari');
                                $('#total_perluasan').html(data.total_perluasan);
                                $('#total_premi').html(data.total_premi);
                                $('#total_ex_premi').html(data.total_extra_premi);
                                $('#other_fee').html(data.other_fee);
                                $('#total_amount').html(data.total_amount);

                                $('#total_perluasan_field').val(data.total_perluasan);
                                // alert(data.total_extra_premi)
                                if(data.total_extra_premi*1!=0){   
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
                                
                                // $("#package_chooser").show(1000);
                                  // var selected_package = '{$selected_package}';

                                  // set_total( $("input[name='pilih_paket']:checked"). val());
                              }
                          });
                          
                       }
                       
                   }

                $('input.departure_id').typeahead({
                  name: 'departure_id',
                  remote: '{$site_url}/backend/get_departure?query=%QUERY'
                });

                $('input.destination_id').typeahead({
                  name: 'destination_id',
                  remote: '{$site_url}/backend/get_destination?query=%QUERY'
                });

                $("#orderBtn").click(function() {
                  window.location = '{$site_url}/order/page?startdate='+$('#startdate').val()+'&enddate='+$('#enddate').val()+'&departure_id='+$('#cb_depart').val()+'&destination_id='+$('#cb_dest').val()+'&type=single&num_person='+$('#num_participant').val()+'&selected_package='+$("#orderBtn").val();
                });


              $("#add_participant_form").click(function(){
                  $('#form_participant').clone().appendTo('#list_participant');
              });

              
            set_package();
            set_participant($("#num_participant").val());

            var logged = '{$logged}';
            if(logged*1==1){
                $('#row_info_success_login').show();
                $('#show_reg_form').hide();
                $('#insured_id').val('{$insured_id}');
                $('#user_id').val('{$user_id}');
            } else {
                $('#row_info_success_login').hide();
                 $('#show_reg_form').show();
                $('#insured_id').val(null);
                $('#user_id').val(null);
            }

            var num_days = '{$num_days}';
            if(num_days!==''){
              $('#days').html(num_days+' Hari');
            }

            var total_data_member = '{$total_data_member}';
            if(total_data_member*1>0){
              $('#other_participant').show();
            } else {
              $('#other_participant').hide();
            }
    });
               
               
            </script>