<style type="text/css">
#time{
    overflow: hidden;
    float: right;
    position: relative;
    left: 241px;
    top: -79px;
    margin-bottom: -37px;
}
#baggage{
    position: relative;
    width: 39px;
    left: 431px;
    top: -80px;
    margin-bottom: -20px;
}
#flight_logo{
    top: -36px;
    position: relative;
    /* top: 1px; */
    left: 10px;
}
#circle-hole{
    width: 12px;
    position: relative;
    top: -109px;
    float: right;
    left: 41px;
}
.form-group{
    margin-bottom: -77px;
}
.vertical-line{
    border: 1px solid;
    top: -144px;
    position: relative;
    height: 45px;
    width: 0;
    left: 200.5px;
    border-color: #e44d29;
    margin-bottom: -29px;
}
#circle-solid{
    width: 12px;
    position: relative;
    top: -111px;
    float: right;
    left: 41px;
    margin-bottom: -79px;
}
</style>
<section id="content" class="gray-area" style="margin-top:1%;">
            <div class="container">
                <div id="main">
                    <div class="booking-section travelo-box">
                       <!--  <nav style="margin-bottom: 40px;">
                                    <ol class="cd-multi-steps text-bottom count">
                                      <li class="visited"><a href="#0">Pilih Destinasi</a></li>
                                      <li class="current" ><a href="#0">Isi Form Pemesanan</a></li>
                                      <li class="current" ><a href="#0">Isi Form Pemesanan</a></li>
                                      <li><em>Pembayaran</em></li>
                                    </ol>
                                  </nav> -->
                        <div class="tab-content" style="width: 884px;/* width: 116px; */float: right;">
                            <div id="booking">
    
                                <div class="booking-history">
                                <!-- {if $data eq true} -->
                                    {$i=0}
                                    {foreach from=$data key=k item=p}
                                    <!-- {$p->sumPrice} -->
                                        <div class="booking-info clearfix">
                                            <div class="date" id="{$p->jiDepartDate}"><input type="hidden" value="{$p->jiDepartDate}" id="dateInput">
                                                <label class="month">{$p->jiDepartMonth}</label>
                                                <label class="date">{$p->jiDepartDate}</label>
                                                <label class="day">{$p->jiDepartDay}</label>
                                            </div>
                                            <h4 class="box-title"><i class="icon soap-icon-plane-right takeoff-effect yellow-color circle"></i><a href="{$site_url}/order/order_info_page/" target="_parent">
                                                {$p->jiOrigin}<img src="{$base_url}/assets/img/search/to.png" alt="" style="width: 27px;";/> {$p->jiDestination}

                                            </a> <small>
                                                {$p->jiDepartTime}<img src="" alt="" style="width: 12px;";/> {$p->jiArrivalTime} 
                                            </small><br><small>
                                            <!-- No Polis: {$p->journeyReference} -->
                                        </small>
                                           <div class="box-title" id="time"><img src="{$base_url}/assets/img/image/clock.png" alt="" style="width: 27px;";/>&nbsp;<a href="">{$p->selisih}</a></div>
                                            <div class="box-title" id="baggage"><img src="{$base_url}/assets/img/image/bagasi.png" alt="" style="width: 27px;";/>&nbsp;<a href=""></a></div>
                                            <div class="form-group">
                                             <label>
                                             <a id="show_reg_form"><span class="skin-color" onclick="myFunction()">Detail</span></a>

                                             <div class="wrapper-collapse animate-fadeInUp">
                                                <div class="wrapper-detail">

                                             </label>
                                             </div>
                                          </div>
                                            <div id="wrapper-flight-details_{$i++}" /*style="display:none"*/>
                                                <div class="tixpoint-flight-details">
                                                    <div class="row">
                                                        {foreach from=$p->segment key=k item=segment}
                                                            {foreach from=$segment->flightDetail key=k item=flight}
                                                                <div class="box-title" id="flight_logo"><img src="{$base_url}/assets/img/maskapai/{$flight->airlineCode}.png">&nbsp;&nbsp;{$flight->airlineCode}&nbsp;{$flight->flightNumber}
                                                                </div>
                                                                <div><img src="{$base_url}/assets/img/circelawal.png"id="circle-hole"></div>
                                                                <div style="    position: relative;top: -113px;left: 221px;font-size: 11px;">{assign var="datetime" value="T"|explode:$flight->fdDepartTime}{$datetime[1]}<br>{assign var="date" value="-"|explode:$datetime[0]}{$date[2]}-{$date[1]}-{$date[0]}</div>
                                                                <!-- /<div>{$flight->fdDestination}</div> -->
                                                                <hr class="vertical-line">
                                                                <div><img src="{$base_url}/assets/img/circelakhir.png"id="circle-solid"></div>
                                                                <div style="    position: relative;top: -113px;left: 221px;font-size: 11px;">{assign var="datetime1" value="T"|explode:$flight->fdArrivalTime}{$datetime1[1]}<br>{assign var="date1" value="-"|explode:$datetime1[0]}{$date1[2]}-{$date1[1]}-{$date1[0]}</div>
                                                                
                                                                {/foreach}
                                                        {/foreach}
                                                    </div>
                                                </div>
                                            </div>
                                            </h4>
                                            <dl class="info">
                                                <dt style="margin-left: 12px;text-align: center;font-size: 22pt;">Harga</dt>
                                                <dd style="margin-left: 15px;text-align: center;font-size: 15pt;">Rp.&nbsp;{$p->sumPrice}</dd>
                                                <button class="btn-mini status">Pilih</button>
                                                
                                            </dl>
                                        </div>
                                    {/foreach}
                                <!-- {/if} -->
                                 
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
<script type="text/javascript">
    $("#wrapper-flight-details").hide();
    
    function myFunction() {
      var x = document.getElementById("wrapper-flight-details");
      
       if (x.style.display === "none") {
         x.style.display = "block";
       } else {
         x.style.display = "none";
       }
    }
</script>