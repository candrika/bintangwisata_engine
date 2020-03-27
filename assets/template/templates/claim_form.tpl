<link rel="stylesheet" href="{$base_url}/assets/js/nyroModal.css" type="text/css" media="screen" />

<script type="text/javascript" src="{$base_url}/assets/js/jquery.scrollTo-min.js"></script>
	<script type="text/javascript" src="{$base_url}/assets/js/jquery.nyroModal.custom.js"></script>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

	<script type="text/javascript">
$(function() {

  $('.doc_lainnya_laporan').nyroModal();
  $('.doc_lainnya_keterangan').nyroModal();
  $('.doc_lainnya_copy').nyroModal();
  $('.doc_lainnya_lainnya').nyroModal();
  
  $('.doc_kenyamanan_kuitansi').nyroModal();
  $('.doc_kenyamanan_laporan').nyroModal();
  $('.doc_kenyamanan_konfirmasi1').nyroModal();
  $('.doc_kenyamanan_konfirmasi2').nyroModal();
  $('.doc_kenyamanan_kematian').nyroModal();
  $('.doc_kenyamanan_keterangan').nyroModal();
  $('.doc_kenyamanan_lainnya').nyroModal();  

$('.doc_kecelakaan_laporan').nyroModal();  
$('.doc_kecelakaan_resume').nyroModal();  
$('.doc_kecelakaan_surat').nyroModal();  
$('.doc_kecelakaan_kk').nyroModal();  
$('.doc_kecelakaan_fotocopy').nyroModal();  
$('.doc_kecelakaan_lainnya').nyroModal();  
  
  
$('.doc_medis_resume').nyroModal();  
$('.doc_medis_kuitansi').nyroModal();  
$('.doc_medis_dokumen_lain').nyroModal();    
  

});
</script>


<script src="{$base_url}/node_modules/sweetalert/dist/sweetalert.min.js"></script>

<style type="text/css">
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){ background-color: #f2f2f2; }

#customers tr:hover { background-color: #ddd; }

#customers th {
	 font-weight: bold;
    padding-top: 6px;
    padding-bottom: 6px;
    text-align: center;
    background-color: #ffae44;
    color: white;
}

textarea {
    background-color: #FFF;
}
</style>

