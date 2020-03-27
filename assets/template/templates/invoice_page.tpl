<div class="row">
				<div class="sidebar col-md-3">
                        <article class="detailed-logo">
                            <!-- <figure> -->
                            <center>
                            	<img src="{$base_url}/assets/tpl/images/logo.png" height="90"><br>
                               Invoice Jasindo Travel
                           </center>
                            <!-- </figure> -->
                            <div class="details">
                                <center><h5 class="box-title">Asuransi Perjalanan {$order.category} {$order.type} {$order.region_name_detail}</h5></center>
                                <span class="price clearfix">
                                   <center> <small>Total Pembayaran</small>
                                    <span>Rp {$data.amount|number_format:0:".":","}</span>
                                </center>
                                </span>
                                {if $data.status =='COMPLETED'}
                                	<p class="description"><center>Terima kasih sudah melakukan pembayaran.</center></p>
                                {else}
                                	<p class="description">Dimohon untuk melakukan pembayaran paling lambat tanggal:<br> {$data.expiry_date}</p>
                                {/if}
                                
                                <a class="button yellow full-width uppercase btn-small" href="#">{$data.status}</a>
                            </div>
                        </article>

                    </div>

                    {if $data.status =='PENDING'}
                    	<div id="main" class="col-md-9">
                        <div class="featured-image box">
                            <!-- <img src="http://placehold.it/870x496.png" alt=""> -->
                        </div>


                        <div class="tab-container">
                            <ul class="tabs">
                                <li class="active">
                                    <a href="#mandiri" data-toggle="tab">Mandiri</a>
                                </li>
                                <li class="" style="display:none;">
                                    <a href="#bca" data-toggle="tab">BCA</a>
                                </li>
                                <li class="">
                                    <a href="#bni" data-toggle="tab">BNI</a>
                                </li>
                                <li class="">
                                    <a href="#bri" data-toggle="tab">BRI</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="mandiri">
                                    <div class="travelo-box book-with-us-box" style="margin-top: 0px; padding: 0px;">
			                            <img src="{$base_url}/assets/images/logo_MANDIRI_2016.png" height="28">
			                            <h3><b>Virtual Account: {$mandiri.bank_account_number}</b></h3>
			                            Silakan baca petunjuk di bawah ini untuk menyelesaikan transaksi Anda.
			                            <div class="toggle-container box" id="accordion1">
			                            	 <div class="panel style1">
			                                    <h4 class="panel-title">
			                                        <a class="collapsed" href="#acc3" data-toggle="collapse" data-parent="#accordion1">ATM</a>
			                                    </h4>
			                                    <div class="panel-collapse collapse" id="acc3" style="height: auto;">
			                                        <div class="panel-content">
			                                            <ul>
							                                <li>
							                                    <i class="circle">1</i>
							                                    <h5 class="title">Masukkan kartu ATM dan pilih "Bahasa Indonesia"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">2</i>
							                                    <h5 class="title">Ketik nomor PIN kartu ATM</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">3</i>
							                                    <h5 class="title">Pilih menu BAYAR/BELI, kemudian pilih menu MULTI PAYMENT</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">4</i>
							                                    <h5 class="title">Ketik kode perusahaan, yaitu "88908" (88908 XENDIT), tekan "BENAR"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">5</i>
							                                    <h5 class="title">Masukkan nomor Virtual Account <b>{$mandiri.bank_account_number}</b></h5>
							                                </li>
							                                <li>
							                                    <i class="circle">6</i>
							                                    <h5 class="title">Isi NOMINAL, kemudian tekan "BENAR"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">7</i>
							                                    <h5 class="title">Muncul konfirmasi data customer. Pilih Nomor 1 sesuai tagihan yang akan dibayar, kemudian tekan "YA".</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">8</i>
							                                    <h5 class="title">Muncul konfirmasi pembayaran. Tekan "YA" untuk melakukan pembayaran.</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">9</i>
							                                    <h5 class="title">Bukti pembayaran dalam bentuk struk agar disimpan sebagai bukti pembayaran yang sah dari Bank Mandiri</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">10</i>
							                                    <h5 class="title">Transaksi Anda sudah selesai.</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">11</i>
							                                    <h5 class="title">Setelah transaksi pembayaran Anda selesai, invoice ini akan diperbarui secara otomatis. Ini bisa memakan waktu hingga 5 menit..</h5>
							                                </li>
							                            </ul>
			                                        </div>
			                                        <!-- end content -->
			                                    </div>
			                                </div>

			                                <div class="panel style1">
			                                    <h4 class="panel-title">
			                                        <a href="#acc1" data-toggle="collapse" data-parent="#accordion1" class="collapsed">Online</a>
			                                    </h4>
			                                    <div class="panel-collapse collapse" id="acc1" style="height: 0px;">
			                                        <div class="panel-content">
			                                           <ul>
							                               <li>
							                                    <i class="circle">1</i>
							                                    <h5 class="title">Kunjungi website Mandiri Internet Banking dengan alamat https://ib.bankmandiri.co.id/</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">2</i>
							                                    <h5 class="title">Login dengan memasukkan USER ID dan PIN</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">3</i>
							                                    <h5 class="title">Masuk ke halaman Beranda, lalu pilih "Bayar"</b></h5>
							                                </li>
							                                <li>
							                                    <i class="circle">4</i>
							                                    <h5 class="title">Pilih "Multi Payment"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">5</i>
							                                    <h5 class="title">Pilih "No Rekening Anda"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">6</i>
							                                    <h5 class="title">Pilih Penyedia Jasa "88908 XENDIT"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">7</i>
							                                    <h5 class="title">Pilih "No Virtual Account".</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">8</i>
							                                    <h5 class="title">Masukkan nomor Virtual Account <b>{$mandiri.bank_account_number}</b>.</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">9</i>
							                                    <h5 class="title">Masuk ke halaman konfirmasi 1.</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">10</i>
							                                    <h5 class="title">Apabila benar/sesuai, klik tombol tagihan TOTAL, kemudian klik "Lanjutkan".</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">11</i>
							                                    <h5 class="title">Masuk ke halaman konfirmasi 2.</h5>
							                                </li>
							                                 <li>
							                                    <i class="circle">12</i>
							                                    <h5 class="title">Masukkan Challenge Code yang dikirimkan ke Token Internet Banking Anda, kemudian klik "Kirim".</h5>
							                                </li>
							                                 <li>
							                                    <i class="circle">13</i>
							                                    <h5 class="title">Masuk ke halaman konfirmasi pembayaran telah selesai.</h5>
							                                </li>
							                                 <li>
							                                    <i class="circle">14</i>
							                                    <h5 class="title">Setelah transaksi pembayaran Anda selesai, invoice ini akan diperbarui secara otomatis. Ini bisa memakan waktu hingga 5 menit.</h5>
							                                </li>
							                            </ul>
			                                        </div>
			                                        <!-- end content -->
			                                    </div>
			                                </div>
			                               
			                            </div>
			                        </div>
                                </div>


                                <!-- /// -->

                                <div class="tab-pane fade" id="bca">
                                    <div class="travelo-box book-with-us-box" style="margin-top: 0px; padding: 0px;">
			                             <img src="{$base_url}/assets/images/logo_BCA_2016.png" height="28">
			                            <h3><b>Virtual Account <b>{$bca.bank_account_number}</b></b></h3>
			                            Silakan baca petunjuk di bawah ini untuk menyelesaikan transaksi Anda.
			                            <div class="toggle-container box" id="accordion2">
			                            	 <div class="panel style1">
			                                    <h4 class="panel-title">
			                                        <a class="collapsed" href="#accordion2_acc3" data-toggle="collapse" data-parent="#accordion2">ATM</a>
			                                    </h4>
			                                    <div class="panel-collapse collapse" id="accordion2_acc3" style="height: auto;">
			                                        <div class="panel-content">
			                                            <ul>
							                                <li>
							                                    <i class="circle">1</i>
							                                    <h5 class="title">Masukkan kartu ATM dan PIN BCA Anda</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">2</i>
							                                    <h5 class="title">Di Menu utama, pilih "Transaksi Lainnya". Pilih "Transfer". Pilih "Ke BCA Virtual Account"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">3</i>
							                                    <h5 class="title">Masukkan nomor Virtual Account <b>{$bca.bank_account_number}</b></h5>
							                                </li>
							                                <li>
							                                    <i class="circle">4</i>
							                                    <h5 class="title">Pastikan data virtual account Anda benar, kemudian masukkan angka yang perlu Anda bayarkan, kemudian pilih "BENAR"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">5</i>
							                                    <h5 class="title">Cek & perhatikan konfirmasi pembayaran dari layar ATM, jika sudah benar pilih "YA", atau pilih "TIDAK" jika data di layar masih salah</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">6</i>
							                                    <h5 class="title">Transaksi Anda sudah selesai. Pilih "TIDAK" untuk tidak melanjutkan transaksi lain</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">7</i>
							                                    <h5 class="title">Setelah transaksi pembayaran Anda selesai, invoice ini akan diperbarui secara otomatis. Ini bisa memakan waktu hingga 5 menit.</h5>
							                                </li>
							                            </ul>
			                                        </div>
			                                        <!-- end content -->
			                                    </div>
			                                </div>

			                                <div class="panel style1">
			                                    <h4 class="panel-title">
			                                        <a href="#accordion2_acc1" data-toggle="collapse" data-parent="#accordion2" class="collapsed">Online</a>
			                                    </h4>
			                                    <div class="panel-collapse collapse" id="accordion2_acc1" style="height: 0px;">
			                                        <div class="panel-content">
			                                           <ul>
							                               <li>
							                                    <i class="circle">1</i>
							                                    <h5 class="title">Login ke KlikBCA Individual</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">2</i>
							                                    <h5 class="title">Pilih "Transfer", kemudian pilih "Transfer ke BCA Virtual Account"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">3</i>
							                                    <h5 class="title">Masukkan nomor Virtual Account <b>{$bca.bank_account_number}</b></h5>
							                                </li>
							                                <li>
							                                    <i class="circle">4</i>
							                                    <h5 class="title">Pilih "Lanjutkan" untuk melanjutkan pembayaran</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">5</i>
							                                    <h5 class="title">Masukkan "RESPON KEYBCA APPLI 1" yang muncul pada Token BCA Anda, lalu klik tombol "Kirim"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">6</i>
							                                    <h5 class="title">Transaksi Anda sudah selesai</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">7</i>
							                                    <h5 class="title">Setelah transaksi pembayaran Anda selesai, invoice ini akan diperbarui secara otomatis. Ini bisa memakan waktu hingga 5 menit.</h5>
							                                </li>
							                            </ul>
			                                        </div>
			                                        <!-- end content -->
			                                    </div>
			                                </div>

			                                <div class="panel style1">
			                                    <h4 class="panel-title">
			                                        <a class="collapsed" href="#accordion2_acc2" data-toggle="collapse" data-parent="#accordion2">MBANKING</a>
			                                    </h4>
			                                    <div class="panel-collapse collapse" id="accordion2_acc2" style="height: 0px;">
			                                        <div class="panel-content">
			                                           <ul>
							                                <li>
							                               <li>
							                                    <i class="circle">1</i>
							                                    <h5 class="title">Buka Aplikasi BCA Mobile</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">2</i>
							                                    <h5 class="title">Pilih "m-BCA", kemudian pilih "m-Transfer"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">3</i>
							                                    <h5 class="title">Pilih "BCA Virtual Account"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">4</i>
							                                    <h5 class="title">Masukkan nomor Virtual Account <b>{$bca.bank_account_number}</b>, lalu pilih "OK"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">5</i>
							                                    <h5 class="title">Klik tombol "SEND" yang berada di sudut kanan atas aplikasi untuk melakukan transfer</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">6</i>
							                                    <h5 class="title">Klik "OK" untuk melanjutkan pembayaran</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">7</i>
							                                    <h5 class="title">Masukkan PIN Anda untuk meng-otorisasi transaksi.</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">8</i>
							                                    <h5 class="title">Setelah transaksi pembayaran Anda selesai, invoice ini akan diperbarui secara otomatis. Ini bisa memakan waktu hingga 5 menit.</h5>
							                                </li>
							                            </ul>
			                                        </div>
			                                        <!-- end content -->
			                                    </div>
			                                </div>

			                               
			                            </div>
			                            
			                        </div>
                                </div>


                                <!-- ------ -->

                                <div class="tab-pane fade" id="bni">
                                    <div class="travelo-box book-with-us-box" style="margin-top: 0px; padding: 0px;">
			                            <!-- <h4>BNI</h4> -->
			                            <img src="{$base_url}/assets/images/logo_BNI_2016.png" height="28">
			                            <h3><b>Virtual Account: <b>{$bni.bank_account_number}</b></b></h3>
			                            
			                            Silakan baca petunjuk di bawah ini untuk menyelesaikan transaksi Anda.
			                            <div class="toggle-container box" id="accordion3">
			                            	 <div class="panel style1">
			                                    <h4 class="panel-title">
			                                        <a class="collapsed" href="#accordion3_acc3" data-toggle="collapse" data-parent="#accordion3">ATM</a>
			                                    </h4>
			                                    <div class="panel-collapse collapse" id="accordion3_acc3" style="height: auto;">
			                                        <div class="panel-content">
			                                            <ul>
							                                <li>
							                                    <i class="circle">1</i>
							                                    <h5 class="title">Masukkan kartu, pilih bahasa kemudian masukkan PIN Anda</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">2</i>
							                                    <h5 class="title">Pilih "Menu Lainnya" lalu pilih "Transfer"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">3</i>
							                                    <h5 class="title">Pilih "Tabungan" lalu "Rekening BNI Virtual Account"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">4</i>
							                                    <h5 class="title">Masukkan nomor Virtual Account <b>{$bni.bank_account_number}</b> dan nominal yang ingin Anda bayar</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">5</i>
							                                    <h5 class="title">Periksa kembali data transaksi kemudian tekan "YA"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">6</i>
							                                    <h5 class="title">Setelah transaksi pembayaran Anda selesai, invoice ini akan diperbarui secara otomatis. Ini bisa memakan waktu hingga 5 menit.</h5>
							                                </li>
							                            </ul>
			                                        </div>
			                                        <!-- end content -->
			                                    </div>
			                                </div>

			                                <div class="panel style1">
			                                    <h4 class="panel-title">
			                                        <a href="#accordion3_acc1" data-toggle="collapse" data-parent="#accordion3" class="collapsed">Online</a>
			                                    </h4>
			                                    <div class="panel-collapse collapse" id="accordion3_acc1" style="height: 0px;">
			                                        <div class="panel-content">
			                                           <ul>
							                               <li>
							                                    <i class="circle">1</i>
							                                    <h5 class="title">Login di https://ibank.bni.co.id, masukkan USER ID dan PASSWORD</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">2</i>
							                                    <h5 class="title">Pilih "TRANSFER" lalu pilih "Tambah Rekening Favorit"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">3</i>
							                                    <h5 class="title">Jika Anda menggunakan desktop untuk menambah rekening, pilih "Transaksi", pilih "Info & Administrasi Transfer" lalu pilih "Atur Rekening Tujuan" kemudian "Tambah Rekening Tujuan"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">4</i>
							                                    <h5 class="title">Masukkan nama dan nomor Virtual Account Anda <b>{$bni.bank_account_number}</b>, lalu masukkan Kode Otentikasi Token</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">5</i>
							                                    <h5 class="title">Jika Nomor rekening tujuan berhasil ditambahkan, kembali ke menu "TRANSFER"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">6</i>
							                                    <h5 class="title">Pilih "TRANSFER ANTAR REKENING BNI", kemudian pilih rekening tujuan</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">7</i>
							                                    <h5 class="title">Pilih Rekening Debit dan ketik nominal, lalu masukkan kode otentikasi token.</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">8</i>
							                                    <h5 class="title">Setelah transaksi pembayaran Anda selesai, invoice ini akan diperbarui secara otomatis. Ini bisa memakan waktu hingga 5 menit.</h5>
							                                </li>
							                            </ul>
			                                        </div>
			                                        <!-- end content -->
			                                    </div>
			                                </div>

			                                <div class="panel style1">
			                                    <h4 class="panel-title">
			                                        <a class="collapsed" href="#accordion3_acc2" data-toggle="collapse" data-parent="#accordion3">MBANKING</a>
			                                    </h4>
			                                    <div class="panel-collapse collapse" id="accordion3_acc2" style="height: 0px;">
			                                        <div class="panel-content">
			                                           <ul>
							                                <li>
							                               <li>
							                                    <i class="circle">1</i>
							                                    <h5 class="title">Login ke BNI Mobile Banking, masukkan USER ID dan MPIN</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">2</i>
							                                    <h5 class="title">Pilih menu "Transfer", lalu pilih "Antar Rekening BNI"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">3</i>
							                                    <h5 class="title">Pilih "Input Rekening Baru"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">4</i>
							                                    <h5 class="title">Masukkan "Rekening Debet", "Rekening Tujuan (<b>{$bni.bank_account_number}</b>)" dan "Nominal" kemudian klik "Lanjut"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">5</i>
							                                    <h5 class="title">Periksa kembali data transaksi Anda, masukkan "Password Transaksi", kemudian klik "Lanjut"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">6</i>
							                                    <h5 class="title">Setelah transaksi pembayaran Anda selesai, invoice ini akan diperbarui secara otomatis. Ini bisa memakan waktu hingga 5 menit.</h5>
							                                </li>
							                            </ul>
			                                        </div>
			                                        <!-- end content -->
			                                    </div>
			                                </div>

			                               
			                            </div>
			                            
			                        </div>
                                </div>

                                <!-- ------ -->

                                <div class="tab-pane fade" id="bri">
                                    <div class="travelo-box book-with-us-box" style="margin-top: 0px; padding: 0px;">
			                            <!-- <h4>BNI</h4> -->
			                            <img src="{$base_url}/assets/images/logo_BRI_2016.png" height="28">
			                            <h3><b>Virtual Account: <b>{$bri.bank_account_number}</b></b></h3>
			                            
			                            Silakan baca petunjuk di bawah ini untuk menyelesaikan transaksi Anda.
			                            <div class="toggle-container box" id="accordion3">
			                            	 <div class="panel style1">
			                                    <h4 class="panel-title">
			                                        <a class="collapsed" href="#accordion4_acc3" data-toggle="collapse" data-parent="#accordion4">ATM</a>
			                                    </h4>
			                                    <div class="panel-collapse collapse" id="accordion4_acc3" style="height: auto;">
			                                        <div class="panel-content">
			                                            <ul>
							                                <li>
							                                    <i class="circle">1</i>
							                                    <h5 class="title">Masukkan kartu, pilih bahasa kemudian masukkan PIN Anda</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">2</i>
							                                    <h5 class="title">Pilih "Transaksi Lain" lalu pilih "Pembayaran"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">3</i>
							                                    <h5 class="title">Pilih "Lainnya" lalu pilih "Briva"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">4</i>
							                                    <h5 class="title">Masukkan nomor Virtual Account <b>{$bri.bank_account_number}</b> dan nominal yang ingin Anda bayar</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">5</i>
							                                    <h5 class="title">Periksa kembali data transaksi kemudian tekan "YA"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">6</i>
							                                    <h5 class="title">Setelah transaksi pembayaran Anda selesai, invoice ini akan diperbarui secara otomatis. Ini bisa memakan waktu hingga 5 menit.</h5>
							                                </li>
							                            </ul>
			                                        </div>
			                                        <!-- end content -->
			                                    </div>
			                                </div>

			                                <div class="panel style1">
			                                    <h4 class="panel-title">
			                                        <a href="#accordion4_acc1" data-toggle="collapse" data-parent="#accordion4" class="collapsed">Online</a>
			                                    </h4>
			                                    <div class="panel-collapse collapse" id="accordion4_acc1" style="height: 0px;">
			                                        <div class="panel-content">
			                                           <ul>
							                               <li>
							                                    <i class="circle">1</i>
							                                    <h5 class="title">Login di https://ib.bri.co.id/, masukkan USER ID dan PASSWORD</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">2</i>
							                                    <h5 class="title">Pilih "Pembayaran" lalu pilih "Briva"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">3</i>
							                                    <h5 class="title">Masukkan nomor Virtual Account Anda <b>{$bri.bank_account_number}</b>, nominal yang akan dibayar, lalu klik kirim</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">4</i>
							                                    <h5 class="title">Masukkan kembali PASSWORD anda serta kode otentikasi mToken internet banking</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">5</i>
							                                    <h5 class="title">Setelah transaksi pembayaran Anda selesai, invoice ini akan diperbarui secara otomatis. Ini bisa memakan waktu hingga 5 menit.</h5>
							                                </li>
							                            </ul>
			                                        </div>
			                                        <!-- end content -->
			                                    </div>
			                                </div>

			                                <div class="panel style1">
			                                    <h4 class="panel-title">
			                                        <a class="collapsed" href="#accordion4_acc2" data-toggle="collapse" data-parent="#accordion4">MBANKING</a>
			                                    </h4>
			                                    <div class="panel-collapse collapse" id="accordion4_acc2" style="height: 0px;">
			                                        <div class="panel-content">
			                                           <ul>
							                                <li>
							                               <li>
							                                    <i class="circle">1</i>
							                                    <h5 class="title">Login ke BRI Mobile Banking, masukkan USER ID dan PIN anda</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">2</i>
							                                    <h5 class="title">Pilih "Pembayaran" lalu pilih "Briva"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">3</i>
							                                    <h5 class="title">Masukkan nomor Virtual Account anda <b>{$bri.bank_account_number}</b>, serta nominal yang akan dibyar</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">4</i>
							                                    <h5 class="title">Masukkan nomor PIN anda dan klik "Kirim"</h5>
							                                </li>
							                                <li>
							                                    <i class="circle">5</i>
							                                    <h5 class="title">Setelah transaksi pembayaran Anda selesai, invoice ini akan diperbarui secara otomatis. Ini bisa memakan waktu hingga 5 menit.</h5>
							                                </li>
							                            </ul>
			                                        </div>
			                                        <!-- end content -->
			                                    </div>
			                                </div>

			                               
			                            </div>
			                            
			                        </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    	
                    {/if}
                    
                    
                </div>