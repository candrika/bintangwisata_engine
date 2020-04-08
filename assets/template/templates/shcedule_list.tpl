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
    top: 28px;
    float: left;
    left: 1px;
}
.form-group{
    margin-bottom: -77px;
}
.vertical-line{
    border: 1px solid;
    top: -7px;
    position: relative;
    height: 59px;
    width: 0;
    left: 6.5px;
    border-color: #b5b5b5;
    margin-bottom: -29px;
}
#circle-solid{
    width: 12px;
    position: relative;
    top: -13px;
    float: left;
    left: 1px;
    /* margin-bottom: -79px;*/
}
.pull-center{
    position: relative;
    left: 43px;
}
#takeoff{
    font-size: 32px;
    position: relative;
    top: -48px;
    transform: rotate(-7deg);
    color: blueviolet;
    display: inline-block;
}
#landing{
    font-size: 32px;
    position: relative;
    top: 21px;
    transform: rotate(72deg);
    color: #2bc0e2;
    display: inline-block;
    float: left;
    left: 20px
}
.garis-tepi{
    border-left: 1px solid #ecd2d2;
    height: 301px;
    position: relative;
    top: 12px;
}
.balloon{
    background: whitesmoke;
    overflow: hidden;
    /* margin-top: 1px; */
    position: relative;
    top: 1px;
}
.balloon-container{
    position: absolute;
    margin-top: 24px;
    width: 300px;
    max-height: 391px;
    background-color: #fafafa;
    z-index: 10;
    border: 1px solid #e5e5e5;
    border-radius: 4px;
    line-height: 30px;
}
.box-balloon-inline{
    padding: 16px;
    max-height: 358px;
    overflow-y: auto;
}
.inside-ballon-line{
        border: 1px solid #e5e5e5;
    padding: 8px;
}
.balloon-box-entitas{
    box-sizing: inherit;
}
.by-name{
    display: none;
}
.by-depart{
    display: none;
}
.by-rating{
display: none;
}
._checkbox, ._label {
    display: inline-block;
    -webkit-transition: opacity .3s ease,-webkit-transform .3s ease;
    transition: opacity .3s ease,-webkit-transform .3s ease;
    transition: opacity .3s ease,transform .3s ease;
    transition: opacity .3s ease,transform .3s ease,-webkit-transform .3s ease;
}
._checkbox,._checkbox1{
    background: #fff;
    border: 1px solid #b4b4b4;
    -webkit-box-shadow: inset 0 2px 1px 0 rgba(27,27,27,.05);
    box-shadow: inset 0 2px 1px 0 rgba(27,27,27,.05);
    border-radius: 2px;
    height: 16px;
    margin-right: 8px;
    position: relative;
    width: 16px;
}
._checkbox, ._checkbox1, ._label, ._label1 {
    vertical-align: middle;
}
.labeling {
    cursor: pointer;
    display: block;
    position: relative;
    white-space: nowrap;
}
#img_icon{
   right: 0px;
    position: absolute;
    margin: -2px 0;
    max-width: 31px;
}
.slider, .slider * {
    box-sizing: border-box;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
}
.slider {
    position: relative;
    height: 14px;
    /*padding: 5px 0;*/
    width: 100%;
    border-radius: 6px;
    -ms-touch-action: none;
    touch-action: none;
}
.font{
    position: absolute;
    top: 191px;
    left: 121px;
    font-size: 51px;
    font: -webkit-control;
    color: #ecebe9;
}
</style>
<section id="content" class="gray-area" style="margin-top:1%;width: 0px;">
    <div class="container">
        <div id="main">           
            <!-- <div class="booking-section travelo-box"> -->
            <div class="page-title-container" style="height: 86px;">
                        <div class="container">
                            <div class="page-title pull-left" style="margin-top: -11px;">
                                <h2 class="entry-title">{$departure_name} sampai {$destination_name} <br>
                                  <small style="color: #2c1bb9;position: relative;top: -29px;">{$startdate} 
                                            {if !$enddate}
                                            - $enddate 
                                            {/if}
                                            | Dewasa {$paxAdult}
                                            {if $paxChild !=0}
                                            | Anak-anak {$paxChild}
                                            {/if}
                                            {if $paxInfant !=0}
                                            ! Bayi {$paxInfant}
                                            {/if}
                                    </small>
                                </h2>    
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div>
                          <p class="font">Filter:</p><div class="sort-by-section clearfix box" style="margin-left: 16px;margin-right: 14px;">
                                <ul class="sort-bar clearfix block-sm" style="margin-left: -169px;">
                                    <li class="sort-by-name active"><a class="sort-by-container asc" id="maskapai" href="#"><span>Maskapai</span></a>
                                        <div class="by-name">
                                            <div class="balloon-container">
                                                <div class="box-balloon-inline">
                                                    <div class="inside-ballon-line">
                                                        <span calss="balloon-box-entitas">
                                                            <span>
                                                              <label class="labeling"  data-disabled="false">
                                                                <input  type="checkbox" class="_checkbox">
                                                                <!-- <div> -->
                                                                  <!-- <div class="_checkbox"></div> -->
                                                                  <div class="_label" id="all_choose">Pilih Semua</div>
                                                                <!-- </div> -->
                                                              </label>
                                                          </span>
                                                          <span>
                                                              <label class="labeling"  data-disabled="false">
                                                                <input  type="checkbox" class="_checkbox" id="checked">
                                                                <!-- <div> -->
                                                                  <!-- <div class="_checkbox"></div> -->
                                                                  <div class="_label">
                                                                    <!-- <img id="img_icon" src="http://localhost/bintangwisata_engine//assets/img/maskapai/{$plane.code}.png"></div> -->
                                                                <!-- </div> -->
                                                              </label>
                                                              
                                                          </span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="sort-by-price active "><a class="sort-by-container asc" id="keberangkatan" href="#"><span>Keberangkatan</span></a>
                                        <div class="by-depart">
                                            <div class="balloon-container">
                                                <div class="box-balloon-inline">
                                                    <div class="inside-ballon-line">
                                                        <span calss="balloon-box-entitas">
                                                            <span>
                                                              <label class="labeling"  data-disabled="false">
                                                                <input  type="checkbox" class="_checkbox1">
                                                                <!-- <div> -->
                                                                  <!-- <div class="_checkbox"></div> -->
                                                                  <div class="_label"></div>
                                                                <!-- </div> -->
                                                              </label>
                                                              
                                                          </span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="sort-by-rating active "><a class="sort-by-container asc" id="harga" href="#"><span>harga</span></a>
                                        <div class="by-rating">
                                            <div class="balloon-container">
                                                <div class="box-balloon-inline">
                                                    <div class="inside-ballon-line">
                                                        <span calss="balloon-box-entitas">
                                                            <span>
                                                              <div style="margin: 6px 10px 10px;">
                                                                <p>
                                                                  <label for="amount">Price range:</label>
                                                                  <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;background: #fffcf8;">
                                                                </p>
                                                                <div class="slider"></div>
                                                              </div>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <ul class="sort-bar clearfix block-sm pull-right">
                                    <li>
                                        <button class="btn-medium soap-icon-list uppercase" id="toggle-filter">Urutkan</button>
                                    </li>
                                    <li>
                                       <button class="btn-medium soap-icon-search uppercase" id="search-again" data-toggle="modal" data-target="#form-search-again"> Ubah Pencarian</button>
                                    </li>    
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Modal start here -->
                    <div id="form-search-again" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <!-- konten modal-->
                            <div class="modal-content">
                                <!-- heading modal -->
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Ubah Pencarian</h4>
                                </div>
                                <!-- body modal -->
                                <div class="modal-body">
                                    <form>
                                        <div class="row">
                                            <div class="col-md-6">
                                                   
                                                   <label>Dari</label>
                                                   <input type="hidden" class="input-text  full-width depart_id" id="depart_code" name="depart_code">
                                                   <input type="text" class="input-text full-width departure_id" autocomplete="off" placeholder="Ketikkan kota keberangkatan" id="cb_depart" name="departure_id"  onkeyup="search_algorithm('cb_depart','depart-list')"/>
                                                   <ul style="display:none" class="collection" id="depart-list">
                                                          {foreach from=$depart_ul key=k item=depart}
                                                          <li class="collection-item" onclick="change_depart('{$depart->city}','{$depart->airport_name}','{$depart->airport_code}')" id="depart-list">
                                                          <p class="nama_bandara title6" style="text-align: left;"> 
                                                            
                                                              <b>{$depart->city}</b> - <span style="color:#999">{$depart->airport_name}&nbsp;({$depart->airport_code})<span>
                                                          </p>
                                                          </li>
                                                      {/foreach}
                                                  </ul>
                                                </div>
                                                <div class="col-md-6">
                                                   <label>Tujuan</label>
                                                   <input type="hidden" class="input-text  full-width dest_id" id="dest_code" name="dest_code">
                                                    <input type="text" class="input-text full-width destination_id" autocomplete="off"  onkeyup="search_algorithm('cb_dest','dest-list')" placeholder="Ketikkan kota tujuan" id="cb_dest" name="destination_id"/>
                                                    <ul style="display:none" class="collection" id="dest-list">
                                                          {foreach from=$arrival_ul key=k item=arrival}
                                                          <li class="collection-item" onclick="change_arrival('{$arrival->city}','{$arrival->airport_name}','{$arrival->airport_code}')" id="dest-list">
                                                          <p class="nama_bandara title6" style="text-align: left;"> 
                                                            
                                                              <b>{$arrival->city}</b> - <span style="color:#999">{$arrival->airport_name}&nbsp;({$arrival->airport_code})<span>
                                                          </p>
                                                          </li>
                                                      {/foreach}
                                                  </ul>
                                                </div>
                                        </div>
                                        <div class="row">
                                                <input type="text" class="input-text full-width route_id" 
                                                placeholder="Ketikkan kota tujuan" id="route" name="route_id" 
                                                /*style="display:none"*/ value=""/>
                                                <div class="col-xs-6">
                                                   <label><span style="color:#FFF;">-</span></label>
                                                   <!-- <div class="checkbox"> -->
                                                      <label>
                                                      <input type="checkbox" id="mcb_one_way" value="" class="radio-square">One Way
                                                      </label>
                                                   <!-- </div> -->
                                                </div>
                                                <div class="col-xs-6">
                                                   <label><span style="color:#FFF;">-</span></label>
                                                   <!-- <div class="checkbox"> -->
                                                      <label>
                                                      <input type="checkbox" id="mcb_round_trip" value="">Round Trip
                                                      </label>
                                                   <!-- </div> -->
                                                </div>
                                             </div>
                                        <div class="row">
                                                <div class="col-md-6">
                                                   <label>Keberangkatan</label>
                                                   <div class="datepicker-wrap-order">
                                                      <input type="text" id="departdate" class="input-text full-width" placeholder="select date" autocomplete="off"/>
                                                   </div>
                                                </div>

                                                <div class="col-md-6">
                                                   <label>Kepulangan</label>
                                                   <div class="datepicker-wrap-order">
                                                      <input type="text" id="returndate" class="input-text full-width" placeholder="select date" autocomplete="off"/>
                                                   </div>
                                                </div>
                                             </div>
                                        <div class="row">
                                             <div class="col-md-6">
                                                  <h5 class="title">Maskapai</h5>
                                                   <!-- <label>Maskapai</label> -->
                                                   <input type="hidden" class="input-text  full-width airlines_code" id="airlines_code" name="airlines_code">
                                                   <input type="text" class="input-text full-width airlines_id" autocomplete="off" placeholder="Ketikkan kota maskapai" id="cb_airlines" name="airlines_id" onkeyup="search_algorithm('cb_airlines','maskapai-list')"/>
                                                  <ul style="display:none" class="collection" id="maskapai-list">
                                                          {foreach from=$airline_list key=k item=li}
                                                          <li class="collection-item" onclick="change('{$li->name}','{$li->code_iata}')" id="maskapai-list">
                                                          <p class="nama_bandara title6" style="text-align: left;"> 
                                                            <!-- {$li->name} -->
                                                              <b>{$li->name}</b> <span style="color:#999">({$li->code_iata})<span>
                                                          </p>
                                                          </li>
                                                      {/foreach}
                                                  </ul>
                                                </div>
                                                <div class="col-md-2">
                                                   <label>Dewasa</label> 
                                                   <div class="selector" style="text-align: left;">
                                                      <select id="num_participant_adult" style="width: 170px">
                                                         <option value="1">1</option>
                                                         <option value="2">2</option>
                                                         <option value="3">3</option>
                                                         <option value="4">4</option>
                                                         <option value="5">5</option>
                                                       <!--   <option value="6">6</option>
                                                         <option value="7">7</option>
                                                         <option value="8">8</option>
                                                         <option value="9">9</option>
                                                         <option value="10">10</option> -->
                                                      </select>
                                                   </div>
                                               </div>
                                                <div class="col-md-2">
                                                    <label>Dewasa</label> 
                                                   <div class="selector" style="text-align: left;">
                                                      <select id="num_participant_adult" style="width: 170px">
                                                         <option value="1">1</option>
                                                         <option value="2">2</option>
                                                         <option value="3">3</option>
                                                         <option value="4">4</option>
                                                         <option value="5">5</option>
                                                       <!--   <option value="6">6</option>
                                                         <option value="7">7</option>
                                                         <option value="8">8</option>
                                                         <option value="9">9</option>
                                                         <option value="10">10</option> -->
                                                      </select>
                                                   </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <label>Dewasa</label> 
                                                   <div class="selector" style="text-align: left;">
                                                      <select id="num_participant_adult" style="width: 170px">
                                                         <option value="1">1</option>
                                                         <option value="2">2</option>
                                                         <option value="3">3</option>
                                                         <option value="4">4</option>
                                                         <option value="5">5</option>
                                                       <!--   <option value="6">6</option>
                                                         <option value="7">7</option>
                                                         <option value="8">8</option>
                                                         <option value="9">9</option>
                                                         <option value="10">10</option> -->
                                                      </select>
                                                   </div>
                                                </div>
                                        </div>     
                                    </form>
                                </div>
                                <!-- footer modal -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal" id="find-ticket">Cari Tiket</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End of Modal -->
                <div class="tab-container full-width-style arrow-right dashboard">
                    
                    <div class="seperator"></div>
                        <div class="tab-content" style="float: right;margin-right: 106px;">
                            <div id="booking" class="tab-pane fade active in">
                                <div class="booking-history">
                                    {$i=0}
                                    {$j=0}
                                    {$x=0}
                                    {foreach from=$data key=k item=p}
                                    <div class="booking-info clearfix">
                                        <div class="date" id="{$p->jiDepartDate}">
                                            <input type="hidden" value="{$p->jiDepartDate}" id="dateInput">
                                            <label class="month">{$p->jiDepartMonth}</label>
                                            <label class="date">{$p->jiDepartDate}</label>
                                            <label class="day">{$p->jiDepartDay}</label>
                                        </div>
                                        <h4 class="box-title">
                                            <i class="icon soap-icon-plane-right takeoff-effect yellow-color circle"></i>
                                                <a href="" target="_parent">{$p->jiOrigin}
                                                    <img src="{$base_url}/assets/img/search/to.png" alt="" style="width: 27px;";/>{$p->jiDestination}
                                                </a>
                                                <small>
                                                        {$p->jiDepartTime}<img src="" alt="" style="width: 12px;";/> {$p->jiArrivalTime} 
                                                </small>
                                                        <br>
                                                <small>
                                                <div class="box-title" id="time">
                                                        <img src="{$base_url}/assets/img/image/clock.png" alt="" style="width: 27px;";/>&nbsp;<a href="">{$p->selisih}
                                                </div>
                                                <div class="box-title" id="baggage">
                                                        <img src="{$base_url}/assets/img/image/bagasi.png" alt="" style="width: 27px;";/>&nbsp;<a href="">
                                                </div>
                                                <div class="form-group">
                                             <label>
                                             <a id="show_{$p->airlineID}-{$i++}"><span class="skin-color" onclick="myFunction('{$p->airlineID}_{$x++}')">Detail</span></a>
                                               <div class="wrapper-collapse animate-fadeInUp">
                                                <div class="wrapper-detail">
                                                </label>
                                             </div>
                                          </div>
                                                </h4>                                               
                                                <dl class="info">
                                                    <form method="post" action="{$site_url}/airlines/page_pnr/">
                                                      <!-- startdate=31-03-2020&enddate=03-04-2020&departure_id=ABU&destination_id=ABU&type=OneWay&paxAdult=1&departure_name=Atambua%20(ABU)&destination_name=Atambua%20(ABU)# -->
                                                      <input type="hidden" value="{$p->airlineID}" name="airlineID"/>
                                                      <input type="hidden" value="{$p->jiArrivalDate}" name="depart_date"/>
                                                      <input type="hidden" value="{$p->jiArrivalDate}" name="arrival_date"/>
                                                      <input type="hidden" value="{$startdate}" name="stardate_date"/>
                                                      <input type="hidden" value="{$enddate}" name="return_date"/>
                                                      <input type="hidden" value="{$p->jiDepartDateinfo}" name="jiDepartDateinfo"/>
                                                      <input type="hidden" value="{$p->jiArrivalDateinfo}" name="jiArrivalDateinfo"/>
                                                      <input type="hidden" value="{$p->selisih}" name="selisih"/>
                                                      <input type="hidden" value="{$departure_id}" name="departure_id"/>
                                                      <input type="hidden" value="{$departure_name}" name="departure_name"/>
                                                      <input type="hidden" value="{$destination_id}" name="destination_id"/>
                                                      <input type="hidden" value="{$destination_name}" name="destination_name"/>
                                                      <input type="hidden" value="{$paxAdult}" name="paxAdult"/>
                                                      <input type="hidden" value="{$paxChild}" name="paxChild"/>
                                                      <input type="hidden" value="{$paxInfant}" name="paxInfant"/>
                                                      <input type="hidden" value="{$type}" name="type"/>
                                                      <input type="hidden" value="{$p->journeyReference}" name="journeyReference"/>
                                                      <input type="hidden" value="{$airlineAccessCode}" name="airlineAccessCode"/>
                                                      <input type="hidden" value="journeyReturnReference" name="journeyReturnReference"/>
                                                      
                                                    <dt style="margin-left: 12px;text-align: center;font-size: 22pt;">Harga</dt>
                                                    <br/>
                                                    <dd style="margin-left: 15px;text-align: center;font-size: 15pt;">Rp.&nbsp;{$p->sumPrice}</dd>
                                                    <!-- <dt> -->
                                                    <br>
                                                    <!-- <br> -->
                                                    <!-- <br> -->
                                                    <button type="submit" class="btn-mini chooce pull-center" value="choose">Pilih</button>
                                                    <!-- </dt> -->
                                                    </form>
                                                </dl>
                                            </div>
                                            <div class="booking-info clearfix" style="display:none" id="{$p->airlineID}_{$j++}">
                                                 
                                                    {foreach from=$p->segment key=k item=segment}
                                                    <div class="row">
                                                            {foreach from=$segment->flightDetail key=k item=flight}
                                                            <div class="col-xs-3">
                                                                <div class="box-title" id="flight_logo">
                                                                    <img src="{$base_url}/assets/img/maskapai/{$flight->airlineCode}.png">&nbsp;&nbsp;{$flight->airlineCode}&nbsp;{$flight->flightNumber}
                                                                </div>
                                                                
                                                            </div>
                                                            <div class="col-xs-2" style="margin-right: -149px;">
                                                                <div class="row">
                                                                    <div>
                                                                        <img src="{$base_url}/assets/img/circelawal.png"id="circle-hole">
                                                                    </div>     
                                                                </div>
                                                                <div class="row">
                                                                    <hr class="vertical-line">&nbsp;&nbsp;&nbsp;
                                                                </div>
                                                                <div class="row">
                                                                    <div>
                                                                        <img src="{$base_url}/assets/img/circelakhir.png"id="circle-solid">
                                                                    </div>
                                                                </div>    
                                                            </div>
                                                            <!-- &nbsp;&nbsp;&nbsp; -->
                                                            <div class="col-xs-3">
                                                                <br>
                                                                <div style="position: relative;font-size: 11px;">{assign var="datetime" value="T"|explode:$flight->fdDepartTime}{$datetime[1]}<br>{assign var="date" value="-"|explode:$datetime[0]}{$date[2]}-{$date[1]}-{$date[0]}
                                                                </div>
                                                                <br>
                                                                <br>
                                                                <div style="    position: relative;font-size: 11px;">{assign var="datetime1" value="T"|explode:$flight->fdArrivalTime}{$datetime1[1]}<br>{assign var="date1" value="-"|explode:$datetime1[0]}{$date1[2]}-{$date1[1]}-{$date1[0]}</div>
                                                                <!--<i class="soap-icon-plane-right takeoff-effect"></i> -->
                                                            </div>
                                                            <div class="col-xs-3">
                                                              <div class="row">
                                                                  <div style="font-size: 12pt;margin-left: 7px;">{$flight->depart_city}</div>
                                                                  <div style="font-size: 21pt;float: inherit;">{$flight->depart_airports}</div>
                                                              </div>
                                                              <div class="row"></div>
                                                              <div class="row">
                                                                  <div style="font-size: 12pt;margin-left: 7px;">{$flight->destination_city}</div>
                                                                  <div style="font-size: 21pt;float: inherit;">{$flight->destination_airports}</div>
                                                              </div>
                                                            </div>    
                                                                {/foreach}
                                                      </div> 

                                                        {/foreach}
                                                        <!-- <div id="garis-tepi"></div> -->
                                                       <!--  <div class="col-xs-3 garis-tepi">
                                                            {foreach  from=$p->priceDepart key=k item=priceDepart}
                                                                {foreach from=$priceDepart->priceDetail key=k item=price}
                                                                    <div class="row" style="margin-top: 21px;">
                                                                        &nbsp;&nbsp;&nbsp;<label>{$price->paxType}</label> 
                                                                        <div class="pull-right" style="position: relative;left: 161px;">
                                                                            Base Fare:{$price->baseFare}</br>   
                                                                            Tax:{$price->tax}</br>
                                                                            <hr style="border-color:black;margin-bottom: 1px;margin-top: 5px;">
                                                                            Total Fare:{$price->totalFare}
                                                                        </div>
                                                                           
                                                                    </div>
                                                                {/foreach}
                                                            {/foreach}
                                                        </div>   -->
                                                    
                                            </div>  
                                        {/foreach}  
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        </div>
        <div id="ex1" class="modal">
            <p>Thanks for clicking. That felt good.</p>
            <a href="#" rel="modal:close">Close</a>
        </div>
