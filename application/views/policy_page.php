
<style type="text/css">
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}

.headertable {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
.pagebreak { page-break-before: always; } /* page-break-after works, as well */
</style>

<h1 class="logo block">
         
</h1>
<!-- <div style="margin-top:-150px;text-align: center; vertical-align: middle; font-size:18px; font-weight: bold;">Formulir Aplikasi Jasindo Travel Insurance</div><br>
<div style="text-align: center; vertical-align: middle; margin-top:-15px;font-weight: bold;">Jasindo Travel Insurance Application Form</div><br><br>
 -->
<table width="100%" border="0">
	<tr>
		<td width="60%"><img src="/<?=DOCUMENTROOT?>/assets/tpl/images/logo.png" width="150"/></td>
		<td width="20%">Nomor Registrasi<br>
			Nomor Sertifikat<br></td>
		<td width="20%">: <?=$order_no?><br>
			 : <?=$policy_no?><br></td>
	</tr>
</table>
<div style="text-align: center; vertical-align: middle; font-size:18px; font-weight: bold;">Schedule Polis Asuransi Perjalanan Jasindo Travel Insurance</div><br>
<div style="text-align: center; vertical-align: middle;font-weight: bold;font-style: italic;">Policy Schedule of Jasindo Travel Insurance</div><br><br>

<hr>
<br>
Sesuai Surat Permohonan Penutupan Asuransi dari :<br>
<span style="font-style: italic;">According to the Application for Insurance Cover from</span> :<br><br>

<table width="50%">
	<tr>
		<td width="50%">Nama Tertanggung<br>
			<span style="font-style: italic;">Name of the Insured</span>
		</td>
		<td></td>
		<td width="50%">: <?=$firstname?> <?=$lastname?></td>
	</tr>
	<tr>
		<td width="50%">Nomor Identitas<br>
			<span style="font-style: italic;">ID Number</span>
		</td>
		<td></td>
		<td width="50%">: <?=$identity_no?></td>
	</tr>
	<tr>
		<td width="50%">Alamat<br>
			<span style="font-style: italic;">Address</span>
		</td>
		<td></td>
		<td width="50%">: <?=$address?></td>
	</tr>
	<tr>
		<td width="50%">Nomor Telepon<br>
			<span style="font-style: italic;">Telephone No.</span>
		</td>
		<td></td>
		<td width="50%">: <?=$phone_number?></td>
	</tr>
</table>

<p>&nbsp;</p>
Dengan ini PT. Asuransi Jasa Indonesia (Persero) menyetujui dan menerima permohonan dari Tertanggung untuk memberikan jaminan Asuransi Perjalanan Jasindo Travel Insurance sesuai dengan Daftar Manfaat dan Plan yang Dipilih tertanggung. Sertifikat polis ini adalah satu kesatuan dari dan mengikat pada ketentuan Polis Jasindo Travel Insurance.<br>
<span style="font-style: italic;">Hereby PT. Asuransi Jasa Indonesia (Persero) agrees and accepts the Insured’s application for the cover of Jasindo Travel Insurance in accordance with the Benefit List and the Plan the Insured has selected. This Insurance/Policy Certificate is an integral part of and has its legal binding under the provisions of Jasindo Travel Insurance Policy.</span>
<br><br>
<hr>
<br>
<b>Informasi Pertanggungan Polis/ Information on Policy Underwriting</b>
<br>
<br>
<table width="100%" class="gridtable">
	<tr>
		<td style="background-color: #dedede; font-weight: bold;">No</td>
		<td style="background-color: #dedede; font-weight: bold;"><center>Nama Tertanggung <br> <small>Name of The Insured</small></td>
		<td style="background-color: #dedede; font-weight: bold;"><center>Tanggal Lahir <br><small>Birth Date</small></td>
		<td style="background-color: #dedede; font-weight: bold;"><center>Nomor Paspor<br><small>Passport No.</small></td>
		<td style="background-color: #dedede; font-weight: bold;"><center>Status Peserta<br><small>Status</small></td>
	</tr>
	<tr>
		<td >1</td>
		<td><?=$data['firstname'].' '.$data['lastname']?></td>
		<td><?=backdate2($data['birthdate'])?></td>
		<td><?=$data['identity_no']?></td>
		<td>Penanggung</td>
	</tr>
	<?php
	$no=2;
	foreach ($data_member as $key => $value) {
		if($value['fullname']!=''){
				?>
				<tr>
				<td ><?=$no?></td>
				<td><?=$value['fullname']?></td>
				<td><?=backdate2($value['datebirth'])?></td>
				<td><?=$value['no_identity']?></td>
				<td>Tertanggung</td>
			</tr>
			<?php
			$no++;
		}
	}
	?>
</table>

<p>&nbsp;</p>
<div class="pagebreak"> </div> 

<table width="100%" border="0">
	<tr>
		<td width="55%">Asal keberangkatan / Origin destination</td>
		<td width="">:</td>
		<td width="45%"><?=$data['depart_name']?></td>
	</tr>
	<tr>
		<td width="55%">Tujuan Perjalanan / Travel Destination</td>
		<td width="">:</td>
		<td width="45%"><?=$data['dest_name']?></td>
	</tr>
<!-- 	<tr>
		<td width="55%">Alamat domisili/ Address</td>
		<td width="">:</td>
		<td width="45%"><?=$data['address']?></td>
	</tr>
	<tr>
		<td width="55%">Email  / Email</td>
		<td width=" ">:</td>
		<td width="45%"><?=$data['email']?></td>
	</tr>
	 -->
	<tr>
		<td width="55%">Tanggal Dimulainya Perjalanan / Start Date
		</td>
		<td width="">:</td>
		<td width="50%"><?=backdate2($data['startdate'])?></td>
	</tr>
	<tr>
		<td width="55%">Tanggal Berakhir Perjalanan / End Date
		</td>
		<td width="">:</td>
		<td width="50%"><?=backdate2($data['enddate'])?></td>
	</tr>
	<tr>
		<td width="55%">
<small>*) Periode perjalanan maksimum yang dijamin adalah 31 hari</small>
		</td>
		<td width=""> </td>
		<td width="50%"> </td>
	</tr>
	<tr>
		<td width="55%">
		<small>*) Maximum travel period undertaken is 31 days</small>
		</td>
		<td width=""> </td>
		<td width="50%"> </td>
	</tr>
	<!-- <tr>
		<td width="55%">Ahli Waris / Heirs</td>
		<td width="">:</td>
		<td width="45%"><?=$data['heirs_name']?></td>
	</tr>
	<tr>
		<td width="55%">Nomor Telepon Ahli Waris / Heirs Phone Number</td>
		<td width="">:</td>
		<td width="45%"><?=$data['heirs_phone']?></td>
	</tr> -->
