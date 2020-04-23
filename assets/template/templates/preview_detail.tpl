<style type="text/css">
input.input-text-voucher {
    padding-left: 15px;
    padding-right: 15px;
    height: 34px;
    border-radius: 5px;
    background: #f5f5f5;
    border: none;
    line-height: normal;
    width: 50% !important; 
    /* margin-bottom: 10px; */
}
.head-line{
    background: #eceeef5e;
    padding: 10px;
    border-radius: 15px;
    box-shadow: rgba(3, 18, 26, 0.15) 0px 2px 5px;
    width: 981px;
    position: relative;
    left: 91px;
}
.page-container{
  box-sizing: inherit;
    box-shadow: rgba(3, 18, 26, 0.15) 0px 2px 5px;
    border-radius: 5px;
    left: 80px;
    position: relative;
    width: 461px;
    height: 241px;
    background: #ececec4f;
}
._left{
  float: left;
  width: 630px;
  padding-right: 10px;
}
.mMmI2{
  margin-bottom: 16px;
  position: relative;
}
.mMmI2,._2BAJV{
  -webkit-box-shadow: 0 1px 3px 0 rgba(27,27,27,.1);
  box-shadow: 0 3px 7px 2px rgba(4, 4, 4, 0.1);
}
.detail{
  display: block;
    position: relative;
    background: #fff;
    border-radius: 4px;
    margin-bottom: 16px;
    -webkit-font-smoothing: antialiased;
}
.insede{
  padding: 16px;
}
.box_detail{
    margin-left: -192px;
    padding: 17px;
    /*font-size: 17px;*/
    width: 471px;
    margin-right: 1742px;
    border-radius: 15px;
}
.box_detail_1{
  /*margin-left: 1px; */
    padding: 17px;
    position: relative;
    left: 109px;
    border-radius: 5px;
    width: 164%;
    top: -1px;
}
/* Extra small devices (phones, 600px and down) */
/*@media only screen and (max-width: 360px) {
  
  #voucher_code{
    position: relative !important;
    right: 1px !important;
    width: 75% !important;
  }
  #voucher_code_btn{
    position: relative;
    left: 201px;
  }
  #cancel_disc{
    right: -42px !important;
    top: 28px;
  }
}*/
/* Small devices (portrait tablets and large phones, 600px and up) */
@media only screen and (min-width: 600px) {
  #voucher_code{
    position: relative !important;
    right: 2px !important;
    /*width: 75% !important;*/
  }
  #voucher_code_btn{
    position: relative;
    /*left: 201px;*/
    /*top:5px;*/
  }
  #cancel_disc{
    right: -42px !important;
    top: 28px;
  }
}

/* Medium devices (landscape tablets, 768px and up) */
@media only screen and (min-width: 768px) {
   #voucher_code{
    position: relative !important;
    /*right: 2px !important;*/
    /*width: 25% !important;*/
  }
  #voucher_code_btn{
    position: relative;
    /*left: 201px;*/
    /*margin-top: -6px*/
  }
  #cancel_disc{
    right: -42px !important;
    top: 28px;
  }
}

/* Large devices (laptops/desktops, 992px and up) */
@media only screen and (min-width: 992px) {
   #voucher_code{
    position: relative !important;
    right:122px !important;
    width: 50% !important;
  }

  #voucher_code_btn{
      left: 51px;
  }

  #cancel_disc{
    right: 8px !important;
    top: 1px;
  }
}