</section>
<script type="text/javascript">
function myFunction(id) {
    console.log(id);
    var target = document.getElementById(id)
    if (target.style.display === "none") {
        target.style.display = "block";
    } else {
        target.style.display = "none";
    }
}

// function choose_airline(element_id){
//     console.log(element_id);
//     if(element_id=='all_choose'){
//         // alert('ada')
//         document.getElementById('checked').checked=true;
//     }
// }

var json_arr = {$data|json_encode};
// var arr = JSON.parse(json_arr.sumPrice)
var arr = [];
// console.log(arr);
jQuery(document).ready(function($) {

    $("#all_choose").click(function(){
        $("._checkbox").attr("checked",true);
    })

    console.log(json_arr[0].sumPrice);

    var i=0;
    var j=0;
    $.each(json_arr,function(key,obj){
        console.log(obj.sumPrice);
        arr.push(0);
        arr.push(obj.sumPrice.replace(',','')*1);
        j++;
    })

    console.log(j)

    var x = document.getElementById("snackbar");    
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);

    // $(".chooce").click(function(){
    //      window.location = '{$site_url}/airlines/page_pnr?';
    // });
   
   $("#sort-by-name active").click(function(){

   });

   $("#maskapai").click(function(){
        $(".by-name").toggle(200);
        
        if($(".by-name").show()){
            $(".by-depart").hide(200)
        }else if($(".by-rating").show()){
            $(".by-rating").hide(200);
        }
   });

   $("#keberangkatan").click(function(){
        $(".by-depart").toggle(200);

        if($(".by-depart").show()){
            $(".by-name").hide(200)
        }else if($(".by-rating").show()){
            $(".by-rating").hide(200);
        }
   });

   $("#harga").click(function(){
        $(".by-rating").toggle(200);

        if($(".by-rating").show()){
            $(".by-depart").hide(200)
        }else if($(".by-name").show()){
            $(".by-name").hide(200);
        }
   });

   // $("#find-ticket").click(function(){
   //      window.location = '{$site_url}/airlines/page?';
   // });
   // var test =[0,500]

   $(".slider").slider({
      range: true,
      min: 0,
      max: arr[j-1],
      values:arr,
      slide: function( event, ui ) {
        console.log(ui.value)

        $( "#amount" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ]);
      }
    });

   //  $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
   //    " - $" + $( "#slider-range" ).slider( "values", 1 ) );
   //  });

});
</script>