</table>

<table width="100%" border="0">
	<tr>
		<td width="20%">Plan yang dipilih / Selected Plan</td>
		<td width="2">:</td>
		<td width="35%"><input type="checkbox" <?=$opt_domestic?>> Domestik Silver</td>
		<!-- <td width=" "> </td> -->
		<td width="40">Tipe Polis</td>
		<td width=" ">:</td>
		<td width=" "><input type="checkbox" <?=$opt_type_single?>> Single</td>
	</tr>
	<tr>
		<td width="40"> </td>
		<td width="2"> </td>
		<td width="40"><input type="checkbox" <?=$opt_int_gold?>> International Gold</td>
		<!-- <td width=" "> </td> -->
		<td width="40"> </td>
		<td width=" "></td>
		<td width=" "><input type="checkbox" <?=$opt_type_duo?>> Duo</td>
	</tr>
	<tr>
		<td width="40"> </td>
		<td width="2"> </td>
		<td width="40"><input type="checkbox" <?=$opt_int_platinum?>> International Platinum</td>
		<!-- <td width=" "> </td> -->
		<td width="40"> </td>
		<td width=" "></td>
		<td width=" "><input type="checkbox" <?=$opt_type_fam?>> Family</td>
	</tr>
	<tr>
		<td width="40"> </td>
		<td width="2"> </td>
		<td width="40"><input type="checkbox" <?=$opt_int_diamond?>> International Diamond</td>
		<!-- <td width=" "> </td> -->
		<td width="40"> </td>
		<td width=" "> </td>
		<td width=" "> </td>
	</tr>

	<tr>
		<td width="40"> </td>
		<td width="2"> </td>
		<td width="40"></td>
		<!-- <td width=" "> </td> -->
		<td width=" ">Paket Perluasan </td>
		<td width=" ">:</td>
		<td width=" "><input type="checkbox" <?=$cb_ext_a?>> A</td>
	</tr>
	<tr>
		<td width="40"> </td>
		<td width="2"> </td>
		<td width="40"></td>
		<!-- <td width=" "> </td> -->
		<td width=" "> </td>
		<td width=" "></td>
		<td width=" "><input type="checkbox" <?=$cb_ext_b?>> B</td>
	</tr>
	<tr>
		<td width="40"> </td>
		<td width="2"> </td>
		<td width=" "></td>
		<!-- <td width=" "> </td> -->
		<td width="40"></td>
		<td width=" "></td>
		<td width=" "><input type="checkbox" <?=$cb_ext_c?>> C</td>
	</tr>
</table>

<!-- <div class="pagebreak"> </div> -->
<hr>

<br><br>
<b>Premi Asuransi / Premium</b><br><br>
Atas pertanggungan tersebut, tertanggung menyetujui dan menyanggupi untuk membayar sejumlah Premi Asuransi Perjalanan dibawah ini :<br>
<span style="font-style: italic;">The Insured agrees and commits to pay the following amount of Travel Insurance Premium</span><br><br>

<table width="50%">
	<tr>
		<td>Premi/Premium</td>
		<td>: Rp. </td>
		<td align="right"><?=number_format(($total_premi+$total_perluasan))?></td>
	</tr>
	<tr>
		<td>Biaya Polis dan Materai/Other cost and stamp</td>
		<td>: Rp. </td>
		<td align="right"><?=number_format($other_fee)?> <hr></td>
	</tr>
	<tr>
		<td>Total</td>
		<td>: Rp. </td>
		<td align="right"><?=number_format($subtotal_premi+$other_fee)?></td>
	</tr>
</table>
					
<br><br>

<hr>

<br><br>
Bersama dengan Sertifikat Polis ini, diserahkan pula Ketentuan Polis Asuransi Perjalanan Jasindo Travel Insurance beserta lampiran Manfaat yang merupakan bagian yang tidak terpisahkan dari Sertifikat Polis ini.
<br><span style="font-style: italic;">With this Insurance/Policy Certificate, the Provisions of Travel Insurance Policy of Jasindo Travel Insurance and the attachment on the Benefits, constituting integral parts of this Insurance/Policy Certificate, are submitted.</span>


<br><br>

<table width="100%">
	<tr>
		<td width="60%"> </td>
		<td width="40%"> </td>
	</tr>
	<tr>
		<td></td>
		<td>Jakarta, <?=date('d F Y')?></td>
	</tr>
	<tr>
		<td></td>
		<td>PT. Asuransi Jasa Indonesia (Persero)
		</td>
	</tr>
</table>





