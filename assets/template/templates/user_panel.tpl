<section id="content" class="gray-area" style="margin-top:1%;">
            <div class="container">
                <div id="main">
                    <div class="tab-container full-width-style arrow-left dashboard">
                        <ul class="tabs">
                           <!--  <li class="active"><a data-toggle="tab" href="#dashboard"><i class="soap-icon-anchor circle"></i>Dashboard</a></li> -->
                            <li class="active"><a data-toggle="tab" href="#profile"><i class="soap-icon-user circle"></i>Profil</a></li>
                            <li class=""><a data-toggle="tab" href="#booking"><i class="soap-icon-shopping circle"></i>Pembelian</a></li>
                            <li class=""><a data-toggle="tab" href="#klaim"><i class="soap-icon-insurance circle"></i>Klaim</a></li>
                            <!-- <li class=""><a data-toggle="tab" href="#wishlist"><i class="soap-icon-wishlist circle"></i>Wishlist</a></li> -->
                            <!-- <li class=""><a data-toggle="tab" href="#travel-stories"><i class="soap-icon-conference circle"></i>Travel Stories</a></li> -->
                            <!-- <li class=""><a data-toggle="tab" href="#settings"><i class="soap-icon-settings circle"></i>Settings</a></li> -->
                        </ul>
                        <div class="tab-content">
                            <div id="profile" class="tab-pane fade active in">
                                <div class="view-profile">
                                    <article class="image-box style2 box innerstyle personal-details">
                                        <figure>
                                            <a title="" href="#"><img width="270" height="263" alt="" src="{$assets_url}images/avatar.png"></a>
                                        </figure>
                                        <div class="details">
                                            <a href="{$site_url}/user_panel/change_password" class="button btn-mini pull-right edit-profile-btn sky-blue1">UBAH PASSWORD</a>
                                            
                                            <h2 class="box-title fullname">{$data_user.firstname} {$data_user.lastname}</h2>
                                            <dl class="term-description">
                                                <dt>Email:</dt>
                                                <dd>{$data_user.email}</dd>
                                                <dt>first name:</dt>
                                                <dd>{$data_user.firstname}</dd>
                                                <dt>last name:</dt>
                                                <dd>{$data_user.lastname}</dd>
                                                <dt>phone number:</dt>
                                                <dd>{$data_user.phone_number}</dd>
                                                <dt>Date of birth:</dt>
                                                <dd>{$data_user.birthdate}</dd>
                                                <dt>Street Address and number:</dt>
                                                <dd>{$data_user.address}</dd>
                                                <dt>Town / City:</dt>
                                                <dd>{$data_user.city}</dd>
                                                <dt>ZIP code:</dt>
                                                <dd>{$data_user.zipcode}</dd>
                                                <dt>Country:</dt>
                                                <dd>{$data_user.country_name}</dd>
                                            </dl>
                                            
                                        </div>
                                    </article>


                                </div>
                                <div class="edit-profile" style="display: none;">
                                    <form class="edit-profile-form">
                                        <h2>Personal Details</h2>
                                        <div class="col-sm-9 no-padding no-float">
                                            <div class="row form-group">
                                                <div class="col-sms-6 col-sm-6">
                                                    <label>First Name</label>
                                                    <input type="text" class="input-text full-width" placeholder="">
                                                </div>
                                                <div class="col-sms-6 col-sm-6">
                                                    <label>Last Name</label>
                                                    <input type="text" class="input-text full-width" placeholder="">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col-sms-6 col-sm-6">
                                                    <label>Email Address</label>
                                                    <input type="text" class="input-text full-width" placeholder="">
                                                </div>
                                                <div class="col-sms-6 col-sm-6">
                                                    <label>Verify Email Address</label>
                                                    <input type="text" class="input-text full-width" placeholder="">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col-sms-6 col-sm-6">
                                                    <label>Country Code</label>
                                                    <div class="selector">
                                                        <select class="full-width">
                                                                <option>United Kingdom (+44)</option>
                                                                <option>United States (+1)</option>
                                                            </select><span class="custom-select full-width">United Kingdom (+44)</span>
                                                    </div>
                                                </div>
                                                <div class="col-sms-6 col-sm-6">
                                                    <label>Phone Number</label>
                                                    <input type="text" class="input-text full-width" placeholder="">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <label class="col-xs-12">Date of Birth</label>
                                                <div class="col-xs-4 col-sm-2">
                                                    <div class="selector">
                                                        <select class="full-width">
                                                                <option value="">date</option>
                                                            </select><span class="custom-select full-width">date</span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-4 col-sm-2">
                                                    <div class="selector">
                                                        <select class="full-width">
                                                                <option value="">month</option>
                                                            </select><span class="custom-select full-width">month</span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-4 col-sm-2">
                                                    <div class="selector">
                                                        <select class="full-width">
                                                                <option value="">year</option>
                                                            </select><span class="custom-select full-width">year</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <h2>Contact Details</h2>
                                            <div class="row form-group">
                                                <div class="col-sms-6 col-sm-6">
                                                    <label>Street Name</label>
                                                    <input type="text" class="input-text full-width">
                                                </div>
                                                <div class="col-sms-6 col-sm-6">
                                                    <label>Address</label>
                                                    <input type="text" class="input-text full-width">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col-sms-6 col-sm-6">
                                                    <label>City</label>
                                                    <div class="selector">
                                                        <select class="full-width">
                                                                <option value="">Select...</option>
                                                            </select><span class="custom-select full-width">Select...</span>
                                                    </div>
                                                </div>
                                                <div class="col-sms-6 col-sm-6">
                                                    <label>Country</label>
                                                    <div class="selector">
                                                        <select class="full-width">
                                                                <option value="">Select...</option>
                                                            </select><span class="custom-select full-width">Select...</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col-sms-6 col-sm-6">
                                                    <label>Region State</label>
                                                    <div class="selector">
                                                        <select class="full-width">
                                                                <option value="">Select...</option>
                                                            </select><span class="custom-select full-width">Select...</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <h2>Upload Profile Photo</h2>
                                            <div class="row form-group">
                                                <div class="col-sms-12 col-sm-6 no-float">
                                                    <div class="fileinput full-width" style="line-height: 34px;">
                                                        <input type="file" class="input-text" data-placeholder="select image/s"><input type="text" class="custom-fileinput input-text" placeholder="select image/s">
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <h2>Describe Yourself</h2>
                                            <div class="form-group">
                                                <textarea rows="5" class="input-text full-width" placeholder="please tell us about you"></textarea>
                                            </div>
                                            <div class="from-group">
                                                <button type="submit" class="btn-medium col-sms-6 col-sm-4">UPDATE SETTINGS</button>
                                            </div>

                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div id="booking" class="tab-pane fade">
                                <h2>Pembelian</h2>
                                <div class="filter-section gray-area clearfix">
                                    <form>
                                        <!-- <label class="radio radio-inline checked">
                                                <input type="radio" name="filter" checked="checked">
                                                All Types
                                            </label>
                                        <label class="radio radio-inline">
                                                <input type="radio" name="filter">
                                                Hotels
                                            </label>
                                        <label class="radio radio-inline">
                                                <input type="radio" name="filter">
                                                Flights
                                            </label>
                                        <label class="radio radio-inline">
                                                <input type="radio" name="filter">
                                                Cars
                                            </label>
                                        <label class="radio radio-inline">
                                                <input type="radio" name="filter">
                                                Cruises
                                            </label> -->
                                        <div class="pull-right col-md-6 action">
                                             <!-- <button class="btn-small sky-blue1">Pembelian Baru</button> -->
                                             <a href="{$site_url}" class="button pull-right edit-profile-btn sky-blue1">Pembelian Baru</a>
                                        </div>
                                    </form>
                                </div>
                                <div class="booking-history">
                                {if $data eq true}

                                    {foreach $data as $p}
                                        <div class="booking-info clearfix">
                                         <!--    <div class="date">
                                                <label class="month">NOV</label>
                                                <label class="date">23</label>
                                                <label class="day">SAT</label>
                                            </div> -->
                                            <h4 class="box-title"><i class="icon soap-icon-plane-right takeoff-effect yellow-color circle"></i><a href="{$site_url}/order/order_info_page/{$p.order_id}" target="_parent">Tujuan: {$p.dest_name} - {$p.category} - {$p.type}</a> <small>{$p.startdate} s/d {$p.enddate} </small><br><small>No Polis: {$p.policy_no}</small>

                                               </h4>
                                            <dl class="info">
                                                <dt>Order No</dt>
                                                <dd>{$p.order_no}</dd>
                                                <dt>Tgl Order</dt>
                                                <dd>{$p.order_date}</dd>
                                            </dl>
                                            <button class="btn-mini status">{$p.status}</button>
                                        </div>
                                    {/foreach}
                                {/if}
                                  <!--   <div class="booking-info clearfix">
                                        <div class="date">
                                            <label class="month">NOV</label>
                                            <label class="date">23</label>
                                            <label class="day">SAT</label>
                                        </div>
                                        <h4 class="box-title"><i class="icon soap-icon-plane-right takeoff-effect yellow-color circle"></i>WORLDWIDE EXECUTIVE<small>2 days</small></h4>
                                        <dl class="info">
                                            <dt>TRIP ID</dt>
                                            <dd>5754-8dk8-8ee</dd>
                                            <dt>ordered on</dt>
                                            <dd>saturday, nov 23, 2013</dd>
                                        </dl>
                                        <button class="btn-mini status">PAID</button>
                                    </div>
                                    <div class="booking-info clearfix">
                                        <div class="date">
                                            <label class="month">NOV</label>
                                            <label class="date">30</label>
                                            <label class="day">SAT</label>
                                        </div>
                                        <h4 class="box-title"><i class="icon soap-icon-plane-right takeoff-effect yellow-color circle"></i>WORLDWIDE PREMIER<small>3 days</small></h4>
                                        <dl class="info">
                                            <dt>TRIP ID</dt>
                                            <dd>5754-8dk8-8ee</dd>
                                            <dt>ordered on</dt>
                                            <dd>saturday, nov 30, 2013</dd>
                                        </dl>
                                        <button class="btn-mini status" style="background:red;">UNPAID</button>
                                    </div>
                                    <div class="booking-info clearfix cancelled">
                                        <div class="date">
                                            <label class="month">DEC</label>
                                            <label class="date">18</label>
                                            <label class="day">THU</label>
                                        </div>
                                        <h4 class="box-title"><i class="icon soap-icon-car circle"></i>Domestic Trip<small>4 days</small></h4>
                                        <dl class="info">
                                            <dt>TRIP ID</dt>
                                            <dd>5754-8dk8-8ee</dd>
                                            <dt>ordered on</dt>
                                            <dd>thursday, dec 18, 2013</dd>
                                        </dl>
                                        <button class="btn-mini status">CANCELLED</button>
                                    </div> -->
                                </div>

                            </div>

                            <div id="klaim" class="tab-pane fade">
                                <h2>Klaim</h2>
                                <div class="filter-section gray-area clearfix">
                                    <form>
                                       <!--  <label class="radio radio-inline checked">
                                                <input type="radio" name="filter" checked="checked">
                                                All Types
                                            </label>
                                        <label class="radio radio-inline">
                                                <input type="radio" name="filter">
                                                Hotels
                                            </label>
                                        <label class="radio radio-inline">
                                                <input type="radio" name="filter">
                                                Flights
                                            </label>
                                        <label class="radio radio-inline">
                                                <input type="radio" name="filter">
                                                Cars
                                            </label>
                                        <label class="radio radio-inline">
                                                <input type="radio" name="filter">
                                                Cruises
                                            </label> -->
                                        <div class="pull-right col-md-6 action">
                                             <a href="{$site_url}/user_panel/new_claim" class="button pull-right edit-profile-btn sky-blue1">PENGAJUAN KLAIM BARU</a>
                                            <!-- <h5 class="pull-left no-margin col-md-4">Sort results by:</h5> -->
                                            <!-- <a href="{$site_url}/user_panel/new_claim" class="btn-small sky-blue1"></a> -->
                                            <!-- <button class="btn-small white gray-color">UNPAID</button> -->
                                        </div>
                                    </form>
                                </div>
                              <div class="col-lg-12 listing-style3 hotel">
                                    <article class="box">
                                        <div class="details col-xs-14 col-sm-7 col-md-11">
                                           {if $data_claim eq true}

                                                {foreach $data_claim as $p}
                                                <div>
                                                    <div>
                                                        <h4 class="box-title"><a href="{$site_url}/user_panel/view_claim/{$p.claim_id}" target="_parent">No Klaim: {$p.no_claim} - Klaim {$p.claim_type_name}</a><small><i class="soap-icon-clock yellow-color"></i> Waktu klaim : {$p.datein}</small></h4>
                                                    </div>
                                                    <div>
                                                        <span class="price"><small>Status Klaim</small>{$p.claim_status_name}</span>
                                                    </div>
                                                </div>
                                                {/foreach}
                                            {/if}
                                          <!--   <div>
                                                <p>Nunc cursus libero purus ac congue ar lorem cursus ut sed vitae pulvinar massa idend porta nequetiam elerisque mi id, consectetur adipi deese cing elit maus fringilla bibe endum.</p>
                                                <div>
                                                    <span class="price"><small>Status Klaim</small>Open</span>
                                                    <a class="button btn-small full-width text-center" title="" href="#">SELECT</a>
                                                </div>
                                            </div> -->
                                        </div>
                                    </article>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>