<section id="content"  style="background-color:#FFF;">
            <div class="container">
            	<center><h2> <i class="soap-icon-insurance circle"></i> Formulir Klaim Asuransi Perjalanan</h2></center>
			<div class="col-sm-10 col-md-8 col-lg-10 no-float no-padding center-block block">
			    <form class="login-form" id="form_claim" enctype="multipart/form-data" method="POST">

			    	<input type="hidden" name="insured_id" value="{$data_insured.insured_id}">

			    	<table width="100%" border="1" style="padding:5px;" id="customers">
			    		<tr>
			    			<th>Petunjuk Pengajuan Klaim</th>
			    		</tr>
			    		<tr>
			    			<th>Guidelines</th>
			    		</tr>
			    		<tr>
			    			<td>a. Formulir ini harus dilengkapi dengan benar, akurat, jelas, dan diisikan dengan sebenar-benarnya<br>
			    			a. This form should be filled in correctly, completely, and clearly with actual conditions</td>
			    		</tr>
			    		<tr>
			    			<td>b. Formulir harus dikirimkan kembali kepada Jasindo dengan melampirkan dokumen yang dipersyaratkan dalam polis. Apabila dari daftar dokumen yang dipersyaratkan kurang lengkap, Jasindo berhak untuk meminta dokumen atau informasi tambahan. Pengajuan klaim dengan informasi yang kurang lengkap dapat menunda proses atau mengakibatkan klaim ditolak.<br>
			    			b. This form should be sent together with compulsory documents. If the compulsory documents is not sufficient, we reserve our right to request any additional informations/ documents, as necessary. The submission of an incomplete form or insufficient information or supporting documents may delay the processing or result in the denial of your claim.</td>
			    		</tr>
			    	</table>

			    	<p>&nbsp;</p>

			    	{if $dclaim.no_claim neq null}
			    	<h1>No Klaim: {$dclaim.no_claim} </h1>
			    	{/if}

			    	<table width="100%" border="1" style="padding:5px;" id="customers">
			    		<tr>
			    			<th colspan="4">Data Tertanggung dan Informasi Umum</th>
			    		</tr>
			    		<tr>
			    			<th colspan="4">General Information</th>
			    		</tr>
			    		<tr>
			    			<td width="150">Nama Tertanggung<br>
			    			Name of Insured</td>
			    			<td>
			    				{$data_insured.firstname} {$data_insured.lastname}
			    			</td>
			    			<td width="170">Jenis Kelamin<br>
			    			Sex</td>
			    			<td>
			    				{$data_insured.gender_name}
			    			</td>
			    		</tr>
			    		<tr>
			    			<td>Tanggal Lahir<br>
			    			Date of Birth</td>
			    			<td>
			    				{$data_insured.birthdate}
			    			</td>
			    			<td>No. Ikhtisar Polis	<br>
			    			Schedule Policy No.</td>
			    			<td>

			    				<div class="selector">
			    					{if $dclaim.no_claim neq null}
							    		{$dclaim.policy_no}
							    	{else}
							    		{$cb_polis}
							    	{/if}
			    					
			    				</div>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td>Alamat<br>
			    			Address</td>
			    			<td>
			    				{$data_insured.address}
			    			</td>
			    			<td>No. Telp		<br>
			    			Phone Number.</td>
			    			<td>
			    				{$data_insured.phone_number}
			    			</td>
			    		</tr>
			    		<tr>
			    			<td>Klaim Diajukan Oleh	<br>
			    			Claimant's Name</td>
			    			<td>
			    				<input type="text" name="diajukan_oleh" id="diajukan_oleh" {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}>
			    			</td>
			    			<td>Hubungan Keluarga	<br>
			    			Relationship with Insured.</td>
			    			<td>
			    				<input type="text" name="hub_insured" id="hub_insured" {if $dclaim.hub_insured neq null} value="{$dclaim.hub_insured}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td>Alamat Pemohon Klaim	<br>
			    			Claimant's Address</td>
			    			<td>
			    				<input type="text" name="alamat_pemohon" id="alamat_pemohon" {if $dclaim.alamat_pemohon neq null} value="{$dclaim.alamat_pemohon}" {/if} class="full-width" {$readonly}>
			    			</td>
			    			<td>No. Telp Pemohon Klaim	<br>
			    			Claimant's Phone Number.</td>
			    			<td>
			    				<input type="text" name="notlp_pemohon" id="notlp_pemohon" {if $dclaim.notlp_pemohon neq null} value="{$dclaim.notlp_pemohon}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4">Apakah Anda memiliki polis lain yang melindungi Anda dari kejadian ini? Jika Ya, sebutkan : <br>
			    			Is there any other policy covering you from this incident?, If Yes, please specify :</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4"><input type="text" name="polis_lain" id="polis_lain" {if $dclaim.polis_lain neq null} value="{$dclaim.polis_lain}" {/if} class="full-width" {$readonly}></td>
			    		</tr>
			    		<tr>
			    			<td colspan="4">Informasi untuk metode pembayaran klaim jika klaim disetujui / Information about claim payment method if the claim is eligible : <br></td>
			    		</tr>
			    		<tr>
			    			<td colspan="2">Bank / Bank : </td>
			    			<td colspan="2"><input type="text" name="nama_bank" id="nama_bank" {if $dclaim.nama_bank neq null} value="{$dclaim.nama_bank}" {/if} class="full-width" {$readonly}></td>
			    		</tr>
			    		<tr>
			    			<td colspan="2">No. Rekening / Account Number : </td>
			    			<td colspan="2"><input type="text" name="no_rek" id="no_rek" {if $dclaim.no_rek neq null} value="{$dclaim.no_rek}" {/if} class="full-width" {$readonly}></td>
			    		</tr>
			    		<tr>
			    			<td colspan="2">Nama Pemegang Rekening / Account Holder : </td>
			    			<td colspan="2"><input type="text" name="nama_rek" id="nama_rek" {if $dclaim.nama_rek neq null} value="{$dclaim.nama_rek}" {/if} class="full-width" {$readonly}></td>
			    		</tr>
			    	</table>

			    	<p>&nbsp;</p>
			    	<table width="100%" border="0" style="padding:5px;" id="customers" >
			    		<tr>
			    			<th colspan="4">Jenis Klaim</th>
			    		</tr>
			    		<tr>
			    			<td>
			    				<label><a><input type="radio" name="cb_klaim_type" value="1" {$readonly} {$disabled}> Klaim Medis</span></a></label>
			    			</td>
			    			<td><label>
			    				<a> <input type="radio" name="cb_klaim_type" value="2" {$readonly} {$disabled}> Kecelakaan Diri </span></a></label>
			    			</td>
			    			<td><label>
			    				<a> <input type="radio" name="cb_klaim_type" value="3" {$readonly} {$disabled}> Ketidaknyamanan Perjalanan</span></a></label>
			    			</td>
			    			<td><label>
			    				<a><input type="radio" name="cb_klaim_type" value="4" {$readonly} {$disabled}> Lain-Lain</span></a></label>
			    			</td>
			    		</tr>
			    	</table>

			    	<p>&nbsp;</p>

			    	<div id="klaim_medis" style="display:none;">
			    	<table width="100%" border="1" style="padding:5px;" id="customers">
			    		<tr>
			    			<th colspan="4">Pengajuan Klaim Perlindungan Medis</th>
			    		</tr>
			    		<tr>
			    			<th colspan="4">Medical Coverage</th>
			    		</tr>
			    		<tr>
			    			<td width="150">Tanggal Kejadian<br>
			    			Date of Onset Illness</td>
			    			<td>
			    				<div {if $readonly neq 'readonly'} class="datepicker-wrap" {/if}>
                                  <input {$readonly} type="text" name="medis_tgl_kej" id="medis_tgl_kej" class="input-text full-width" placeholder="select date" {if $dclaim.medis_tgl_kej neq null} value="{$dclaim.medis_tgl_kej}" {/if}/>
                               </div>
			    			</td>
			    			<td width="170">Tempat Kejadian<br>
			    			Place of Onset Illness</td>
			    			<td>
			    				<input type="text" name="medis_tempat_kej" id="medis_tempat_kej"  {if $dclaim.medis_tempat_kej neq null} value="{$dclaim.medis_tempat_kej}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td  colspan="2" width="150">Jenis/Kondisi Kecelakaan/Sakit			<br>
			    			Condition of Illness</td>
			    			<td colspan="2">
			    				<input type="text" name="medis_kondisi" id="medis_kondisi" {if $dclaim.medis_kondisi neq null} value="{$dclaim.medis_kondisi}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td  colspan="2" width="150">Pernahkah Anda mendapatkan perawatan untuk kondisi tersebut? Jika Ya, jelaskan : 			<br>
			    			Have you ever had any prior treatment for this condition?			</td>
			    			<td colspan="2">
			    				<input type="text" name="medis_perawatan" id="medis_perawatan" {if $dclaim.medis_perawatan neq null} value="{$dclaim.medis_perawatan}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="150">Rumah Sakit yang Dikunjungi	<br>
			    			Name of the Hospital	</td>
			    			<td>
			    				<input type="text" name="medis_rs" id="medis_rs" {if $dclaim.medis_rs neq null} value="{$dclaim.medis_rs}" {/if} class="full-width" {$readonly}>
			    			</td>
			    			<td width="170">Dokter yang merawat	<br>
			    			Attending Physician	</td>
			    			<td>
			    				<input type="text" name="medis_dokter" id="medis_dokter"  {if $dclaim.medis_dokter neq null} value="{$dclaim.medis_dokter}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="150">Jenis Perawatan	<br>
			    			Treatment	</td>
			    			<td>
			    				<input type="text" name="medis_jenis_perawatan" id="medis_jenis_perawatan" {if $dclaim.medis_jenis_perawatan neq null} value="{$dclaim.medis_jenis_perawatan}" {/if} class="full-width" {$readonly}>
			    			</td>
			    			<td width="170">Lama Perawatan	<br>
			    			Period of Treatment	</td>
			    			<td>
			    				<input type="text" name="medis_lama_perawatan" id="medis_lama_perawatan"  {if $dclaim.medis_lama_perawatan neq null} value="{$dclaim.medis_lama_perawatan}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td  width="150">Diagnosa Penyakit			<br>
			    			Diagnosis			</td>
			    			<td colspan="3">
			    				<input type="text" name="medis_diagnosa" id="medis_diagnosa" {if $dclaim.medis_diagnosa neq null} value="{$dclaim.medis_diagnosa}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td  width="150">Biaya Rumah Sakit			<br>
			    			Total Hospital Cost						</td>
			    			<td colspan="3">
			    				<input type="text" name="medis_biaya" id="medis_biaya" {if $dclaim.medis_biaya neq null} value="{$dclaim.medis_biaya}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td  width="150" colspan="3">Resume Medis dari dokter yang merawat Tertanggung atau surat keterangan dokter yang diisi lengkap dan rincian biaya rumah sakit</td>
			    			<td>
			    				{if $dclaim.doc_medis_resume neq null}
									<a class="doc_medis_resume" href="{$base_url}/upload/{$dclaim.doc_medis_resume}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
									<p>&nbsp;</p>
								{else}
									Belum ada dokumen yang diunggah
								{/if}
								<input type="file" name="doc_medis_resume">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3"  width="150">Kuitansi asli dan rincian biaya rumah sakit</td>
			    			<td>
			    				{if $dclaim.doc_medis_kuitansi neq null}
									<a class="doc_medis_kuitansi" href="{$base_url}/upload/{$dclaim.doc_medis_kuitansi}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
									<p>&nbsp;</p>
								{else}
									Belum ada dokumen yang diunggah
								{/if}
			    				<input type="file" name="doc_medis_kuitansi">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3"  width="150">Dokumen lainnya, apabila dinyatakan perlu oleh Bagian Klaim Jasindo</td>
			    			<td>
			    				{if $dclaim.doc_medis_dokumen_lain neq null}
									<a class="doc_medis_dokumen_lain" href="{$base_url}/upload/{$dclaim.doc_medis_dokumen_lain}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
									<p>&nbsp;</p>
								{else}
									Belum ada dokumen yang diunggah
								{/if}
			    				<input type="file" name="doc_medis_dokumen_lain">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    	<!-- 	<tr>
			    			<td width="150">Catatan Admin</td>
			    			<td colspan="3"  >
			    				<textarea rows="10" style="width: 100%;" {$readonly_admin} name="doc_medis_admin_note"> {if $dclaim.doc_medis_admin_note neq null}  {$dclaim.doc_medis_admin_note} {/if}</textarea>
			    			</td>
			    		</tr> -->
			    	</table>
			    </div>

			    <div id="klaim_kecelakaan" style="display:none;">
			    	<table width="100%" border="1" style="padding:5px;" id="customers">
			    		<tr>
			    			<th colspan="4">Pengajuan Klaim Kecelakaan Diri </th>
			    		</tr>
			    		<tr>
			    			<th colspan="4">Personal Accident</th>
			    		</tr>
			    		<tr>
			    			<td width="150">Tanggal Kejadian<br>
			    			Date of Accident</td>
			    			<td>
			    				<div  {if $readonly neq 'readonly'} class="datepicker-wrap" {/if}>
								  <input {$readonly} type="text" name="kecel_tgl_kejadian" id="kecel_tgl_kejadian"  class="input-text full-width" placeholder="select date" {if $dclaim.kecel_tgl_kejadian neq null} value="{$dclaim.kecel_tgl_kejadian}" {/if}/>
								</div>
			    			</td>
			    			<td width="170">Tempat Kejadian	<br>
			    			Place of Accident</td>
			    			<td>
			    				<input type="text" name="kecel_tempat" id="kecel_tempat"  {if $dclaim.kecel_tempat neq null} value="{$dclaim.kecel_tempat}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="150" colspan="4">Bagaimana kronologis Kejadian Kecelakaan			<br>
			    			How did the Accident Happen?</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4">
			    				<textarea {$readonly} type="text" name="kecel_kronologis" id="kecel_kronologis" {if $dclaim.kecel_kronologis neq null} value="{$dclaim.kecel_kronologis}" {/if} class="full-width" rows="5">{if $dclaim.kecel_kronologis neq null} {$dclaim.kecel_kronologis} {/if}</textarea>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td  colspan="2" width="150">Penyebab Luka Tubuh / Meninggal Dunia			<br>
			    			Cause of Injury/Death			</td>
			    			<td colspan="2">
			    				<input type="text" name="kecel_penyebab" id="kecel_penyebab" {if $dclaim.kecel_penyebab neq null} value="{$dclaim.kecel_penyebab}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="150">Rumah Sakit yang Dikunjungi	<br>
			    			Name of the Hospital	</td>
			    			<td>
			    				<input type="text" name="kecel_rs" id="kecel_rs" {if $dclaim.kecel_rs neq null} value="{$dclaim.kecel_rs}" {/if} class="full-width" {$readonly}>
			    			</td>
			    			<td width="170">Dokter yang merawat	<br>
			    			Attending Physician	</td>
			    			<td>
			    				<input type="text" name="kecel_dokter" id="kecel_dokter"  {if $dclaim.kecel_dokter neq null} value="{$dclaim.kecel_dokter}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td  width="150" colspan="3">Dalam hal terjadinya kecelakaan: laporan kejadian dari kepolisisan atau instansi yang berwenang</td>
			    			<td>
			    					{if $dclaim.doc_kecelakaan_laporan neq null}
										<a class="doc_kecelakaan_laporan" href="{$base_url}/upload/{$dclaim.doc_kecelakaan_laporan}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
										<p>&nbsp;</p>
									{else}
										Belum ada dokumen yang diunggah
									{/if}
			    				<input type="file" name="doc_kecelakaan_laporan">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3"  width="150">Resume medis dan penyataan Dokter perihal cacat permanen yang dialami</td>
			    			<td>
			    				{if $dclaim.doc_kecelakaan_resume neq null}
										<a class="doc_kecelakaan_resume" href="{$base_url}/upload/{$dclaim.doc_kecelakaan_resume}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
										<p>&nbsp;</p>
									{else}
										Belum ada dokumen yang diunggah
									{/if}

			    				<input type="file" name="doc_kecelakaan_resume">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3"  width="150">Dalam hal tertanggung meninggal dunia: Surat Keterangan atau Sertifikat Kematian dari Pemerintah atau Lembaga yang berwenang.</td>
			    			<td>
			    				{if $dclaim.doc_kecelakaan_surat neq null}
										<a class="doc_kecelakaan_surat" href="{$base_url}/upload/{$dclaim.doc_kecelakaan_surat}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
										<p>&nbsp;</p>
									{else}
										Belum ada dokumen yang diunggah
									{/if}

			    				<input type="file" name="doc_kecelakaan_surat">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3"  width="150">Dalam hal pengajuan klaim Tunjangan Pendidikan Anak: Kartu Keluarga dan/atau Surat Keterangan Institusi Pendidikan, Institusi dimana anak sah dari Tertanggung menuntut ilmu.</td>
			    			<td>
			    				{if $dclaim.doc_kecelakaan_kk neq null}
										<a class="doc_kecelakaan_kk" href="{$base_url}/upload/{$dclaim.doc_kecelakaan_kk}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
										<p>&nbsp;</p>
									{else}
										Belum ada dokumen yang diunggah
									{/if}
			    				<input type="file" name="doc_kecelakaan_kk">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3"  width="150">Foto copy Sertifikat Polis/Schedule Polis dan fotocopy identitas Tertanggung (KTP/SIM/Paspor)</td>
			    			<td>
			    				{if $dclaim.doc_kecelakaan_fotocopy neq null}
										<a class="doc_kecelakaan_fotocopy" href="{$base_url}/upload/{$dclaim.doc_kecelakaan_fotocopy}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
										<p>&nbsp;</p>
									{else}
										Belum ada dokumen yang diunggah
									{/if}

			    				<input type="file" name="doc_kecelakaan_fotocopy">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3"  width="150">Dokumen lainnya, apabila dinyatakan perlu oleh Bagian Klaim Jasindo.</td>
			    			<td>
			    				{if $dclaim.doc_kecelakaan_lainnya neq null}
										<a class="doc_kecelakaan_lainnya" href="{$base_url}/upload/{$dclaim.doc_kecelakaan_lainnya}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
										<p>&nbsp;</p>
									{else}
										Belum ada dokumen yang diunggah
									{/if}

			    				<input type="file" name="doc_kecelakaan_lainnya">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4"  width="150">Catatan: Untuk Manfaat Kecelakaan Diri, bentuk dokumen yang harus diserahkan adalah dokumen Asli/Copy Legalisir/Scan dokumen berwarna</td>
			    		</tr>
			    	<!-- 	<tr>
			    			<td width="150">Catatan Admin</td>
			    			<td colspan="3"  >
			    				<textarea rows="10" style="width: 100%;" {$readonly_admin} name="doc_kecelakaan_admin_note">{if $dclaim.doc_kecelakaan_admin_note neq null} {$dclaim.doc_kecelakaan_admin_note} {/if}</textarea>
			    			</td>
			    		</tr> -->
			    	</table>
			    </div>

			    <div id="klaim_kenyamanan" style="display:none;">
			    	<table width="100%" border="1" style="padding:5px;" id="customers">
			    		<tr>
			    			<th colspan="4">Pengajuan Klaim Ketidaknyamanan Perjalanan</th>
			    		</tr>
			    		<tr>
			    			<th colspan="4">Travel Inconvenience</th>
			    		</tr>
			    		<tr>
			    			<td colspan="4" style="background-color:#4485ed; color:#FFF;">
			    				Penundaan Perjalanan  / Travel Delay</td>
			    		</tr>
			    		<tr>
			    			<td width="150">Detil Penerbangan	<br>
			    			Flight Detail	</td>
			    			<td>
			    				<input type="text" name="nyaman_tripdelay_penerbangan" id="nyaman_tripdelay_penerbangan" {if $dclaim.nyaman_tripdelay_penerbangan neq null} value="{$dclaim.nyaman_tripdelay_penerbangan}" {/if} class="full-width" {$readonly}>
			    			</td>
			    			<td width="170">Tanggal Kejadian	<br>
			    			Date	</td>
			    			<td>
			    				<div {if $readonly neq 'readonly'} class="datepicker-wrap" {/if}>
                                  <input {$readonly} type="text" name="nyaman_tripdelay_tgl_kejadian" id="nyaman_tripdelay_tgl_kejadian" class="input-text full-width" placeholder="select date" {if $dclaim.nyaman_tripdelay_tgl_kejadian neq null} value="{$dclaim.nyaman_tripdelay_tgl_kejadian}" {/if}/>
                               </div>

			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="150">Waktu Keberangkatan Awal	<br>
			    			Time Departure	</td>
			    			<td>
			    				<input type="text" name="nyaman_tripdelay_waktu_berangkat" id="nyaman_tripdelay_waktu_berangkat" {if $dclaim.nyaman_tripdelay_waktu_berangkat neq null} value="{$dclaim.nyaman_tripdelay_waktu_berangkat}" {/if} class="full-width" {$readonly}>
			    			</td>
			    			<td width="170">Lama Penundaan	<br>
			    			Lama Penundaan		</td>
			    			<td>
			    				<input type="text" name="nyaman_tripdelay_penundaan" id="nyaman_tripdelay_penundaan"  {if $dclaim.nyaman_tripdelay_penundaan neq null} value="{$dclaim.nyaman_tripdelay_penundaan}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="150" colspan="4">Kronologis Penundaan			<br>
			    			Detail Chronology</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4">
			    				<textarea {$readonly} type="text" name="nyaman_tripdelay_kronologis" id="nyaman_tripdelay_kronologis" {if $dclaim.nyaman_tripdelay_kronologis neq null} value="{$dclaim.nyaman_tripdelay_kronologis}" {/if} class="full-width" rows="5">{if $dclaim.nyaman_tripdelay_kronologis neq null} {$dclaim.nyaman_tripdelay_kronologis} {/if}</textarea>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="170" colspan="2">Apakah anda telah mendapatkan penggantian atas penundaan/biaya hotel/biaya perjalanan pengganti karena penundaan perjalanan?, Jika Ya, mohon jelaskan :			<br>
			    			Do you have get any compensation due to travel delay/accomodation cost/Costs of Alternative Travel? Please explain : 			</td>
			    			<td colspan="2">
			    				<input type="text" name="nyaman_tripdelay_kompensasi" id="nyaman_tripdelay_kompensasi"  {if $dclaim.nyaman_tripdelay_kompensasi neq null} value="{$dclaim.nyaman_tripdelay_kompensasi}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4" style="background-color:#4485ed; color:#FFF;">Penundaan Bagasi / Baggage Delay</td>
			    		</tr>
			    		<tr>
			    			<td colspan="2" style="background-color:#b9d1f7; color:#000; text-align:center;">Informasi Penerbangan Awal/Flight Detail	</td>
			    			<td colspan="2" style="background-color:#b9d1f7; color:#000; text-align:center;">Informasi Penundaan Bagasi/Delay Baggage	</td>
			    		</tr>
			    		<tr>
			    			<td width="150">Tanggal Kejadian	<br>
			    			Date	</td>
			    			<td>
			    				<div  {if $readonly neq 'readonly'} class="datepicker-wrap" {/if}>
								  <input {$readonly} type="text"  name="nyaman_bagdelay_tgl_awal" id="nyaman_bagdelay_tgl_awal" class="input-text full-width" placeholder="select date" {if $dclaim.nyaman_bagdelay_tgl_awal neq null} value="{$dclaim.nyaman_bagdelay_tgl_awal}" {/if}/>
								</div>
			    			</td>
			    			<td width="170">Tanggal Kejadian		<br>
			    			Date			</td>
			    			<td>
			    				<div  {if $readonly neq 'readonly'} class="datepicker-wrap" {/if}>
								  <input {$readonly} type="text"  name="nyaman_bagdelay_tgl_akhir" id="nyaman_bagdelay_tgl_akhir" class="input-text full-width" placeholder="select date" {if $dclaim.nyaman_bagdelay_tgl_akhir neq null} value="{$dclaim.nyaman_bagdelay_tgl_akhir}" {/if}/>
								</div>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="150">Tanggal Kedatangan Tertanggung		<br>
			    			Arrival Date		</td>
			    			<td>
			    				<input type="text" name="nyaman_bagdelay_tgldatang_awal" id="nyaman_bagdelay_tgldatang_awal" {if $dclaim.nyaman_bagdelay_tgldatang_awal neq null} value="{$dclaim.nyaman_bagdelay_tgldatang_awal}" {/if} class="full-width" {$readonly}>
			    			</td>
			    			<td width="170">Tanggal Kedatangan Bagasi		<br>
			    			Date				</td>
			    			<td>
			    				<input type="text" name="nyaman_bagdelay_tgldatang_akhir" id="nyaman_bagdelay_tgldatang_akhir"  {if $dclaim.nyaman_bagdelay_tgldatang_akhir neq null} value="{$dclaim.nyaman_bagdelay_tgldatang_akhir}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="150">Jam Kedatangan Penerbangan Tertanggung	<br>
			    			Arrival Time		</td>
			    			<td>
			    				<input type="text" name="nyaman_bagdelay_jamdatang_awal" id="nyaman_bagdelay_jamdatang_awal" {if $dclaim.nyaman_bagdelay_jamdatang_awal neq null} value="{$dclaim.nyaman_bagdelay_jamdatang_awal}" {/if} class="full-width" {$readonly}>
			    			</td>
			    			<td width="170">Jam Kedatangan Bagasi		<br>
			    			Time					</td>
			    			<td>
			    				<input type="text" name="nyaman_bagdelay_jamdatang_akhir" id="nyaman_bagdelay_jamdatang_akhir"  {if $dclaim.nyaman_bagdelay_jamdatang_akhir neq null} value="{$dclaim.nyaman_bagdelay_jamdatang_akhir}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="150">Lokasi Keberangkatan		<br>
			    			Place of Departure		</td>
			    			<td>
			    				<input type="text" name="nyaman_bagdelay_lokasi_barangkat" id="nyaman_bagdelay_lokasi_barangkat" {if $dclaim.nyaman_bagdelay_lokasi_barangkat neq null} value="{$dclaim.nyaman_bagdelay_lokasi_barangkat}" {/if} class="full-width" {$readonly}>
			    			</td>
			    			<td width="170">Lama Penundaan Bagasi		<br>
			    			Time						</td>
			    			<td>
			    				<input type="text" name="nyaman_bagdelay_lama_delay" id="nyaman_bagdelay_lama_delay"  {if $dclaim.nyaman_bagdelay_lama_delay neq null} value="{$dclaim.nyaman_bagdelay_lama_delay}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="150">Tujuan Perjalanan		<br>
			    			Destination		</td>
			    			<td>
			    				<input type="text" name="nyaman_bagdelay_destinasi" id="nyaman_bagdelay_destinasi" {if $dclaim.nyaman_bagdelay_destinasi neq null} value="{$dclaim.nyaman_bagdelay_destinasi}" {/if} class="full-width" {$readonly}>
			    			</td>
			    			<td width="170">Alasan Penundaan Bagasi		<br>
			    			Reasons for Delay							</td>
			    			<td>
			    				<input type="text" name="nyaman_bagdelay_alasan_delay" id="nyaman_bagdelay_alasan_delay"  {if $dclaim.nyaman_bagdelay_alasan_delay neq null} value="{$dclaim.nyaman_bagdelay_alasan_delay}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="150">Nomor & Maskapai Penerbangan		<br>
			    			Flight No.			</td>
			    			<td>
			    				<input type="text" name="nyaman_bagdelay_noflight_awal" id="nyaman_bagdelay_noflight_awal" {if $dclaim.nyaman_bagdelay_noflight_awal neq null} value="{$dclaim.nyaman_bagdelay_noflight_awal}" {/if} class="full-width" {$readonly}>
			    			</td>
			    			<td width="170">Nomor & Maskapai Penerbangan	<br>
			    			Flight No.					</td>
			    			<td>
			    				<input type="text" name="nyaman_bagdelay_noflight_akhir" id="nyaman_bagdelay_noflight_akhir"  {if $dclaim.nyaman_bagdelay_noflight_akhir neq null} value="{$dclaim.nyaman_bagdelay_noflight_akhir}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="150" colspan="4">Kronologis Penundaan Bagasi			<br>
			    			Detail Chronology			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4">
			    				<textarea {$readonly} type="text" name="nyaman_bagdelay_kronologis" id="nyaman_bagdelay_kronologis" {if $dclaim.nyaman_bagdelay_kronologis neq null} value="{$dclaim.nyaman_bagdelay_kronologis}" {/if} class="full-width" rows="5">{if $dclaim.nyaman_bagdelay_kronologis neq null} {$dclaim.nyaman_bagdelay_kronologis} {/if}</textarea>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4" style="background-color:#4485ed; color:#FFF;">Pembatalan Perjalanan,  Pengurangan Perjalanan, Kehilangan Transportasi Lanjutan</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4" style="background-color:#4485ed; color:#FFF;">Trip Cancellation, Early Return Home, Flight Misconnection			</td>
			    		</tr>
			    		<tr>
			    			<td width="150">Tanggal Pemesanan		<br>
			    			Booking Date			</td>
			    			<td>
			    				<div  {if $readonly neq 'readonly'} class="datepicker-wrap" {/if}>
								  <input {$readonly} type="text" name="nyaman_cancel_bookdate" id="nyaman_cancel_bookdate" class="input-text full-width" placeholder="select date" {if $dclaim.nyaman_cancel_bookdate neq null} value="{$dclaim.nyaman_cancel_bookdate}" {/if}/>
								</div>
			    			</td>
			    			<td width="170">Rencana Tanggal Keberangkatan		<br>
			    			Intended Departure Date					</td>
			    			<td>
			    				<div  {if $readonly neq 'readonly'} class="datepicker-wrap" {/if}>
								  <input {$readonly} type="text" name="nyaman_cancel_intent_depart_date" id="nyaman_cancel_intent_depart_date" class="input-text full-width" placeholder="select date" {if $dclaim.nyaman_cancel_intent_depart_date neq null} value="{$dclaim.nyaman_cancel_intent_depart_date}" {/if}/>
								</div>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="150">Tanggal Kejadian		<br>
			    			Date of Incident		</td>
			    			<td>
			    				<div  {if $readonly neq 'readonly'} class="datepicker-wrap" {/if}>
								  <input {$readonly} type="text" name="nyaman_cancel_accdate" id="nyaman_cancel_accdate" class="input-text full-width" placeholder="select date" {if $dclaim.nyaman_cancel_accdate neq null} value="{$dclaim.nyaman_cancel_accdate}" {/if}/>
								</div>
			    			</td>
			    			<td width="170">Rencana Tanggal Kepulangan		<br>
			    			Intended Return Date					</td>
			    			<td>
			    				<div {if $readonly neq 'readonly'} class="datepicker-wrap" {/if}>
								  <input type="text" name="nyaman_cancel_intent_back_date" id="nyaman_cancel_intent_back_date" class="input-text full-width" placeholder="select date" {if $dclaim.nyaman_cancel_intent_back_date neq null} value="{$dclaim.nyaman_cancel_intent_back_date}" {/if}/>
								</div>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="150" colspan="1">Kronologis  & Alasan					<br>
			    			Detail Chronology						</td>
			    			<td colspan="3">
			    				<input type="text" name="nyaman_cancel_kronologis" id="nyaman_cancel_kronologis" {if $dclaim.nyaman_cancel_kronologis neq null} value="{$dclaim.nyaman_cancel_kronologis}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    			<tr>
			    			<td width="150">Jumlah pembayaran yang telah dilakukan di muka	<br>
			    			Amount paid in advance	</td>
			    			<td>
			    				<input type="text" name="nyaman_cancel_terbayar" id="nyaman_cancel_terbayar" {if $dclaim.nyaman_cancel_terbayar neq null} value="{$dclaim.nyaman_cancel_terbayar}" {/if} class="full-width" {$readonly}>
			    			</td>
			    			<td width="170">Jumlah uang yang di klaim	<br>
			    			Amount Claimed			</td>
			    			<td>
			    				<input type="text" name="nyaman_cancel_bayar_klaim" id="nyaman_cancel_bayar_klaim"  {if $dclaim.nyaman_cancel_bayar_klaim neq null} value="{$dclaim.nyaman_cancel_bayar_klaim}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>


			    		<tr>
			    			<td colspan="4" style="background-color:#4485ed; color:#FFF;">Perlindungan Bagasi / Kehilangan Uang dan Dokumen			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4" style="background-color:#4485ed; color:#FFF;">Baggage Protection / Lost of Personal Money & Documents			</td>
			    		</tr>
			    		<tr>
			    			<td width="150">Tanggal Kejadian		<br>
			    			Date of Incident		</td>
			    			<td>
			    				<div {if $readonly neq 'readonly'} class="datepicker-wrap" {/if}>
								  <input {$readonly} type="text" name="nyaman_baglost_date_accident" id="nyaman_baglost_date_accident" class="input-text full-width" placeholder="select date" {if $dclaim.nyaman_baglost_date_accident neq null} value="{$dclaim.nyaman_baglost_date_accident}" {/if}/>
								</div>
			    			</td>
			    			<td width="170">Waktu & Tempat Kejadian		<br>
			    			Place & Time of Incident					</td>
			    			<td>
			    				<input type="text" name="nyaman_baglost_timeplace" id="nyaman_baglost_timeplace"  {if $dclaim.nyaman_baglost_timeplace neq null} value="{$dclaim.nyaman_baglost_timeplace}" {/if} class="full-width" {$readonly}>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td width="150">Kepada siapa Tertanggung melapor?	<br>
			    			To whom did you report the loss?	</td>
			    			<td>
			    				<input type="text" name="nyaman_baglost_reportto" id="nyaman_baglost_reportto" {if $dclaim.nyaman_baglost_reportto neq null} value="{$dclaim.nyaman_baglost_reportto}" {/if} class="full-width" {$readonly}>
			    			</td>
			    			<td width="170">Tanggal laporan		<br>
			    			Date Reported				</td>
			    			<td>
			    				<div {if $readonly neq 'readonly'} class="datepicker-wrap" {/if}>
								  <input {$readonly}  {$readonly} type="text" name="nyaman_baglost_date_report" id="nyaman_baglost_date_report" class="input-text full-width" placeholder="select date" {if $dclaim.nyaman_baglost_date_report neq null} value="{$dclaim.nyaman_baglost_date_report}" {/if}/>
								</div>
			    			</td>
			    		</tr>

			    		
			    	</table>
			   

			    	<table width="100%" border="1" style="padding:5px;" id="customers">
			    		<tr>
			    			<td width="25%"><center>Daftar Barang yang di Klaim<br>Detail of Loss Item</td>
			    			<td width="25%"><center>Jumlah<br>Qty</td>
		    				<td width="25%"><center>Harga Pembelian<br>Price of Purchase</td>
	    					<td width="25%"><center>Tanggal dan Tempat Pembelian<br>Date & Place of Purchase</td>
			    		</tr>
    		 {if $dclaim_item eq true}

	    		{foreach $dclaim_item as $v}
		    		<tr>
		    			<td width="25%"><input type="text" name="item_name[]" id="item_name"  value="{$v.item_name}"  class="full-width" {$readonly}></td>
		    			<td width="25%"><input type="text" name="qty_lost[]" id="dsdsad" value="{$v.qty_lost}" class="full-width" {$readonly}></td>
	    				<td width="25%"><input type="text" name="price_purchase[]" id="dsdsad" value="{$v.price_purchase}"class="full-width" {$readonly}></td>
						<td width="25%"><input type="text" name="date_place_purchase[]" id="dsdsad" value="{$v.date_place_purchase}" class="full-width" {$readonly}></td>
		    		</tr>
	    		{/foreach}
    		
    		{else}
    					<tr>
			    			<td width="25%"><input type="text" name="item_name[]" id="item_name"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
			    			<td width="25%"><input type="text" name="qty_lost[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
		    				<td width="25%"><input type="text" name="price_purchase[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
	    					<td width="25%"><input type="text" name="date_place_purchase[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
			    		</tr>
			    		<tr>
			    			<td width="25%"><input type="text" name="item_name[]" id="item_name"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
			    			<td width="25%"><input type="text" name="qty_lost[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
		    				<td width="25%"><input type="text" name="price_purchase[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
	    					<td width="25%"><input type="text" name="date_place_purchase[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
			    		</tr>
			    		<tr>
			    			<td width="25%"><input type="text" name="item_name[]" id="item_name"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
			    			<td width="25%"><input type="text" name="qty_lost[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
		    				<td width="25%"><input type="text" name="price_purchase[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
	    					<td width="25%"><input type="text" name="date_place_purchase[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
			    		</tr>
			    		<tr>
			    			<td width="25%"><input type="text" name="item_name[]" id="item_name"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
			    			<td width="25%"><input type="text" name="qty_lost[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
		    				<td width="25%"><input type="text" name="price_purchase[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
	    					<td width="25%"><input type="text" name="date_place_purchase[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
			    		</tr>
			    		<tr>
			    			<td width="25%"><input type="text" name="item_name[]" id="item_name"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
			    			<td width="25%"><input type="text" name="qty_lost[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
		    				<td width="25%"><input type="text" name="price_purchase[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
	    					<td width="25%"><input type="text" name="date_place_purchase[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
			    		</tr>
			    		<tr>
			    			<td width="25%"><input type="text" name="item_name[]" id="item_name"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
			    			<td width="25%"><input type="text" name="qty_lost[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
		    				<td width="25%"><input type="text" name="price_purchase[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
	    					<td width="25%"><input type="text" name="date_place_purchase[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
			    		</tr>
			    		<tr>
			    			<td width="25%"><input type="text" name="item_name[]" id="item_name"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
			    			<td width="25%"><input type="text" name="qty_lost[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
		    				<td width="25%"><input type="text" name="price_purchase[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
	    					<td width="25%"><input type="text" name="date_place_purchase[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
			    		</tr>
			    		<tr>
			    			<td width="25%"><input type="text" name="item_name[]" id="item_name"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
			    			<td width="25%"><input type="text" name="qty_lost[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
		    				<td width="25%"><input type="text" name="price_purchase[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
	    					<td width="25%"><input type="text" name="date_place_purchase[]" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td>
			    		</tr>
    		{/if}

			    		
			    	<!-- 	<tr>
			    			<td><center><b>Jumlah</b></center></td>
			    			<td width="25%"> </td>
		    				<td width="25%"> </td>
	    					<td width="25%"> </td>
			    		</tr> -->
			    		<tr>
			    			<td width="150" colspan="4">Kronologis Kehilangan/Kerusakan Barang 			<br>
			    			Detail Chronology			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4">
			    				<textarea {$readonly} type="text" name="cronology_lost_item" id="cronology_lost_item" {if $dclaim.cronology_lost_item neq null} value="{$dclaim.cronology_lost_item}" {/if} class="full-width" rows="5">{if $dclaim.cronology_lost_item neq null} {$dclaim.cronology_lost_item} {/if}</textarea>
			    			</td>
			    		</tr>

			    		<tr>
			    			<td  width="150" colspan="3">Kuitansi asli pembelian tiket pesawat/tiket kereta api/tiket kapal laut/tiket pesawat/boarding pass</td>
			    			<td>
			    				{if $dclaim.doc_kenyamanan_kuitansi neq null}
									<a class="doc_kenyamanan_kuitansi" href="{$base_url}/upload/{$dclaim.doc_kenyamanan_kuitansi}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
									<p>&nbsp;</p>
								{else}
									Belum ada dokumen yang diunggah
									<p>&nbsp;</p>
								{/if}
			    				<input type="file" name="doc_kenyamanan_kuitansi">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3"  width="150">Dalam hal klaim perlindungan bagasi atau kehilangan uang/dokumen perjalanan: Laporan kehilangan, pencurian atau tidak kekerasan dari pihak berwenang; laporan ketidakteraturan harta benda dari maskapai penerbangan, penyedia angkutan kapal laut atau kereta api</td>
			    			<td>
			    				{if $dclaim.doc_kenyamanan_laporan neq null}
									<a class="doc_kenyamanan_laporan" href="{$base_url}/upload/{$dclaim.doc_kenyamanan_laporan}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
									<p>&nbsp;</p>
								{else}
									Belum ada dokumen yang diunggah
									<p>&nbsp;</p>
								{/if}
			    				<input type="file" name="doc_kenyamanan_laporan">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3"  width="150">Dalam hal penundaan perjalanan: Konfirmasi tertulis dari maskapai penerbangan; penyediaan angkutan kapal laut atau kereta api, perihal lama dan alasan penundaan, atau ada atau tidaknya transportasi pengganti yang memungkinkan, kuitansi asli atasu biaya hotel atau biaya transportasi pengganti.</td>
			    			<td>
			    				{if $dclaim.doc_kenyamanan_konfirmasi1 neq null}
									<a class="doc_kenyamanan_konfirmasi1" href="{$base_url}/upload/{$dclaim.doc_kenyamanan_konfirmasi1}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
									<p>&nbsp;</p>
								{else}
									Belum ada dokumen yang diunggah
									<p>&nbsp;</p>
								{/if}
			    				<input type="file" name="doc_kenyamanan_konfirmasi1">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3"  width="150">Dalam hal kehilangan transportasi lanjutan : Konfirmasi tertulis dari maskapai penerbangan, penyedia angkutan kapal laut atau kereta api, bahwa karena penundaan kedatangan transportasi awal mengakibatkan tertanggung kehilangan alat transportasi lanjutannya.</td>
			    			<td>
			    				{if $dclaim.doc_kenyamanan_konfirmasi2 neq null}
									<a class="doc_kenyamanan_konfirmasi2" href="{$base_url}/upload/{$dclaim.doc_kenyamanan_konfirmasi2}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
									<p>&nbsp;</p>
								{else}
									Belum ada dokumen yang diunggah
									<p>&nbsp;</p>
								{/if}
			    				<input type="file" name="doc_kenyamanan_konfirmasi2">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3"  width="150">Dalam hal pembatalan perjalanan atau pengurangan perjalanan : Surat Kematingan atau surat keterangan kejadian bencana alam atau kejadian yang tidak terduga dari berwenang atau surat Keterangan Medis/Resume Medis dari Dokter yang memeriksa tertanggung perihal ketidaklayakan tertanggung untuk melakukan perjalanan.</td>
			    			<td>
			    				{if $dclaim.doc_kenyamanan_kematian neq null}
									<a class="doc_kenyamanan_kematian" href="{$base_url}/upload/{$dclaim.doc_kenyamanan_kematian}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
									<p>&nbsp;</p>
								{else}
									Belum ada dokumen yang diunggah
									<p>&nbsp;</p>
								{/if}
			    				<input type="file" name="doc_kenyamanan_kematian">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3"  width="150">Dalam hal klaim kehilangan isi rumah karena pencurian : Surat Keterangan mengenai peristiwa pencurian/kebongkaran dari pejabatan setempat yang berwenangan.</td>
			    			<td>
			    				{if $dclaim.doc_kenyamanan_keterangan neq null}
									<a class="doc_kenyamanan_keterangan" href="{$base_url}/upload/{$dclaim.doc_kenyamanan_keterangan}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
									<p>&nbsp;</p>
								{else}
									Belum ada dokumen yang diunggah
									<p>&nbsp;</p>
								{/if}
			    				<input type="file" name="doc_kenyamanan_keterangan">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3"  width="150">Dokumen lainnya, apabila dinyatakan perlu oleh Bagian Klaim Jasindo.</td>
			    			<td>
			    				{if $dclaim.doc_kenyamanan_lainnya neq null}
									<a class="doc_kenyamanan_lainnya" href="{$base_url}/upload/{$dclaim.doc_kenyamanan_lainnya}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
									<p>&nbsp;</p>
								{else}
									Belum ada dokumen yang diunggah
									<p>&nbsp;</p>
								{/if}
			    				<input type="file" name="doc_kenyamanan_lainnya">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<!-- <tr>
			    			<td width="150">Catatan Admin</td>
			    			<td colspan="3"  >
			    				<textarea rows="10" style="width: 100%;" {$readonly_admin} name="doc_kenyamanan_admin_note">{if $dclaim.doc_kenyamanan_admin_note neq null} {$dclaim.doc_kenyamanan_admin_note} {/if}</textarea>
			    			</td>
			    		</tr> -->
			    	</table>
			    </div>

			    <div id="klaim_lain" style="display:none;">
			    	<table width="100%" border="1" style="padding:5px;" id="customers">
			    		<tr>
			    			<th colspan="4">Pengajuan Klaim Lain-Lain			</th>
			    		</tr>
			    		<tr>
			    			<th colspan="4">Others			</th>
			    		</tr>
			    		<tr>
			    			<td colspan="4" style="background-color:#4485ed; color:#FFF;">Untuk pengajuan klaim yang tidak ada dalam daftar ini, mohon untuk menjelaskan detil klaim yang Anda ajukan : 			/ <br>
			    			If there is any other claim which does not include the sections stated above, please provide details of the claim you are submitting</td>
			    		</tr>
			    		<tr>
			    			<td width="150" colspan="1">Mengajukan klaim atas 			<br>
			    			Submitting Claim of		</td>
			    			<td colspan="3"><input type="text" name="lain_atas_nama" id="lain_atas_nama" {if $dclaim.lain_atas_nama neq null} value="{$dclaim.lain_atas_nama}" {/if} class="full-width" {$readonly}></td>
			    			<!-- <td width="170">Tempat Kejadian	<br>Place of Incident	</td> -->
			    			<!-- <td><input type="text" name="dsdsad" id="dsdsad"  {if $dclaim.diajukan_oleh neq null} value="{$dclaim.diajukan_oleh}" {/if} class="full-width" {$readonly}></td> -->
			    		</tr>
			    		<tr>
			    			<td width="150">Tanggal Kejadian 	<br>Date of Incident	</td>
			    			<td>
			    				<div {if $readonly neq 'readonly'} class="datepicker-wrap" {/if}>
								  <input {$readonly} type="text" name="lain_date_accident" id="lain_date_accident" class="input-text full-width" placeholder="select date" {if $dclaim.lain_date_accident neq null} value="{$dclaim.lain_date_accident}" {/if}/>
								</div>
			    			</td>
			    			<td width="170">Tempat Kejadian	<br>Place of Incident	</td>
			    			<td><input type="text" name="lain_place_accident" id="lain_place_accident"  {if $dclaim.lain_place_accident neq null} value="{$dclaim.lain_place_accident}" {/if} class="full-width" {$readonly}></td>
			    		</tr>
			    		<tr>
			    			<td width="150" colspan="4">Kronologis Kehilangan/Kerusakan Barang 			<br>
			    			Detail Chronology			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4">
			    				<textarea {$readonly} type="text" name="lain_cronology" id="lain_cronology" {if $dclaim.lain_cronology neq null} value="{$dclaim.lain_cronology}" {/if} class="full-width" rows="5">{if $dclaim.lain_cronology neq null} {$dclaim.lain_cronology} {/if}</textarea>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td  width="150" colspan="3">Tanggung Jawab Pribadi: Laporan kerusakan, kerugian atau kehilangan atas barang atau harta benda pihak ketiga dari kepolisian yang berwenanang; Surat tuntutan dari pihak ketiga kepada Tertanggung, surat keputusan pengadilan yang menyatakan bahwa tertanggung bertanggung jawab</td>
			    			<td>
			    				{if $dclaim.doc_lainnya_laporan neq null}
			    					<a class="doc_lainnya_laporan" href="{$base_url}/upload/{$dclaim.doc_lainnya_laporan}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
			    					<p>&nbsp;</p>
			    				{else}
			    					Belum ada dokumen yang diunggah
			    				{/if}
			    				<input type="file" name="doc_lainnya_laporan">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3"  width="150">Perpanjangan Polis otomatis: Surat Keterangan Medis/Resume Medis dari Dokter yang memeriksa Tertanggung perihal ketidaklayakan Tertanggung untuk kembali ke Indonesia karena sakit atau cidera yang diderita Tertanggung.</td>
			    			<td>
			    				{if $dclaim.doc_lainnya_keterangan neq null}
			    					<a class="doc_lainnya_keterangan" href="{$base_url}/upload/{$dclaim.doc_lainnya_keterangan}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
			    					<p>&nbsp;</p>
			    				{else}
			    					Belum ada dokumen yang diunggah
			    				{/if}
			    				<input type="file" name="doc_lainnya_keterangan">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3"  width="150">Biaya Sendiri atau Mobil Sewaan: Copy Polis asuransi komprehensif, Kuitansi pembayaran resiko sendiri.</td>
			    			<td>
			    				{if $dclaim.doc_lainnya_copy neq null}
			    					<a class="doc_lainnya_copy" href="{$base_url}/upload/{$dclaim.doc_lainnya_copy}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
			    					<p>&nbsp;</p>
			    				{else}
			    					Belum ada dokumen yang diunggah
			    				{/if}
			    				<input type="file" name="doc_lainnya_copy">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3"  width="150">Dokumen lainnya, apabila dinyatakan perlu oleh Bagian Klaim Jasindo</td>
			    			<td>
			    				{if $dclaim.doc_lainnya_lainnya neq null}
			    					<a class="doc_lainnya_lainnya" href="{$base_url}/upload/{$dclaim.doc_lainnya_lainnya}"><button class=" btn-small full-width yellow">Lihat Dokumen</button></a>
			    					<p>&nbsp;</p>
			    				{else}
			    					Belum ada dokumen yang diunggah
			    				{/if}
			    				<input type="file" name="doc_lainnya_lainnya">
			    				<small>Ukuran file yang diperbolehkan maksimal 1.2 Mb dan dimensi maksimal sebesar 1024 x 768. Jenis dokumen: gif, jpg, jpeg, png dan bmp<small>
			    			</td>
			    		</tr>
			    	<!-- 	<tr>
			    			<td width="150">Catatan Admin</td>
			    			<td colspan="3"  >
			    				<textarea rows="10" style="width: 100%;" {$readonly_admin} name="doc_lainnya_admin_note">{if $dclaim.doc_lainnya_admin_note neq null} {$dclaim.doc_lainnya_admin_note} {/if}</textarea>
			    			</td>
			    		</tr> -->
			    	</table>
			    </div>

			    <p>&nbsp;</p>
			    	<table width="100%" border="1" style="padding:5px;" id="customers">
			    		<tr>
			    			<th colspan="4">Pernyataan dan Pemberian Kuasa			</th>
			    		</tr>
			    		<tr>
			    			<th colspan="4">Declaration & Authorization			</th>
			    		</tr>
			    		<tr>
			    			<td colspan="4">
			    				Tertanggung menyatakan bahwa seluruh informasi diatas diberikan dengan sebenar-benarnya dan tidak ada informasi yang disembunyikan yang dapat mempengaruhi PT. Asuransi Jasa Indonesia dalam mempertimbangkan klaim. Tertanggung menyetujui bahwa data-data pribadi yang Tertanggung secara sadar berikan dalam proses pengisian aplikasi akan Jasindo gunakan untuk proses underwriting, pencocokan data dan dokumen, berkomunikasi dengan Tertanggung untuk hal apapun, penyelesaian klaim, pembayaran klaim, penyelidikan, dan subrogasi. Selain itu, Jasindo dapat meneruskan data pribadi Tertanggung kepada pihak yang bekerjasama dengan Jasindo terkait dengan jaminan dalam polis ini. 	<br><br>
			    				The Insured declare that the information given in the above are true and complete in every detail and the Insured do not withhold any information likely to affect PTAsuransi Jasa Indonesia (Persero)'s consideration of the claim. The Insured agrees that the personal data the Insured has consciously given when filling out the application will be used by Jasindo to process the underwriting, data and document verification, and to communicate with the Insured on whatever issues, claim settlement, claim payment, investigation, and subrogation. In addition, Jasindomay submit such personal data to any parties which coordinate with Jasindo in connection with the underwriting under this policy.		
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4">
			    				Dengan ini Tertanggung memberi kuasa kepada dokter yang memeriksa, klinik, rumah sakit, atau orang lain yang mengetahui kondisi kesehatan Tertanggung untuk melengkapi keterangan yang diperlukan PT. Asuransi Jasa Indonesia atau perwakilannya,  atas seluruh keterangan yang berkaitan dengan suatu penyakit atau kecelakaan atau riwayat kesehatan atau riwayat penyakit atau konsultasi kesehatan, serta sseluruh dokumen yang diperlukan			<br><br>

			    				The Insured hereby authorized any Doctor(s) who has medically attended the insured, clinic/hospital, or individual to complete and disclose the necessary information to PT. Asuransi Jasa Indonesia or authorized representatives, any and all information with respect to any illness or accident or medical history or history of the disease or health consultation, as well as  all documents necessary			

			    			</td>
			    		</tr>


			    	</table>
			    	{if $dclaim.claim_status eq true}
				    	<p>&nbsp;</p>
				    	<h2>Status: {if $dclaim.claim_status == 1}
				    					OPEN
				    				{else if $dclaim.claim_status == 2}
				    					SETTLED
				    				{else if $dclaim.claim_status == 3}
				    					ACCEPTED/PAID
				    				{else}
				    					REJECTED
				    				{/if}
				    	</h2>
			    	{/if}

			    	{if $dclaim.notes_admin eq true}
			    	<table width="100%" border="1" style="padding:5px;" id="customers">
			    		<tr>
			    			<td width="150">Catatan Admin</td>
			    			<td colspan="3"  >
			    				<textarea rows="10" style="width: 100%;" {$readonly_admin} name="notes_admin">{if $dclaim.notes_admin neq null} {$dclaim.notes_admin} {/if}</textarea>
			    			</td>
			    		</tr>
			    	</table>
			    	{/if}

			    	<p>&nbsp;</p>
			    	<center>
			    		<input type="checkbox" {$cb_term} name="cb_accept_term" id="cb_accept_term" value="1" {$disabled}> <b>Dengan ini saya telah membaca dan menyetujui pernyataan diatas</b>
			    	</center>
			      <!--   <div class="form-group input-password">
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
			        </div> -->
			        <p>&nbsp;</p>
			        <span id="loadingBtn" style="display:none;"><center><h1>Sedang Memproses...</h1></center></span>

			        {if $user_type_id neq 1}
			        	<button id="btnSubmitClaim" class="btn-large full-width yellow" style="display:{$hide_btn};">
				            Proses Klaim Saya
				            <i class="soap-icon-check circle"></i>
				        </button>

			        {/if}
			        

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

        

           
           // var dt = $('form#form_claim').serialize();

   //         if (!$("input[name='cb_klaim_type']:checked").val()) {
			//    alert('Nothing is checked!');
			// }
			// else {
			//   alert('One of the radio buttons is checked!');
			// }
			// return false;           

          	if($("#cb_no_polis").val()==''){
               	alert('Anda harus memilih salah satu No. Ikhtisar Polis');
               	$('#btnSubmitClaim').show();
           		$('#loadingBtn').hide();
           } else 	if(!$("input[name='cb_klaim_type']:checked").val()){
               	alert('Anda harus memilih salah satu jenis klaim');
               		$('#btnSubmitClaim').show();
           		$('#loadingBtn').hide();
           } else if($('input[type=checkbox][name=cb_accept_term]').is(":not(:checked)")){
               	alert('Anda harus menyetujui telah membaca dan menyetujui pernyataan');
               		$('#btnSubmitClaim').show();
           		$('#loadingBtn').hide();
           } else {
           	  $('#btnSubmitClaim').hide();
           		$('#loadingBtn').show();

           	 var formData = new FormData(this);

			    $.ajax({
			        url: '{$site_url}/user_panel/save_claim',
			        type: 'POST',
			        data: formData,
			        // async: false,
				    success: function(data) {
				    	var obj = jQuery.parseJSON(data);
				    	console.log(obj)
				          if(obj.success){
				          	window.location = "{$site_url}/user_panel/claim_success/"+data.no_claim;
				          } else {
				          	// alert(obj.message);
				          	swal('Terjadi kesalahan pada '+obj.message);

				          	$('#btnSubmitClaim').show();
				    				$('#loadingBtn').hide();
				          }
				    },
				    error: function(data) {
				         $('#btnSubmitClaim').show();
				    				$('#loadingBtn').hide();
				    },
			        cache: false,
			        contentType: false,
			        processData: false
			    });

			    return false;
       //     	$.ajax({
			    //     url: '{$site_url}/user_panel/save_claim',
			    //     type: 'POST',
			    //     // dataType: 'json',
			    //     // async: false,
			    //     // cache: false,
			    //     // contentType: false,
			    //     // processData: false,
			    //     data: dt,
			    //     success: function(data) {
		     //           if(data.success){
		     //           	window.location = "{$site_url}/user_panel/claim_success/"+data.no_claim;
		     //           } else {
		     //           	alert(data.message);
		     //           	$('#btnSubmitClaim').show(1000);
       //     				$('#loadingBtn').hide(1000);
		     //           }
			    //     },
			    //     error: function(data) {
			    //          $('#btnSubmitClaim').show(1000);
       //     				$('#loadingBtn').hide(1000);
			    //     }
			    // });
           }

          
           
       });

       $('input[type=radio][name=cb_klaim_type]').change(function() {
                        // set_total(this.value)
              if(this.value=='1'){
              	$('#klaim_medis').show();
              	$('#klaim_kecelakaan').hide();
              	$('#klaim_kenyamanan').hide();
              	$('#klaim_lain').hide();
              } else if(this.value=='2'){
              	$('#klaim_medis').hide();
              	$('#klaim_kecelakaan').show();
              	$('#klaim_kenyamanan').hide();
              	$('#klaim_lain').hide();
              } else if(this.value=='3'){
              	$('#klaim_medis').hide();
              	$('#klaim_kecelakaan').hide();
              	$('#klaim_kenyamanan').show();
              	$('#klaim_lain').hide();
              } else if(this.value=='4'){
              	$('#klaim_medis').hide();
              	$('#klaim_kecelakaan').hide();
              	$('#klaim_kenyamanan').hide();
              	$('#klaim_lain').show();
              }
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


       var claim_type = '{$claim_type}';
        if(claim_type=='1'){
	      	$('#klaim_medis').show();
	      	$('#klaim_kecelakaan').hide();
	      	$('#klaim_kenyamanan').hide();
	      	$('#klaim_lain').hide();

	      	$("input[name=cb_klaim_type][value='1']").prop("checked",true);
	      } else if(claim_type=='2'){
	      	$('#klaim_medis').hide();
	      	$('#klaim_kecelakaan').show();
	      	$('#klaim_kenyamanan').hide();
	      	$('#klaim_lain').hide();

	      	$("input[name=cb_klaim_type][value='2']").prop("checked",true);
	      } else if(claim_type=='3'){
	      	$('#klaim_medis').hide();
	      	$('#klaim_kecelakaan').hide();
	      	$('#klaim_kenyamanan').show();
	      	$('#klaim_lain').hide();

	      	$("input[name=cb_klaim_type][value='3']").prop("checked",true);
	      } else if(claim_type=='4'){
	      	$('#klaim_medis').hide();
	      	$('#klaim_kecelakaan').hide();
	      	$('#klaim_kenyamanan').hide();
	      	$('#klaim_lain').show();

	      	$("input[name=cb_klaim_type][value='4']").prop("checked",true);
	      }
	      
  });
</script>