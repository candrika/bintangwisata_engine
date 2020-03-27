
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
    <table class='tablereport' width='150%' border='0' padding="0">
    <tr>
        <!-- <td colspan="5">  -->
            <center>
                <h1>Data Pemesanan</h1>       
                 <h3><?=$startdate?> s/d <?=$enddate?></h3>       
            </center>
        <!-- </td> -->
    </tr>
    
   
    <tr style="background-color: #dceef7; color: #000; font-size: 12px;">
                <td><b>No</td>
                <td><b>Order No</td>
                <td><b>No Polis</td>
                <td><b>No Polis Star</td>
                <td><b>Nama Depan</td>
                <td><b>Nama Belakang</td>
                <td><b>Alamat</td>
                <td><b>Kode POS</td>
                <td><b>Tgl Lahir</td>
                <td><b>Keberangkatan</td>
                <td><b>Tujuan</td>
                <td><b>Tgl Mulai</td>
                <td><b>Tgl Akhir</td>
                <td><b>Tgl Pesan</td>
                <td><b>Kategori</td>
                <td><b>Tipe</td>
                <td><b>Premi</td>
                <td><b>Premi Perluasan</td>
                <td><b>Biaya Lain</td>
                <td><b>Total Premi</td>          
                <td><b>Biaya Transaksi</td>
                <td><b>Total Pembayaran</td>
                <td><b>Status Pembayaran</td>
    </tr>

    <?php
    $no=1;
    // $this->load->model('personalia/m_pekerjaan');
    foreach ($data->result() as $r) {
					// var_dump($r); die;
            ?>
            <tr style="font-size: 12px;">
                <td><?=$no?></td>
                <td><?=$r->order_no?></td>
                <td><?=$r->policy_no?></td>
                <td><?=$r->policy_no_star?></td>
                <td><?=$r->firstname?></td>
                <td><?=$r->lastname?></td>
                <td><?=$r->address?></td>
                <td><?=$r->zipcode?></td>
                <td><?=$r->birthdate?></td>
                <td><?=$r->depart_name?></td>
                <td><?=$r->dest_name?></td>
                <td><?=$r->startdate?></td>
                <td><?=$r->enddate?></td>
                <td><?=$r->order_date?></td>
                <td><?=$r->category?></td>
                <td><?=$r->type?></td>
                <td><?=$r->total_premi?></td>
                <td><?=$r->total_perluasan?></td>
                <td><?=$r->other_fee?></td>
                <td><?=$r->subtotal_premi?></td>                 
                <td><?=$r->payment_fee?></td>
                <td><?=$r->total_amount?></td>
                <td><?=$r->status?></td>
            </tr>
            
            <?php
        $no++;
//           echo "<tr><td colspan=5><hr style=border: none; height: 0;  border-top: 0px solid rgba(0, 0, 0, 0.1); border-bottom: 1px solid rgba(255, 255, 255, 0.3);> </td></tr>";
    }
    ?>

</table>
    
</body>