/* Extra large devices (large laptops and desktops, 1200px and up) */
@media only screen and (min-width: 1200px) {

}
</style>
<link rel="stylesheet" href="{$base_url}assets/tpl/css/style-header-step.css">
<link rel="stylesheet" href="{$base_url}assets/tpl/css/update.css">
<section id="content" style="background: #fff0; margin-top: 20px; border-radius: 20px;">
  <div class="container container-content-shadow">
    <div class="row">
      <div id="main" class="col-sm-12 col-md-12">
        <div class="booking-section travelo-box">
          <form id="order_form" class="cruise-booking-form" action="{$site_url}/airlines/page_pnr" method="POST" novalidate>
            <input type="hidden" name="form_valid" id="form_valid">
            <input type="hidden" value="airlineID" name="airlineID" id="airlineID">
            <input type="hidden" value="depart_date" name="depart_date" id="depart_date">
            <input type="hidden" value="stardate_date" name="stardate_date" id="stardate_date">
            <input type="hidden" value="departure_id" name="departure_id" id="departure_id">
            <input type="hidden" name="destination_id" id="destination_id_field" value="destination_id">
            <input type="hidden" name="type" id="type_field" value="type">
            <input type="hidden" name="paxAdult" id="paxAdult_field" value="paxAdult">
            <input type="hidden" name="paxChild" id="paxChild_field" value="paxChild">
            <input type="hidden" name="paxInfant" id="paxInfant_field" value="paxInfant">
            <nav style="margin-bottom: 40px;">
              <ol class="cd-multi-steps text-bottom count">
                <li class="visited"><a href="#0">Pilih Pesawat</a></li>
                <li class="current"><a href="#1">Preview</a></li>
                <li><em>Pemesanan</em></li>
                <li><em>Pembayaran</em></li>
              </ol>
            </nav>
            <div class="page-title-container head-line" style="height:  108px;">
                  <div class="container">
                      <div class="page-title pull-left" style="margin-top: -11px;">
                          <h2 class="entry-title" style="color: #1d1c1c;">Dari {$departure_name} sampai {$destination_name}<br>
                            <small style="color: #2c1bb9;position: relative;top: -29px;">
                            <i class="soap-icon-plane"></i>
                              {$departure_id} - {$destination_id} | {$stardate_date}
                              <p style="position: inherit;top: -12px;left: 13px;">Penumpang Dewasa  {$paxAdult} {if $paxChild neq 0} Anak-anak {$paxChild} {/if} {if $paxInfant neq 0} Bayi {$paxInfant} {/if}| Kelas P</p>
                            </small>
                          </h2>    
                      </div>
                  </div>
            </div>
            <div class="block" style="position: relative;left: -121px;">
              <div class="row image-box style1" style="margin: 21px;">
                  <div class="col-sm-6 col-md-3">
                    <article class="box mMmI2 box_detail">
                      <figure style="border-bottom:1px solid">
                          <a href="#" title="" class="hover-effect">
                           <span><small>Airline Detail</span>
                           <!-- <img src="" alt="" width="270" height="160"> -->
                          </a>
                      </figure>
                      <div class="booking-details travelo-box"style="margin-top: 0px;">
                        <div class="details" style="padding-top: 0px;">
                          <article class="image-box cruise listing">
                            <div class="constant-column-3 timing clearfix">
                              <div class="check-in">
                                <span id="airlineID" style="font-size: 11px;width: 149%;">
                                <img src="{$base_url}/assets/img/maskapai/{$flight[0]}.png" alt="maskapai" style="width: 48%;"> Batik Air | {$flight[1]}</span>
                              </div>
                            </div>
                            <div class="constant-column-3 timing clearfix">
                              <div class="check-in">
                               <label>Kota Keberangkatan</label>
                               <span id="departure_name">{$flight[4]}</span>
                              </div>
                              <div class="duration text-center">
                                <i class="icon soap-icon-plane-right takeoff yellow-color"></i>
                                <!-- <span id="days">{$selisih}</span> -->
                              </div>
                              <div class="check-out">
                                <label>Kota Tujuan</label>
                                <span id="destination_name">{$flight[5]}</span>
                              </div>
                            </div>
                            <div class="constant-column-3 timing clearfix">
                              <div class="check-in">
                                 <label>Keberangkatan</label>
                                 <span id="DepartDateinfo">{$flight[2]}</span>
                              </div>
                              <div class="duration text-center">
                                <i class="soap-icon-clock"></i>
                                <span id="days">{$aktual_time}</span>
                              </div>
                              <div class="check-out">
                                <label>Kedatangan</label>
                                <span id="ArrivalDateinfo">{$flight[3]}</span>
                              </div>
                            </div>
                          </article>
                        </div>
                    </article>
                  </div>
                  <div class="col-sm-6 col-md-3">
                    <!-- <article class="box mMmI2 box_detail_1">
                     <figure style="border-bottom:1px solid">
                          <a href="#" title="" class="hover-effect">
                           <span><small>Airline Detail</span>
                           <img src="" alt="" width="270" height="160">
                          </a>
                      </figure>
                      <div class="booking-details travelo-box" style="margin-top: 10px;">
                        <article class="image-box cruise listing-style1">
                          <div class="details">
                          </div>  
                        </article>    
                      </div>      
                    </article> -->
                    <article class="box mMmI2 box_detail_1">
                      <figure style="border-bottom:1px solid">
                          <a href="#" title="" class="hover-effect">
                           <span><small><h4>Rincian Harga</h4></span>
                           <!-- <img src="" alt="" width="270" height="160"> -->
                          </a>
                      </figure>
                      <div class="booking-details travelo-box" style="margin-top: 10px;">
                        <article class="image-box cruise listing-style1">
                          <div class="details">
                            <input type="hidden" value="$departPrice->airlineAccessCode" id="airlineAccessCode" name="airlineAccessCode">
                            <input type="hidden" value="$departPrice->journeyDepartReference" id="journeyDepartReference" name="journeyDepartReference">
                            <input type="hidden" value="$departPrice->journeyReturnReference" id="journeyReturnReference" name="journeyReturnReference">
                            <input type="hidden" value="$departPrice->origin" id="origin" name="origin">
                            <input type="hidden" value="$departPrice->destination" id="destination" name="destination">
                            <input type="hidden" value="$departPrice->tripType" id="tripType" name="tripType">
                            <input type="hidden" value="$departPrice->departDate" id="departDate" name="departDate">
                            <input type="hidden" value="$departPrice->returnDate" id="returnDate" name="returnDate">
                            <input type="hidden" value="$departPrice->paxAdult" id="paxAdult" name="paxAdult">
                            <input type="hidden" value="$departPrice->paxChild" id="paxChild" name="paxChild">
                            <input type="hidden" value="$departPrice->paxInfant" id="paxInfant" name="paxInfant">
                            <input type="hidden" value="$departPrice->searchKey" id="searchKey" name="searchKey">
                            <input type="hidden" value="$departPrice->promoCode" id="promoCode" name="promoCode">
                            {foreach from =$departPrice->priceDepart key =k item=price}
                            <input type="hidden" value="$price->flightNumber" id="flightNumber" name="flightNumber">
                            <input type="hidden" value="$price->classFare" id="classFare" name="classFare">
                            <input type="hidden" value="$price->psOrigin" id="psOrigin" name="psOrigin">
                            <input type="hidden" value="$price->psDestination" id="psDestination" name="psDestination">
                            <input type="hidden" value="$price->psDate" id="psDate" name="psDate">
                            <input type="hidden" value="$price->currency" id="currency" name="currency">
                            <input type="hidden" value="$price->garudaNumber" id="garudaNumber" name="garudaNumber">
                            <input type="hidden" value="$price->garudaAvailability" id="garudaAvailability" name="garudaAvailability">
                            <input type="hidden" value="$price->airlineSegmentCode" id="airlineSegmentCode" name="airlineSegmentCode">
                            <input type="hidden" value="$price->classId" id="classId" name="classId">
                              {foreach from=$price->priceDetail key=k item=detail}
                              <div class ="row">
                                <div class="constant-column-3 timing clearfix">
                                  <div class="check-in">
                                    <!-- <label>Kota Keberangkatan</label> -->
                                    <span id="departure_price"><label>Harga</label></span>
                                    <span id="departure_tax"><label>Pajak<label></span>
                                    <span id="departure_total_fare"><label>totalFare</label></span>
                                    <span id="departure_total_fare"><label>Bagasi</label></span>
                                    <!-- <span id="departure_total_fare"><label>Inf</label></span> -->
                                  </div>
                                  <div class="duration text-center">
                                    <i class="icon yellow-color"></i>
                                    <!-- <span id="days">{$selisih}</span> -->
                                  </div>
                                  <div class="check-out">
                                    <!-- <label>Kota Tujuan</label> -->
                                    <span id="value_departure_price">{$detail->baseFare}</span>
                                    <span id="value_destination_name">{$detail->tax}</span>
                                    <span id="value_destination_name">{$detail->totalFare}</span>
                                    <span id="value_destination_name">{$detail->bagInfo}</span>
                                    <span id="value_destination_name">{$detail->bagInfo}</span>
                                    <!-- totalFare -->
                                  </div>
                                </div>
                              </div>
                              {/foreach}
                            {/foreach}
                          </div>
                        </article>  
                      </div>
                    </article>
                    <article class="box mMmI2 box_detail_1" style="background: #fff0;box-shadow: 0 0px 0px 0px rgba(4, 4, 4, 0.1);top: -41px;left: 91px;">
                      <button type="submit" class="button btn-medium dull-blue" style="width:401px;height:41px;">Lanjut</button>
                    </article>  
                  </div>
              </div>
            </div> 
          </form>
       </div>
     </div>
    <!-- </div> -->
  </div>
</section><p>&nbsp;</p>


<script type="text/javascript">

var logged = 0;

function myFunction() {
    // Get the snackbar DIV
    var x = document.getElementById("snackbar")

    // Add the "show" class to DIV
    x.className = "show";

    // After 3 seconds, remove the show class from DIV
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}

jQuery(document).ready(function($) {

  // if(logged==1){
  //   $('#voucher_code_btn').css('right','-147px');
  // }

  // $("#success_msg").hide();
  //  try {
  //     $("input[type='text']").each(function(){
  //                    $(this).attr("autocomplete","off");
  //                 });
  // }
  // catch (e)
  // { }
   var x = document.getElementById("snackbar");
   x.className = "show";
   setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000); 
   window.XMLHttpRequest = newXHR;
});              
</script>