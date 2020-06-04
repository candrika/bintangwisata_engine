<section id="content" class="gray-area" style="margin-top:1%;">
            <div class="container">
                <div id="main">
                    <div class="tab-container full-width-style arrow-left dashboard">
                        <ul class="tabs">
                            <!-- <li class="active"><a data-toggle="tab" href="#profile"><i class="soap-icon-user circle"></i>Profil</a></li>
                            <li class=""><a data-toggle="tab" href="#booking"><i class="soap-icon-shopping circle"></i>Pembelian</a></li>
                            <li class=""><a data-toggle="tab" href="#klaim"><i class="soap-icon-insurance circle"></i>Klaim</a></li> -->
                            {foreach $main_menu key=k item=main}
                               <li><a data-toggle="tab" href="#{$main.menu_link}"><i><img src="{$base_url}{$main.icon}"></i>{$main.menu_name}</a></li>
                            {/foreach}
                        </ul>
                        <div class="tab-content">
                            <div id="profile" class="tab-pane fade active in">
                                <div class="view-profile">
                                    <article class="image-box style2 box innerstyle personal-details">
                                        <div class="col-md-6">
                                            <figure>
                                                <a title="" href="#"><img width="270" height="263" alt="invoice logo" src="{$assets_url}images/{$data_user.invoice_logo}"></a>
                                            </figure>
                                            <br/>
                                            <figure>
                                                <a title="" href="#"><img width="270" height="263" alt="LOGO" src="{$assets_url}images/{$data_user.photo_profile}"></a>
                                            </figure>
                                            <br/>
                                            <figure>
                                                <a title="" href="#"><img width="270" height="263" alt="KTP" src="{$assets_url}images/{$data_user.photo_card_id}"></a>
                                            </figure>
                                        </div>
                                        
                                        <div class="details">
                                            <a href="{$site_url}/user_panel/change_password" class="button btn-mini pull-right edit-profile-btn sky-blue1">UBAH PASSWORD</a>
                                            
                                            <h2 class="box-title fullname">{$data_user.fullname}</h2>
                                            <dl class="term-description">
                                                <dt>ID Member:</dt>
                                                <dd>{$data_user.member_code}</dd>
                                                <dt>Email:</dt>
                                                <dd>{$data_user.email}</dd>
                                                <dt>Nama Lengkap:</dt>
                                                <dd>{$data_user.fullname}</dd>
                                                <dt>Nama Panggilan:</dt>
                                                <dd>{$data_user.nickname}</dd>
                                                <dt>phone number:</dt>
                                                <dd>{$data_user.phone_number}</dd>
                                                <dt>Street Address and number:</dt>
                                                <dd>{$data_user.address}</dd>
                                                <dt>Town / City:</dt>
                                                <dd>{$data_user.city}</dd>
                                                <dt>ZIP code:</dt>
                                                <dd>{$data_user.post_code}</dd>
                                                
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
                                <div id="news" class="tab-pane fade">
                                <h2>Berita</h2>
                                <div class="filter-section gray-area clearfix">
                                   
                                </div>
                              <div class="col-lg-12 listing-style3 hotel">
                                    <article class="box">
                                        <div class="details col-xs-14 col-sm-7 col-md-11">
                                           {if $news eq true}
                                                {foreach $news as $p}
                                                <div>
                                                    <div>
                                                        <span class="box-title"><a href="#" target="_parent">{$p.news_title}:</a><small><p style="color:blue;/* font-size: 10px; */position: relative;/* top: -18px; *//* left: 51px; */text-align: justify;">{$p.news_content}</p></small></span>
                                                    </div>
                                                </div>
                                                {/foreach}
                                            {/if}
                                        </div>
                                    </article>
                                </div>
                            </div>
                            <div id="downline" class="tab-pane fade">
                                <h2>Klaim</h2>
                                <div class="edit-profile">
                                    <form class="edit-profile-form">
                                        <h2>Personal Details</h2>
                                        <div class="col-sm-12 no-padding no-float">
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
                                                <button type="submit" class="btn-medium col-sms-6 col-sm-4 pull-right">Simpan</button>
                                            </div>

                                        </div>
                                    </form>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>