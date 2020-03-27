<STYLE TYPE="text/css">
#content.image-bg1 {
    background: url() no-repeat center center;
    /* min-height: 880px; */
}
</STYLE>

<section id="content" >
            <div class="container">

                   
                    <div class="col-sm-10 col-md-8 col-lg-6 no-float no-padding center-block block">
                         <!-- <div class="welcome-text block">Welcome back!</div> -->
                        <form class="login-form" action="{$site_url}/login/create_new_pass" method="post">
                            <div class="form-group input-login">
                                <label>Masukkan Kata Kunci Baru Anda</label>
                                <input type="password" name="password" class="input-text input-large full-width" >
                            </div>
                             <div class="form-group input-login">
                                <label>Ulangi Kata Kunci Baru Anda</label>
                                <input type="password" name="password2" class="input-text input-large full-width" >
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
        </section>