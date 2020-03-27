<script type="text/javascript" src="{$assets_url}js/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="{$base_url}assets/tpl/css/style-header-step.css">

            <section id="content" style="background: #fff;">
                <div class="container">
                    <!-- <div id="main"> -->
                      <nav style="margin-bottom: 40px;">
                        <ol class="cd-multi-steps text-bottom count">
                          <!-- <li class="visited"><a href="#0">Pilih Destinasi</a></li> -->
                          <li class="visited" ><a href="#0">Isi Form Pemesanan</a></li>
                          <li class="current"><em>Pembayaran</em></li>
                        </ol>
                      </nav>

                        <div class="booking-information travelo-box">
                             <hr>
                             <center>
                             <img src="{$base_url}assets/images/checked.svg" width="64">
                             </center>
                             <h3 style="text-align:center;margin-top:20px;">Terima Kasih. Informasi pembelian dan instruksi pembayaran Asuransi Perjalanan Jasindo Travel telah dikirim melalui alamat email Anda</h3>
                             {* <p>Informasi pembelian dan instruksi pembayaran Asuransi Perjalanan Anda telah dikirim melalui alamat email Anda.</p> *}


                             {if $d.status neq 'Paid'}
                            <hr>
                            <h2 style="text-align:center;">Total Pembelian</h2>
                            <div class="icon-box style3 counters-box">
                                <div class="numbers" style="font-size: 3em;">
                                    <!-- <i class="soap-icon-plane green-color"></i> -->
                                    <span>Rp. {$d.total_amount|number_format:0:".":","}</span>
                                </div>
                            </div>
                            <!-- <p>Pembayaran via  <img src="{$base_url}/assets/images/midtrans.png" height="25">.</p> -->
                            <br>
                             {if $invoice_id eq true}
                              <p style="text-align:center;">Klik tombol dibawah ini untuk melihat halaman detil tata cara pembayaran.</p>
                               <center><a href="{$site_url}/payment/invoice_page/{$invoice_id}" target="_blank" class="red-color underline view-link">
                             <button class="button btn-large sky-blue1">BAYAR</button></a><br>
                              <small style="text-align:center;">Halaman instruksi pembayaran akan dialihkan ke nusafin.com sebagai mitra resmi pembayaran Jasindo Travel</small>
                              </center>
                            {else}
                              Invoice belum terbentuk. Harap hubungi admin lebih lanjut.
                            {/if}
                            {* <div class="col-sm-6 col-md-11">
                              <h4>Metode Pembayaran yang Didukung:</h4>
                              <img src="{$base_url}/assets/tpl/images/atmbersama.png" height="25">
                              <img src="{$base_url}/assets/tpl/images/logoprima.jpg" height="25">&nbsp;
                              <img src="{$base_url}/assets/tpl/images/logobca.png" height="25">&nbsp;
                              <img src="{$base_url}/assets/tpl/images/klikbca.png" height="25">&nbsp;
                              <img src="{$base_url}/assets/tpl/images/logomandiri.png" height="25">&nbsp;
                              <img src="{$base_url}/assets/tpl/images/logobni.png" height="25">&nbsp;
                              <img src="{$base_url}/assets/tpl/images/logobri.png" height="25">&nbsp;
                               <img src="{$base_url}/assets/tpl/images/logomastercard.png" height="25">&nbsp;
                                <img src="{$base_url}/assets/tpl/images/logovisa.png" height="25"> *}
                            {/if}

                            <hr>
                            <h2>Informasi Tertanggung</h2>
                            <dl class="term-description">
                                <dt>Order number:</dt>
                                <dd>{$d.order_no}</dd>
                                <dt>First name:</dt>
                                <dd>{$d.firstname}</dd>
                                <dt>Last name:</dt>
                                <dd>{$d.lastname}</dd>
                                <dt>E-mail address:</dt>
                                <dd>{$d.email}</dd>
                                <dt>Street Address and number:</dt>
                                <dd>{$d.address}</dd>
                                <dt>Town / City:</dt>
                                <dd>{$d.city}</dd>
                                <dt>ZIP code:</dt>
                                <dd>{$d.zipcode}</dd>
                                <dt>Country:</dt>
                                <dd>{$d.country_name}</dd>
                            </dl>
                            <hr>
                            <h2>Informasi Pemesanan</h2>
                            <dl class="term-description">
                                <dt>Keberangkatan:</dt>
                                <dd>{$d.depart_name}</dd>
                                <dt>Tujuan:</dt>
                                <dd>{$d.dest_name}</dd>
                                <dt>Regional:</dt>
                                <dd>{$d.region_name_detail}</dd>
                                <dt>Mulai Tanggal:</dt>
                                <dd>{$d.startdate}</dd>
                                <dt>Sampai Tanggal:</dt>
                                <dd>{$d.enddate}</dd>
                                <dt>Kategori:</dt>
                                <dd>{$d.category}</dd>
                                <dt>Tipe:</dt>
                                <dd>{$d.type}</dd>
                                 <dt>Total Premi:</dt>
                                <dd>{$d.total_premi|number_format:2:".":","}</dd>
                                 <dt>Total Premi Perluasan:</dt>
                                <dd>{$d.total_perluasan|number_format:2:".":","}</dd>
                                 <dt>Biaya Polis dan Materai:</dt>
                                <dd>{$d.other_fee|number_format:2:".":","}</dd>
                                <dt>Biaya Transaksi:</dt>
                                <dd>{$d.payment_fee|number_format:2:".":","}</dd>
                                <dt>Total Pembayaran:</dt>
                                <dd>{$d.total_amount|number_format:2:".":","}</dd>
                                 <dt>Status Pemesanan:</dt>
                                <dd>{$d.status}</dd>
                            </dl>

                           
                        </div>
                        
                    </div>
                <!-- </div> -->
            </section>
            <p>&nbsp;</p>


        <!-- TODO: Remove ".sandbox" from script src URL for production environment. Also input your client key in "data-client-key" -->
<!-- <script src="https://app.sandbox.midtrans.com/snap/snap.js" data-client-key="VT-client-1IJd3BeahUlBjimV"></script> -->
<!--<script type="text/javascript">
  document.getElementById('pay-button').onclick = function(){
    // SnapToken acquired from previous step
    snap.pay('{$token}', {
      // Optional
      onSuccess: function(result){
                            $.ajax({ 
                              type: 'POST', 
                              url: '{$site_url}/payment/save_result', 
                              data: { 
                                result
                              }, 
                              dataType: 'json',
                              success: function (data) { 
                                window.location = "{$site_url}/payment/end";
                              }
                            });
        // redirect('payment/f')
        // /* You may add your own js here, this is just example */ document.getElementById('result-json').innerHTML += JSON.stringify(result, null, 2);
      },
      // Optional
      onPending: function(result){
         $.ajax({ 
                              type: 'POST', 
                              url: '{$site_url}/payment/save_result', 
                              data: { 
                                result
                              }, 
                              dataType: 'json',
                              success: function (data) { 
                                window.location = "{$site_url}/payment/end";
                              }
                            });
        // /* You may add your own js here, this is just example */ document.getElementById('result-json').innerHTML += JSON.stringify(result, null, 2);
      },
      // Optional
      onError: function(result){
        /* You may add your own js here, this is just example */ document.getElementById('result-json').innerHTML += JSON.stringify(result, null, 2);
      }
    });
  };
</script>


