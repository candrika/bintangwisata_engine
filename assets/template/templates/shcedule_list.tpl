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
ul.collection{
  border: 1px solid #aaa;
  /* display: none; */
  max-height: 300px;
  overflow-y: scroll;
  position: absolute;
  /* top: 104px; */
  background: #fff;
  width: 375px;
  z-index: 15;
                    
}

.modal {
  text-align: center;
  padding: 0!important;
}

.modal:before {
  content: '';
  display: inline-block;
  height: 100%;
  vertical-align: middle;
  margin-right: -4px;
}

.modal-dialog {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}
ul.collection .collection-item {
    padding: 10px 10px;
    border-bottom: 1px solid #ccc;
}
ul.collection .collection-item p{
    margin-bottom:0px;
}
#return_date{
    z-index:1151 !important;
}

.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
    padding: 8px;
    line-height: 1.42857143;
    vertical-align: top;
     border-top: 1px solid #fff; 
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
                                            | Bayi {$paxInfant}
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
                                                          <!-- {foreach from=$airlines key=k item=plane} -->
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
                                                          <!-- {/foreach} -->
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
                    <div id="form-search-again" class="modal fade" tabindex="-1" role="dialog">
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
                                                   <!-- <input type="hidden" class="input-text  full-width userID" id="userID" value="userID" name="userID">
                                                   <input type="hidden" class="input-text  full-width apikey" id="apikey" value="apikey" name="apikey"> -->
                                                   <label>Dari</label>
                                                   <input type="hidden" class="input-text  full-width depart_id" id="origin_code" name="depart_code">
                                                   <input type="text" class="input-text full-width origin_id" autocomplete="off" placeholder="Ketikkan kota keberangkatan" id="cb_origin" name="departure_id"  onkeyup="search_algorithm('cb_origin','origin-list')"/>
                                                   <ul style="display:none" class="collection" id="origin-list">
                                                          {foreach from=$depart_ul key=k item=depart}
                                                          <li class="collection-item" onclick="change_departure('{$depart->city}','{$depart->airport_name}','{$depart->airport_code}')" id="origin-list">
                                                          <p class="nama_bandara title6" style="text-align: left;"> 
                                                            
                                                              <b>{$depart->city}</b> - <span style="color:#999">{$depart->airport_name}&nbsp;({$depart->airport_code})<span>
                                                          </p>
                                                          </li>
                                                      {/foreach}
                                                  </ul>
                                                </div>
                                                <div class="col-md-6">
                                                   <label>Tujuan</label>
                                                   <input type="hidden" class="input-text  full-width arrival_id" id="arrival_code" name="dest_code">
                                                    <input type="text" class="input-text full-width arrivalID" autocomplete="off"  onkeyup="search_algorithm('cb_arrival','arrival-list')" placeholder="Ketikkan kota tujuan" id="cb_arrival" name="destination_id"/>
                                                    <ul style="display:none" class="collection" id="arrival-list">
                                                          {foreach from=$arrival_ul key=k item=arrival}
                                                          <li class="collection-item" onclick="change_destination('{$arrival->city}','{$arrival->airport_name}','{$arrival->airport_code}')" id="arrival-list">
                                                          <p class="nama_bandara title6" style="text-align: left;"> 
                                                            
                                                              <b>{$arrival->city}</b> - <span style="color:#999">{$arrival->airport_name}&nbsp;({$arrival->airport_code})<span>
                                                          </p>
                                                          </li>
                                                      {/foreach}
                                                  </ul>
                                                </div>
                                        </div>
                                        <div class="row">
                                            <input type="text" class="input-text full-width route_id" placeholder="Ketikkan kota tujuan" id="route" name="route_id" 
                                                style="display:none" value=""/>
                                            <div class="col-md-6">
                                                <div>
                                                     <label class="radio radio-inline radio-square checked">
                                                     <input type="radio" name="route_type" checked="checked" value="1" id="cb_one_way">Oneway
                                                     </label>
                                                     <label class="radio radio-inline radio-square">
                                                     <input type="radio" name="route_type" value="2" id="cb_round_trip">Roundtrip
                                                     </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                                <div class="col-md-6">
                                                   <label>Keberangkatan</label>
                                                    <div class="datepicker-wrap">
                                                      <input type="text" id="departure_date" class="input-text full-width" placeholder="select date" data-provide="datepicker"/>
                                                   </div>
                                                </div>

                                                <div class="col-md-6">
                                                   <label>Kepulangan</label>
                                                    <div class="datepicker-wrap">
                                                      <input type="text" id="return_date" class="input-text full-width" placeholder="select date" data-provide="datepicker"/>
                                                   </div>
                                                </div>
                                             </div>
                                        <div class="row">
                                             <div class="col-md-6">
                                                  <h5 class="title">Maskapai</h5>
                                                   <!-- <label>Maskapai</label> -->
                                                   <input type="hidden" class="input-text  full-width airlinesCode" id="airlinesCode" name="airlines_code">
                                                   <input type="text" class="input-text full-width airlinesID" autocomplete="off" placeholder="Ketikkan kota maskapai" id="cb_maskapai" name="airlines_id" onkeyup="search_algorithm('cb_maskapai','item-list')"/>
                                                  <ul style="display:none" class="collection" id="item-list">
                                                          {foreach from=$airline_list key=k item=li}
                                                          <li class="collection-item" onclick="change_airlines('{$li->name}','{$li->code_iata}')" id="item-list">
                                                          <p class="nama_bandara" style="text-align: left;"> 
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
                                                      <select id="num_pax_adult" style="width: 170px">
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
                                                      <select id="num_pax_child" style="width: 170px">
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
                                                      <select id="num_pax_infant" style="width: 170px">
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
                                    {$xi=0}
                                    {$xx=0}
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
                                                    {if $type eq 'OneWay'}
                                                    <form method="post" action="{$site_url}/airlines/preview_detail/">
                                                    {else if $type eq 'RoundTrip'}
                                                    <form method="post" action="{$site_url}/airlines/round_trip_page/">

                                                    {/if}
                                                      <!-- startdate=31-03-2020&enddate=03-04-2020&departure_id=ABU&destination_id=ABU&type=OneWay&paxAdult=1&departure_name=Atambua%20(ABU)&destination_name=Atambua%20(ABU)# -->
                                                      <input type="hidden" value="{$p->airlineID}" name="airlineID" id="page_airlineID"/>
                                                      <input type="hidden" value="{$p->jiArrivalDate}" name="depart_date" id="page_departdate"/>
                                                      <input type="hidden" value="{$p->jiArrivalDate}" name="arrival_date" id="page_arrivaldate"/>
                                                      <input type="hidden" value="{$return_date}" name="returndate" id="page_returndate"/>
                                                      <input type="hidden" value="{$startdate}" name="stardate_date" id="page_stardatedate"/>
                                                      <input type="hidden" value="{$enddate}" name="return_date" id="page_return_date"/>
                                                      <input type="hidden" value="{$p->jiDepartDateinfo}" name="jiDepartDateinfo" id="page_Departinfo"/>
                                                      <input type="hidden" value="{$p->jiArrivalDateinfo}" name="jiArrivalDateinfo" id="page_Arrivalinfo"/>
                                                      <input type="hidden" value="{$p->selisih}" name="selisih"/>
                                                      <input type="hidden" value="{$departure_id}" name="departure_id" id="page_departid"/>
                                                      <input type="hidden" value="{$departure_name}" name="departure_name" id="page_departname"/>
                                                      <input type="hidden" value="{$destination_id}" name="destination_id" id="page_destid"/>
                                                      <input type="hidden" value="{$destination_name}" name="destination_name" id="page_destname"/>
                                                      <input type="hidden" value="{$paxAdult}" name="paxAdult" id="page_paxAdult"/>
                                                      <input type="hidden" value="{$paxChild}" name="paxChild" id="page_paxChild"/>
                                                      <input type="hidden" value="{$paxInfant}" name="paxInfant" id="page_paxInfant"/>
                                                      <input type="hidden" value="{$type}" name="type" id="page_type"/>
                                                      <input type="hidden" value="{$p->category}" name="category" id="category"/>
                                                      <input type="hidden" value="{$p->category}" name="category" id="category"/>
                                                      <input type="hidden" value="{$airlineCode}" name="airlineCode" id="airlineCode"/>
                                                      {foreach from=$p->segment key=k item=sgm}
                                                        
                                                        {foreach from=$sgm->flightDetail key=k item=flg}
                                                            <input type="hidden" value="{$flg->airlineCode}" name="flight[0]" id="flg_id"/>
                                                            <input type="hidden" value="{$flg->flightNumber}" name="flight[1]" id="flg_id"/>
                                                            <input type="hidden" value="{$flg->fdDepartTime}" name="flight[2]" id="flg_id"/>
                                                            <input type="hidden" value="{$flg->fdArrivalTime}" name="flight[3]" id="flg_id"/>
                                                            <input type="hidden" value="{$flg->fdOrigin}" name="flight[4]" id="flg_id"/>
                                                            <input type="hidden" value="{$flg->fdDestination}" name="flight[5]" id="flg_id"/>
                                                            <input type="hidden" value="{$flg->routeInfo}" name="flight[6]" id="flg_id"/>
                                                        {/foreach}                                                  
                                                        {foreach from=$sgm->availableDetail key=k item=availDetail}
                                                            <input type="hidden" value="{$availDetail->availabityStatus}" name="available[0]" id="availDetail_id"/>
                                                            <input type="hidden" value="{$availDetail->classiId}" name="available[1]" id="availDetail_id"/>
                                                            <input type="hidden" value="{$availDetail->price}" name="available[2]" id="availDetail_id"/>
                                                            <input type="hidden" value="{$availDetail->flightClass}" name="available[3]" id="availDetail_id"/>
                                                            <input type="hidden" value="{$availDetail->subClass}" name="available[4]" id="availDetail_id"/>
                                                            <input type="hidden" value="{$availDetail->cabin}" name="available[5]" id="availDetail_id"/>
                                                            <input type="hidden" value="{$availDetail->airlineSegmentCode}" name="available[6]" id="availDetail_id"/>
                                                        {/foreach} 
                                                            <input type="hidden" value="{$sgm->garudaNumber}" name="garudaNumber" id="availDetail_id"/>
                                                            <input type="hidden" value="{$sgm->garudaAvailability}" name="garudaAvailability" id="availDetail_id"/>

                                                      {/foreach}
                                                      <input type="hidden" value="{$p->sumPrice}" name="sumPrice" id="page_sumPrice"/>
                                                      <input type="hidden" value="{$p->journeyReference}" name="journeyReference" id="page_journeyReference"/>
                                                      <input type="hidden" value="{$airlineAccessCode}" name="airlineAccessCode" id="page_airlineAccessCode"/>
                                                     
                                                    {if $airlineCode eq "AL"}
                                                    <dt style="margin-left: 12px;text-align: center;font-size: 22pt;">Harga</dt>
                                                    <br/>
                                                    <dd style="margin-left: 15px;text-align: center;font-size: 15pt;" id="price_all_airlines">Rp.&nbsp;{$p->sumPrice}</dd>
                                                    {else}
                                                    <input type="hidden" value="" name="airlineCode" id="airlineID">
                                                    <input type="hidden" value="" name="flightNumber" id="flightNumber">
                                                    <input type="hidden" value="" name="departure_id" id="departure_id">
                                                    <input type="hidden" value="" name="destination_id" id="destination_id">
                                                    <input type="hidden" value="" name="detailSchedule" id="subclass">
                                                    <input type="hidden" value="" name="fddeparttime" id="fddeparttime">
                                                    <input type="hidden" value="" name="fdarrivaltime" id="fdarrivaltime">
                                                    <input type="hidden" value="" name="flightClass" id="classiid">
                                                    <input type="hidden" value="" name="garudaNumber" id="garudaNumber">
                                                    <input type="hidden" value="" name="garudaAvailability" id="garudaAvailability">

                                                    <dt style="margin-left: 12px;text-align: center;font-size: 22pt;display:none"id="header_price_airline-{$p->airlineID}-{$p->segment[{$xx}]->flightDetail[{$xi}]->flightNumber}">Harga</dt>
                                                    <dd style="margin-left: 15px;text-align: center;font-size: 10pt;" id="{$p->airlineID}_{$p->segment[{$xx}]->flightDetail[{$xi}]->flightNumber}">Pilih kursi untuk menampilkan Harga</dd>
                                                    {/if}
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
                                                    {$zi=0}
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
                                                            <div class="col-xs-2">
                                                                <br>
                                                                <div style="position: relative;font-size: 11px;">{assign var="datetime" value="T"|explode:$flight->fdDepartTime}{$datetime[1]}<br>{assign var="date" value="-"|explode:$datetime[0]}{$date[2]}-{$date[1]}-{$date[0]}
                                                                </div>
                                                                <br>
                                                                <br>
                                                                <div style="    position: relative;font-size: 11px;">{assign var="datetime1" value="T"|explode:$flight->fdArrivalTime}{$datetime1[1]}<br>{assign var="date1" value="-"|explode:$datetime1[0]}{$date1[2]}-{$date1[1]}-{$date1[0]}</div>
                                                                <!--<i class="soap-icon-plane-right takeoff-effect"></i> -->
                                                            </div>
                                                            <div class="col-xs-2">
                                                              <br>
                                                              <div class="row">
                                                                  <div style="font-size: 12pt;margin-left: 7px;">{$flight->depart_city}</div>
                                                                  <div style="font-size: 18pt;float: inherit;">{$flight->depart_airports}</div>
                                                              </div>
                                                              <div class="row"></div>
                                                              <div class="row">
                                                                  <div style="font-size: 12pt;margin-left: 7px;">{$flight->destination_city}</div>
                                                                  <div style="font-size: 18pt;float: inherit;">{$flight->destination_airports}</div>
                                                              </div>
                                                            </div>
                                                            {/foreach}
                                                            <div class="col-xs-2">
                                                                <div class="table-responsive-sm">
                                                                    <table class="table">
                                                                        <tr>
                                                                        {foreach  from=$segment->availableDetail key=k item=available}
                                                                          <td>
                                                                            <span>{$available->flightClass}</span><br>
                                                                                <div class="form-check">
                                                                                    <label class="form-check-label" for="inlineRadio1">
                                                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="{$available->flightClass}_{$p->airlineID}_{$segment->flightDetail[0]->flightNumber}" value="{$available->flightClass}" data-availabityStatus="{$available->availabityStatus}" data-classiId="{$available->classiId}" data-subClass="{$available->subClass}" data-flight-number="{$segment->flightDetail[0]->flightNumber}" data-flight-fdDepartTime="{$segment->flightDetail[0]->fdDepartTime}" data-flight-fdArrivalTime="{$segment->flightDetail[0]->fdArrivalTime}" data-garudaNumber="{$segment->garudaNumber}" data-garudaAvailability="{$segment->garudaAvailability}" onclick="choose_airline_class('{$available->flightClass}_{$p->airlineID}_{$segment->flightDetail[0]->flightNumber}')"/>
                                                                                    </label>
                                                                                </div>
                                                                            <br>
                                                                            <span>{$available->availabityStatus}</span>
                                                                          </td>  
                                                                        {/foreach}
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                                
                                                      </div> 

                                                        <!-- {/foreach} -->
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