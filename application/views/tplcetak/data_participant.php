
<?php
$borderstyle = "border-bottom: #E6E8E6;  border-bottom-width: thin; border-bottom-style: dotted; ";
?>
<style>
    td {        
        font-size: <?=$fontsize?>px;
    }
</style>
<body>
<center>
    <table class='tablereport' width='100%' border='0' padding="0">
    <tr>
        <!-- <td colspan="5">  -->
            <center>
                <h1>Data Tertanggung</h1>       
                 <h3><?=$startdate?> s/d <?=$enddate?></h3>       
            </center>
        <!-- </td> -->
    </tr>
    
   
    <tr style="background-color: #dceef7; color: #000; font-size: 12px;">
                <td><b>No</td>
                <td><b>Nama Depan</td>
                <td><b>Nama Belakang</td>
                <td><b>No Identitas</td>
                <td><b>Tgl Lahir</td>
                <td><b>Alamat</td>
                <td><b>Kode POS</td>
                <td><b>No Telepon</td>
                <td><b>Kota</td>
                <td><b>Provinsi</td>
                <td><b>Negara</td>
                <td><b>Nama Pewaris</td>
                <td><b>No Tlp Pewaris</td>
                <td><b>Tgl Lahir Pewaris</td>
                <td><b>Tgl & Jam Terdaftar</td>
    </tr>

    <?php
    $no=1;
    // $this->load->model('personalia/m_pekerjaan');
    foreach ($data->result() as $r) {
					// var_dump($r); die;
            ?>
            <tr style="font-size: 12px;">
                <td><?=$no?></td>
                <td><?=$r->firstname?></td>
                <td><?=$r->lastname?></td>
                <td><?=$r->identity_no?></td>
                <td><?=$r->birthdate?></td>
                <td><?=$r->address?></td>
                <td><?=$r->zipcode?></td>
                <td><?=$r->phone_number?></td>
                <td><?=$r->city?></td>
                
                <td><?=$r->province?></td>
                <td><?=$r->country_name?></td>
                <td><?=$r->heirs_name?></td>
                <td><?=$r->heirs_phone?></td>
                <td><?=$r->heirs_datebirth?></td>
                <td><?=$r->dateregistered?></td>
            </tr>
            
            <?php
        $no++;
//           echo "<tr><td colspan=5><hr style=border: none; height: 0;  border-top: 0px solid rgba(0, 0, 0, 0.1); border-bottom: 1px solid rgba(255, 255, 255, 0.3);> </td></tr>";
    }
    ?>

</table>
    
</body>