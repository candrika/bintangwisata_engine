<style type="text/css">
.numberCircle {
    border-radius: 50%;
    behavior: url(PIE.htc);
    width: 64px;
    height: 64px;
    padding: 8px;
    background: #fff;
    border: 2px solid #f6b633;
    color: #297ec5d9;
    text-align: center;
    font: 32px Arial, sans-serif;
}
.swal-button {
    background-color: #7cd1f9;
    color: #fff;
    border: none;
    box-shadow: none;
    border-radius: 5px;
    font-weight: 600;
    font-size: 14px;
     padding: 0px 10px; 
    margin: 0;
    cursor: pointer;
}
.swal-footer {
    text-align: center;
    padding-top: 13px;
    margin-top: 13px;
    padding: 13px 16px;
    border-radius: inherit;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
.b{

}
</style>

<div class="flight-list listing-style3 flight" style="font-size: 12px;">
                    <div class="row" style="padding: 15px;">
                        <div class="col-sm-8 col-xs-12">
                            <!-- <h5>9 Columns</h5> -->
                             <button type="submit" class="btn-small sky-blue1" onClick="form_type_alert();">Pembelian Baru</button>
                        </div>
                        <div class="col-sm-4 col-xs-12">
                           <div>
                                <h4>Pencarian</h4>
                                <form method="post">
                                    <div class="with-icon full-width">
                                        <input type="text" class="input-text full-width" placeholder="Cari nomor order atau nama..." style="margin-bottom: 0px;">
                                        <button class="icon green-bg white-color"><i class="soap-icon-search"></i></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                            {foreach from=$single_order_by_agent key=i item=single}
                                <article class="box">
                                   <!--  <figure class="col-xs-3 col-sm-1" style="background: #ffffff;">
                                        <center><div class="numberCircle">2</div></center>
                                    </figure> -->
                                    <div class="details col-xs-9 col-sm-12" style="    font-size: 13px;">
                                        <div class="details-wrapper">
                                            <div class="first-row">                                                
                                                 <div>
                                                    <h4 class="box-title pull-left">{$single.region_name_detail}<small>{$single.firstname} {$single.lastname}</small></h4>
                                                   <a href ="{$site_url}/Order_intermediary/order_info_page/{$single.order_id}" class="button btn-mini sky-blue1 stop">{$single.order_no}</a>
                                                </div>
                                                <div>
                                                    <span class="price"><small>Total Pembelian</small>Rp. {$single.total_amount}</span>
                                                </div>
                                            </div>
                                            <div class="second-row">
                                                <div class="time">
                                                    <div class="total-time col-sm-4">
                                                        <div class="icon"><i class="soap-icon-clock yellow-color"></i></div>
                                                        <div>
                                                            <span class="skin-color">Tanggal Pembelian</span><br>{$single.order_date}
                                                        </div>
                                                    </div>
                                                    <div class="take-off col-sm-4">
                                                        <div class="icon"><i class="soap-icon-plane-right yellow-color"></i></div>
                                                        <div>
                                                            <span class="skin-color">Tanggal Mulai</span><br>{$single.startdate}
                                                        </div>
                                                    </div>
                                                    <div class="landing col-sm-4">
                                                        <div class="icon"><i class="soap-icon-plane-right yellow-color"></i></div>
                                                        <div>
                                                            <span class="skin-color">Tanggal Akhir</span><br>{$single.enddate}
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                                <div class="action">
                                                    <a class="button btn-small green">{$single.status}</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </article>

                                <hr style="border-color: #4bb7f2;">
                            {/foreach}
                                 <!-- <article class="box"> -->
                                   <!--  <figure class="col-xs-3 col-sm-1" style="background: #ffffff;">
                                        <center><div class="numberCircle">1</div></center>
                                    </figure> -->
                                    <!-- <div class="details col-xs-9 col-sm-12" style="    font-size: 13px;">
                                        <div class="details-wrapper">
                                            <div class="first-row">                                                
                                                <div style="width: 720px;">
                                                    <h4 class="box-title">Batch Order</h4>
                                                    <a class="button btn-mini stop">#2211887</a>
                                                </div>
                                                <div>
                                                    <span class="price"><small>Total Pembelian</small>Rp. 2.312.000</span>
                                                </div>
                                            </div>
                                            <div class="second-row">
                                                <div class="time">
                                                    <div class="total-time col-sm-4">
                                                        <div class="icon"><i class="soap-icon-clock yellow-color"></i></div>
                                                        <div>
                                                            <span class="skin-color">Tanggal Pembelian</span><br>Wed Nov 13, 2013 9:20 am
                                                        </div>
                                                    </div>
                                                    <div class="take-off col-sm-4">
                                                        <div class="icon"><i class="soap-icon-family yellow-color"></i></div>
                                                        <div>
                                                            <span class="skin-color">Total Peserta</span><br>20 Orang
                                                        </div>
                                                    </div>
                                                    <div class="landing col-sm-4">
                                     -->                   <!--  <div class="icon"><i class="soap-icon-plane-right yellow-color"></i></div>
                                                        <div>
                                                            <span class="skin-color">Tanggal Akhir</span><br>Wed Nov 13, 2013 9:20 am
                                                        </div> -->
                                    <!--                 </div>
                                                    
                                                </div>
                                                <div class="action">
                                                    <a href="#" class="button btn-small">Belum Lunas</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </article>
                                
                                <hr style="border-color: #4bb7f2;"> -->

                                <!-- <article class="box"> -->
                                   <!--  <figure class="col-xs-3 col-sm-1" style="background: #ffffff;">
                                        <center><div class="numberCircle">2</div></center>
                                    </figure> -->
                                    <!-- <div class="details col-xs-9 col-sm-12" style="    font-size: 13px;">
                                        <div class="details-wrapper">
                                            <div class="first-row">                                                
                                                 <div>
                                                    <h4 class="box-title pull-left">International Travel Diamond<small>Jaja Miharja</small></h4>
                                                   <a class="button btn-mini stop">#2211887</a>
                                                </div>
                                                <div>
                                                    <span class="price"><small>Total Pembelian</small>Rp. 2.312.000</span>
                                                </div>
                                            </div>
                                            <div class="second-row">
                                                <div class="time">
                                                    <div class="total-time col-sm-4">
                                                        <div class="icon"><i class="soap-icon-clock yellow-color"></i></div>
                                                        <div>
                                                            <span class="skin-color">Tanggal Pembelian</span><br>Wed Nov 13, 2013 9:20 am
                                                        </div>
                                                    </div>
                                                    <div class="take-off col-sm-4">
                                                        <div class="icon"><i class="soap-icon-plane-right yellow-color"></i></div>
                                                        <div>
                                                            <span class="skin-color">Tanggal Mulai</span><br>Wed Nov 13, 2013 7:50 Am
                                                        </div>
                                                    </div>
                                                    <div class="landing col-sm-4">
                                                        <div class="icon"><i class="soap-icon-plane-right yellow-color"></i></div>
                                                        <div>
                                                            <span class="skin-color">Tanggal Akhir</span><br>Wed Nov 13, 2013 9:20 am
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                                <div class="action">
                                                    <a href="#" class="button btn-small green">Lunas</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </article>

                               <hr> -->

                            </div>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
function form_type_alert(){
    swal("Pilih jenis pembelian", {
        buttons: {
            single_order: {
                text: "Pesan",
                value: "single_order",
            },
            // batch_order: {
            //     text: "Batch Order",
            //     value: "batch_order",
            // }
      },
})
.then((value) => {
  switch (value) {
 
    case "batch_order":
      // swal("batch_order");
       window.location.replace("{$site_url}/intermediary/batch_order");
      break;
 
    case "single_order":
      // swal("single_order");
       window.location.replace("{$site_url}/intermediary/single_order/{$data.intermediary_id}");
      break;
 
    default:
      swal("Got away safely!");
  }
});
}

// form_type_alert();
</script>