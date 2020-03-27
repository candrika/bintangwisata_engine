<!doctype html>
<html>
  <head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Pesan Jasindo Travel</title>
    <link rel="stylesheet" href="<?=base_url()?>/assets/tpl/css/style-email.css">
  </head>
  <body class="">
    <table border="0" cellpadding="0" cellspacing="0" class="body">
      <tr>
        <td>&nbsp;</td>
        <td class="container">
          <div class="content">

            <!-- START CENTERED WHITE CONTAINER -->
            <span class="preheader">Pesan Balasan Dari Jasindo Travel.</span>
            <table class="main">

              <!-- START MAIN CONTENT AREA -->
              <tr>
                <td class="wrapper">
                  <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td>
                        <p>Dear <?=$email_to?>,</p>
                        <p>Anda mendapatkan balasan dari Admin Jasindo Travel sebagai berikut:</p>
                        
                        <blockquote>
                          <?=$message_content_source?> <small style="float:right;">@ <?=time_elapsed_string($datein)?></small>
                        </blockquote>
                        <!-- <p>&nbsp;</p> -->
                        <blockquote class="blockquote_reply">
                          <?=$message_content?> <small style="float:right;">@ <?=time_elapsed_string($datereply)?></small>
                        </blockquote>

                        <p></p>

                        <p>Demikian kiranya yang dapat kami sampaikan.</p>
                        <p>Terima Kasih.</p>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>

            <!-- END MAIN CONTENT AREA -->
            </table>

            <!-- START FOOTER -->
            <div class="footer">
              <table border="0" cellpadding="0" cellspacing="0">
                <!-- <tr>
                  <td class="content-block">
                    <span class="apple-link">Company Inc, 3 Abbey Road, San Francisco CA 94102</span>
                    <br> Don't like these emails? <a href="http://i.imgur.com/CScmqnj.gif">Unsubscribe</a>.
                  </td>
                </tr> -->
                <tr>
                  <td class="content-block powered-by">
                    <?=date('Y')?> <?=$this->settings['site_title']?>
                  </td>
                </tr>
              </table>
            </div>
            <!-- END FOOTER -->

          <!-- END CENTERED WHITE CONTAINER -->
          </div>
        </td>
        <td>&nbsp;</td>
      </tr>
    </table>
  </body>
</html>
