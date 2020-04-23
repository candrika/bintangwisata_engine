<section id="content" style="margin-top:20px;">
            <div class="container">
                <div id="main">
                    <div class="travelo-google-map block">
                        <div style="height: 100%; width: 100%;">
                            <div class="gm-err-container">

                                <div class="mapouter">
                                    <div class="gmap_canvas"><iframe width="100%" height="100%" id="gmap_canvas" src="https://maps.google.com/maps?q=bintang%20wisata%20Jl.%20Lumbu%20Barat%20II%20No.12&amp;t=m&amp;z=10&amp;output=embed&amp;iwloc=near"
                                            frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe></div>
                                    <style>
                                        .mapouter {
                                            overflow: hidden;
                                            height: '100%';
                                            width: '100%';
                                        }
                                        
                                        .gmap_canvas {
                                            background: none!important;
                                            height: '100%';
                                            width: '100%';
                                        }
                                    </style>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="contact-address row block">
                        <div class="col-md-4">
                            <div class="icon-box style5">
                                <i class="soap-icon-phone"></i>
                                <div class="description">
                                    <small>We are on 24/7</small>
                                    <h5>{$settings.cs_phone1}</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="icon-box style5">
                                <i class="soap-icon-message"></i>
                                <div class="description">
                                    <small>Send us email on</small>
                                    <h5>{$settings.email_inbox}</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="icon-box style5">
                                <i class="soap-icon-address"></i>
                                <div class="description">
                                    <small>meet us at</small>
                                    <h5>{$settings.company_address}</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="travelo-box box-full">
                        <div class="contact-form">
                            <h2>Send us a Message</h2>
                            <form action="{$site_url}/home/contact" method="post">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label>Your Name</label>
                                            <input type="text" name="name" class="input-text full-width">
                                        </div>
                                        <div class="form-group">
                                            <label>Your Email</label>
                                            <input type="text" name="email" class="input-text full-width">
                                        </div>
                                        <div class="form-group">
                                            <label>Subject</label>
                                            <input type="text" name="subject" class="input-text full-width">
                                        </div>
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="form-group">
                                            <label>Your Message</label>
                                            <textarea name="message" rows="8" class="input-text full-width" placeholder="write message here"></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sms-offset-6 col-sm-offset-6 col-md-offset-8 col-lg-offset-9">
                                    <button class="btn-medium full-width">SEND MESSAGE</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>