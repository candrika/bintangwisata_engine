 <style>
h1 {
  font-size: 20px;
  color: #111;
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
.airline-input{

}

                 ul.collection .collection-item {
                        padding: 10px 10px;
                        border-bottom: 1px solid #ccc;
                 }

                  ul.collection .collection-item p{
                      margin-bottom:0px;
                  }
         @media only screen and (min-width: 300px) and (max-width: 1324px) {
           .center_home_content {
               padding: 30px 0px 0px 0px;
               width: 100%; 
               margin: auto;
           }
           .container {
                margin-right: auto;
                margin-left: auto;
                padding-left: 0px;
                padding-right: 0px;
            }
         }

         @media only screen and (min-width: 1325px) {
           .center_home_content {
               padding: 30px 0px 0px 0px;
               width: 80%; 
               margin: auto;
           }
         }
        
       /* html { 
           background: url(images/travelslider.jpg) no-repeat center center fixed; 
           -webkit-background-size: cover;
           -moz-background-size: cover;
           -o-background-size: cover;
           background-size: cover;
         }*/
         .selector select {
            /* position: absolute; */
            z-index: 1;
            filter: alpha(opacity=0);
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
            -moz-opacity: 0;
            -khtml-opacity: 0;
            opacity: 0;
            width: 200px;
            -webkit-appearance: menulist-button;
            line-height: 30px;
            margin: 0 auto;
         }
         .selector span.custom-select {
            display: inline-block;
            line-height: 32px;
            padding: 0 10px;
            position: relative;
            width: 160px;
            overflow: hidden;
            white-space: nowrap;
         }

         /* Mobile Styles */
         @media only screen and (min-width: 300px) and (max-width: 1324px) {
           .center_home_content {
               padding: 30px 0px 0px 0px;
               width: 100%; 
               margin: auto;
           }
           .container {
                margin-right: auto;
                margin-left: auto;
                padding-left: 0px;
                padding-right: 0px;
            }
         }

         @media only screen and (min-width: 1325px) {
           .center_home_content {
               padding: 30px 0px 0px 0px;
               width: 50%; 
               margin: auto;
           }
         }
 </style>

    <div class="center_home_content">
                        <div class="contact-form">
                          {if $slider_image !=null}
                           <div id="slider1_container" style="visibility: hidden; position: relative; margin: 0 auto; height: 242px; overflow: hidden; border-radius: 10px;">
                           <!-- Loading Screen -->
                           <div data-u="loading" class="jssorl-009-spin" style="position:absolute;top:0px;left:0px;width:100%;height:100%;text-align:center;background-color:rgba(0,0,0,0.7);">
                               <img style="margin-top:-19px;position:relative;top:50%;width:38px;height:38px;" src="../svg/loading/static-svg/spin.svg" />
                           </div>

                           <!-- Slides Container -->
                           <div data-u="slides" style="position: absolute; left: 0px; top: 0px; width: 936px; height: 242px;
                           overflow: hidden;">
                           {foreach from=$slider_image key=k item=v}  
                             
                                  <div>
                                    <img data-u="image" src="{$slider_image_dir}/upload/{$v.slider_image_file}" alt="img"/>
                                  </div>
                            {/foreach}
                               
                              <!--  <div>
                                   <img data-u="image" src="{$base_url}assets/images/header_banner.png" />
                               </div>
                               <div>
                                   <img data-u="image" src="{$base_url}assets/images/header_banner.png" />
                               </div>
                               <div>
                                   <img data-u="image" src="{$base_url}assets/images/header_banner.png" />
                               </div>
                               <div>
                                   <img data-u="image" src="{$base_url}assets/images/header_banner.png" />
                               </div> -->
                           </div>
                           
                           <!--#region Bullet Navigator Skin Begin -->
                           <!-- Help: https://www.jssor.com/development/slider-with-bullet-navigator.html -->
                           <style>
                               .jssorb031 { position:absolute; }
                               .jssorb031 .i { position:absolute;cursor:pointer; }
                               .jssorb031 .i .b { fill:#000;fill-opacity:0.5;stroke:#fff;stroke-width:1200;stroke-miterlimit:10;stroke-opacity:0.3; }
                               .jssorb031 .i:hover .b { fill:#fff;fill-opacity:.7;stroke:#000;stroke-opacity:.5; }
                               .jssorb031 .iav .b { fill:#fff;stroke:#000;fill-opacity:1; }
                               .jssorb031 .i.idn { opacity:.3; }
                           </style>
                           <div data-u="navigator" class="jssorb031" style="position:absolute;bottom:12px;right:12px;" data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
                               <div data-u="prototype" class="i" style="width:16px;height:16px;">
                                   <svg viewBox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                                       <circle class="b" cx="8000" cy="8000" r="5800"></circle>
                                   </svg>
                               </div>
                           </div>
                           <!--#endregion Bullet Navigator Skin End -->
                       
                           <!--#region Arrow Navigator Skin Begin -->
                           <!-- Help: https://www.jssor.com/development/slider-with-arrow-navigator.html -->
                           <style>
                               .jssora051 { display:block;position:absolute;cursor:pointer; }
                               .jssora051 .a { fill:none;stroke:#fff;stroke-width:360;stroke-miterlimit:10; }
                               .jssora051:hover { opacity:.8;}
                               .jssora051.jssora051dn { opacity:.5;}
                               .jssora051.jssora051ds { opacity:.3;pointer-events:none; }
                           </style>
                           <div data-u="arrowleft" class="jssora051" style="width:55px;height:55px;top:0px;left:25px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
                               <svg viewBox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                                   <polyline class="a" points="11040,1920 4960,8000 11040,14080 "></polyline>
                               </svg>
                           </div>
                           <div data-u="arrowright" class="jssora051" style="width:55px;height:55px;top:0px;right:25px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
                               <svg viewBox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                                   <polyline class="a" points="4960,1920 11040,8000 4960,14080 "></polyline>
                               </svg>
                           </div>
                           <!--#endregion Arrow Navigator Skin End -->
                       </div>
                       {/if}
                       <!-- Jssor Slider End -->
                   </div>
 

                            <form action="#" method="post">
                                <div class="row">

                                    <div class="col-sm-12">
                                        <div class="search-box-wrapper style1">
                              <div class="search-box">
                                 <div class="search-tab-content container-content-shadow">
                                   
                                    <div class="tab-pane fade active in" id="flights-tab">
                                       <form>
                                        <input type="text" id="user_type" name="user_type" style="display:none"value="{$type_user}">
                                          <div class="title-container">
                                             <!-- <h2 class="search-title">Jasindo Travel</h2> -->
                                             <!-- <p>Ensure Your Travel.</p> -->
                                             <i class="soap-icon-plane-right takeoff-effect"></i>
                                          </div>
                                          <div class="search-content">
                                             <div class="row">
                                                <div class="col-md-12">
                                                   <input type="hidden" class="input-text  full-width userID" id="userID" value="userID" name="userID">
                                                   <input type="hidden" class="input-text  full-width apikey" id="apikey" value="apikey" name="apikey">
                                                  
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
                                              </div>  
                                             <h5 class="title">Destinasi</h5>
                                             <span id="city_loading" style="display:none;">Mohon tunggu...</span>
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
                                             
                                             <!-- <h5 class="title">Periode</h5> -->
                                             <!-- <label>Mulai</label> -->
                                             <div class="row">
                                                <div class="col-md-6">
                                                   <label>Keberangkatan</label>
                                                   <div class="datepicker-wrap-order">
                                                      <input type="text" id="startdate" class="input-text full-width" placeholder="select date" autocomplete="off" name="depart_date"/>
                                                   </div>
                                                </div>

                                                <div class="col-md-6">
                                                   <label>Kepulangan</label>
                                                   <div class="datepicker-wrap-order">
                                                      <input type="text" id="enddate" class="input-text full-width" placeholder="select date" autocomplete="off" name="return_date"/>
                                                   </div>
                                                </div>
                                             </div>
                                             
                                             <h5 class="title">Jumlah Orang</h5>
                                             <div class="row">
                                                <div class="col-md-4">
                                                  <label>Dewasa</label> 
                                                   <div class="selector" style="text-align: left;">
                                                      <select id="num_participant_adult" style="width: 170px" name="adultPax">
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
                                                <div class="col-md-4">
                                                  <label>Anak</label> 
                                                   <div class="selector" style="text-align: left;">
                                                      <select id="num_participant_child" style="width: 170px" name="childPax">
                                                         <option value="0">0</option>
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
                                                <div class="col-md-4">
                                                  <label>Bayi</label> 
                                                   <div class="selector" style="text-align: left;">
                                                      <select id="num_participant_infant" style="width: 170px" name="infantPax">
                                                         <option value="0">0</option>
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
                                             <div class="row" style="display:none;" id="notif_searchbox">
                                                <div class="col-md-12">
                                                   <!-- {* <hr> *} -->
                                                   <a href="#" class="button green btn-small full-width"><span id="search_msg"></span></a>
                                                </div>
                                             </div>
                                             <div class="row" style="display:none;" id="chapca_info">
                                                <div class="col-md-3">
                                                   <!-- {* <hr> *} -->
                                                   <img src="" alt="" id="myChapca" style="width: 91px;position: relative;left: 1px;border-radius: 10%;">
                                                </div>
                                                <div class="col-md-5">
                                                  <input type="text" id="airlineaccessCode" class="input-text full-width" placeholder="input chapca" autocomplete="off" name="airlineaccessCode" style="position: relative;top: -1px;left: -39px;height: 39px;">
                                                </div>
                                             </div>
                                             <div style="display:none;margin-top: 20px;" id="package_chooser_domestic">
                                                <div class="row image-box style3">
                                                   <div class="col-sm-6 col-md-12">
                                                      <article class="box">
                                                         <div class="details text-center">
                                                            <button id="orderBtn4" class="button btn-small sky-blue1" style="width:100%;" value="4">Lanjutkan</button>
                                                         </div>
                                                      </article>
                                                   </div>
                                                </div>
                                             </div>
                                             
                                          </div>
                                       </form>
                                    </div>
                                 </div>
                              </div>
                           </div>
                                    </div>
                                 
                                </div>
                            </form>

                        </div>
                    </div>
<script type="text/javascript">

jQuery(document).ready(function($) {

  $('form').submit(function(e) {
    e.preventDefault();
  });
                   
                  
  $(".airlines_id").focus(function () {
      $('#maskapai-list').slideDown("fast");
      $('#depart-list').slideUp("fast");
      $(".airlines_id").addClass("airline-input");
  })

  $("#cb_airlines").change(function () {
      set_package();
  })

  $("#cb_depart").change(function() {
       // set_package();
  });
               
  $("#cb_dest").change(function() {
      // set_package();
  });
               
  $("#startdate").change(function() {
      set_package();
  });
 
  $("#enddate").prop("disabled", true);

  $("#enddate").change(function() {
    set_package();
  });
               
  $("#num_participant").change(function() {
    set_package();
  });
               
  $("#cb_family").change(function() {
    set_package();
  });
                   
  var startdate = new Date();
                   
  if(startdate.getDate()<10){
    day = '0'+startdate.getDate()
  }else{
    day = startdate.getDate()

  }

  if(startdate.getMonth()*1 < 10){
    var bulan = '0'+(startdate.getMonth()*1+1);
  }else{
    var bulan = (startdate.getMonth()*1+1);
  }

  var startdate_ymd = day+'-'+bulan+'-'+startdate.getFullYear();
                   
  $("#startdate").val(startdate_ymd);

  $("#route").val("OneWay");

  if($("#route").val()=="OneWay"){
                      
    $("#cb_one_way").attr("checked",true);
    $("#cb_one_way").prop("disabled",true);

    var a = new Date(to_ymd($('#startdate').val()));
    var arr_day = a.getTime()+3*24*60*60*1000;
    var b     = new Date(arr_day);
                       
    if(b.getDate()*1 < 10){
       var date = '0'+b.getDate();
    }else{
       var date = b.getDate();
    }

    if(b.getMonth()*1 < 10){
      var month = '0'+(b.getMonth()*1+1);
    }else{
      var month = (b.getMonth()*1+1);
    }

    var new_b = date+'-'+month+'-'+b.getFullYear();                        
    if($("startdate")!=''){
     $('#enddate').val(new_b);
    }

    var diffDays    = dateDiffInDays(a, b); 
    console.log(diffDays);
  }

  $("#cb_round_trip").click(function() {
                          
    $(".route_id").val("RoundTrip");
    $("#enddate").prop("disabled", false);
                            
    if($("#route").val()=="RoundTrip"){
       $("#cb_one_way").attr("checked",false);
       $("#cb_one_way").prop("disabled",false);

       var a = new Date(to_ymd($('#startdate').val()));
       $('#enddate').val($('#enddate').val());
       var b = new Date(to_ymd($('#enddate').val()));
       var diffDays    = dateDiffInDays(a, b);  
    }                                                     
  });

  $("#cb_one_way").click(function() {
                          
    $(".route_id").val("OneWay");
                      
    if($("#route").val()=="OneWay"){

      $("#cb_round_trip").hide();
      $("#cb_one_way").prop("disabled",true);      
      $("#enddate").prop("disabled", true);  
                        
    }                                  
                    
  });                     

  function set_package(){
    $("#notif_searchbox").hide(200);
    $("#package_chooser").hide(200);

    if($("#route").val()=='OneWay') {

      var a = new Date(to_ymd($('#startdate').val()));
      var arr_day = a.getTime()+3*24*60*60*1000;
      var b     = new Date(arr_day);
                       
      if(b.getDate()*1 < 10){
         var date = '0'+b.getDate();
      }else{
         var date = b.getDate();
      }

      if(b.getMonth()*1 <= 9){
        var bulan = '0'+(b.getMonth()*1+1);
      }else{
        var bulan = (b.getMonth()*1+1);
      }

      var new_b = date+'-'+(bulan)+'-'+b.getFullYear(); 
                          
      if($("startdate")!=''){
        $('#enddate').val(new_b);

      }

      var diffDays    = dateDiffInDays(a, b);         
    }
                       
    if($("#cb_airlines").val()==''){
      $("#notif_searchbox").show(200);
      $('#search_msg').html("Pilih Maskapai");
    }else if($('#cb_depart').val()==''){
      $("#notif_searchbox").show(200);
      $('#search_msg').html("Pilih Keberangkatan");
    } else if($('#cb_dest').val()==''){
      $("#notif_searchbox").show(200);
      $('#search_msg').html("Pilih Tujuan");
    } else if($('#startdate').val()==''){
      $("#notif_searchbox").show(200);
      $('#search_msg').html("Pilih Tanggal Berangkat");
    }  else if($('#enddate').val()==''){
      $("#notif_searchbox").show(200);
                           
      if($("#route").val()=='RoundTrip'){
        $('#search_msg').html("Pilih Tanggal Kembali");
      }
    } else{
      
      $("#package_chooser_domestic").show(1000);
      $('#package_chooser').hide();

      // console.log($("form").serialize());

      $.ajax({
        url:'{$base_url}/home/ajax_response',
        method:'POST',
        data:$("form").serialize(),
        dataType: 'json',
        success:function(data){
         // var obj = JSON.parse(data);
         var img = '{$base_url}upload/chapca/'+data.img;
         $("#myChapca").attr("src",img);
         $("#chapca_info").show();
         console.log(data.img);

        },
        failed:function(data){

        }
      })
    }
                       
  }

  $('.departure_id').focus(function(){
      $('#depart-list').slideDown("fast");
      $('#dest-list').slideUp("fast");
  });

  $('.destination_id').focus(function(){
      $('#dest-list').slideDown("fast");
      $('#depart-list').slideUp("fast");
  });                
                
                
  $("#orderBtn4").click(function() {
      redirect_order($("#orderBtn4").val(),$("#user_type").val());
  });

                
  $("#add_participant_form").click(function(){
      $('#form_participant').clone().appendTo('#list_participant');
  });

  function redirect_order(id,user_type){
                
    window.location = '{$site_url}/airlines/page?airlines_code='+$('#airlines_code').val()+'&startdate='+$('#startdate').val()+'&enddate='+$('#enddate').val()+'&departure_id='+$('.depart_id').val()+'&destination_id='+$('.dest_id').val()+'&type='+$('#route').val()+'&paxAdult='+$("#num_participant_adult").val()+'&departure_name='+$('.departure_id').val()+'&destination_name='+$('.destination_id').val()+'&paxChild='+$("#num_participant_child").val()+'&paxInfant='+$("#num_participant_infant").val()+'&airlineAccessCode='+$("#airlineaccessCode").val();  
                 
  }

  $("#maskapai-list").click(function(){
    $("#maskapai-list").slideUp("fast");
    
  })

  $("#depart-list").click(function(){
    $("#depart-list").slideUp("fast");
    
  }) 

  $("#dest-list").click(function(){
    $("#dest-list").slideUp("fast");  
  })  

});
   
function change(name,code) { 
      
  document.getElementById("cb_airlines").value = name + " ("+code+")";
  document.getElementById("airlines_code").value = code;

}       

function change_depart(city,airport,code) { 
      
  document.getElementById("cb_depart").value  =city +" ("+code+")";
  document.getElementById("depart_code").value = code;

} 
  
function change_arrival(city,airport,code) { 
     
  document.getElementById("cb_dest").value =city +" ("+code+")";
  document.getElementById("dest_code").value = code;

} 

function search_algorithm(inputid, ulid) {
      
  var input, filter, ul, li, a, i;
  input = document.getElementById(inputid);
  filter = input.value.toUpperCase();
  ul = document.getElementById(ulid);
  li = ul.getElementsByTagName("li");
  for (i = 0; i < li.length; i++) {
    a = li[i].getElementsByTagName("p")[0];
    if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
      li[i].style.display = "";
    } else {
      li[i].style.display = "none";

    }
  }
}
</script>

    <script src="{$base_url}assets/libs/imageslider/examples-bootstrap/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="{$base_url}assets/libs/imageslider/examples-bootstrap/ie10-viewport-bug-workaround.js"></script>

    <!-- jssor slider scripts-->
    <script type="text/javascript" src="{$base_url}assets/libs/imageslider/js/jssor.slider.min.js"></script>
    <script>

        jQuery(document).ready(function ($) {
            var options = {
                $AutoPlay: 1,                                       //[Optional] Auto play or not, to enable slideshow, this option must be set to greater than 0. Default value is 0. 0: no auto play, 1: continuously, 2: stop at last slide, 4: stop on click, 8: stop on user navigation (by arrow/bullet/thumbnail/drag/arrow key navigation)
                $AutoPlaySteps: 1,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
                $Idle: 2000,                                        //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                                   //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $ArrowKeyNavigation: 1,                            //[Optional] Steps to go for each navigation request by pressing arrow key, default value is 1.
                $SlideEasing: $Jease$.$OutQuint,                    //[Optional] Specifies easing for right to left animation, default value is $Jease$.$OutQuad
                $SlideDuration: 800,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide, default value is 20
                //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 0,                               //[Optional] Space between each slide in pixels, default value is 0
                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: 1,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $Cols is greater than 1, or parking position is not 0)

                $ArrowNavigatorOptions: {                           //[Optional] Options to specify and enable arrow navigator or not
                    $Class: $JssorArrowNavigator$,                  //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $Steps: 1                                       //[Optional] Steps to go for each navigation request, default value is 1
                },

                $BulletNavigatorOptions: {                          //[Optional] Options to specify and enable navigator or not
                    $Class: $JssorBulletNavigator$,                 //[Required] Class to create navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                    $SpacingX: 12,                                  //[Optional] Horizontal space between each item in pixel, default value is 0
                    $Orientation: 1                                 //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
                }
            };

            if($("#slider1_container").length == 0) {
              //it doesn't exist
            } else {
              var jssor_slider1 = new $JssorSlider$("slider1_container", options);

                //responsive code begin
                //you can remove responsive code if you don't want the slider scales while window resizing
                function ScaleSlider() {
                    var parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth;
                    if (parentWidth) {
                        jssor_slider1.$ScaleWidth(parentWidth - 0);
                    }
                    else
                        window.setTimeout(ScaleSlider, 70);
                }
                ScaleSlider();

                $(window).bind("load", ScaleSlider);
                $(window).bind("resize", ScaleSlider);
                $(window).bind("orientationchange", ScaleSlider);
            }
            
            //responsive code end
        });
    </script>

