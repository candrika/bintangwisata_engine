function change_airlines(name,code) { 
      
  document.getElementById("cb_maskapai").value = name + " ("+code+")";
  document.getElementById("airlinesCode").value = code;

}       

function change_departure(city,airport,code) { 
      
  document.getElementById("cb_origin").value  =city +" ("+code+")";
  document.getElementById("origin_code").value = code;

} 
  
function change_destination(city,airport,code) { 
     
  document.getElementById("cb_arrival").value =city +" ("+code+")";
  document.getElementById("arrival_code").value = code;

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

function choose_airline_class(element){
    console.log(element)
    var x = document.getElementById("snackbar");    
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);

    var schDeparts=[];
    var schReturns=[];

    var airlineID = document.getElementById("page_airlineID").value;
    var type = document.getElementById("page_type").value;
    var depart_date = document.getElementById("page_departdate").value;
    var departure_id = document.getElementById("page_departid").value;
    var destination_id = document.getElementById("page_destid").value;
    var paxAdult = document.getElementById("page_paxAdult").value;
    var paxChild = document.getElementById("page_paxChild").value;
    var paxInfant = document.getElementById("page_paxInfant").value;
    var airlineAccessCode = document.getElementById("page_airlineAccessCode").value;
    var bool = 0;

    schDeparts.push({"airlineCode":airlineID});
    schDeparts.push({"flightNumber":document.getElementById(element).getAttribute("data-flight-number")});
    schDeparts.push({"schOrigin":departure_id});
    schDeparts.push({"schDestination":destination_id});
    schDeparts.push({"detailSchedule":document.getElementById(element).getAttribute("data-subclass")});
    schDeparts.push({"schDepartTime":document.getElementById(element).getAttribute("data-flight-fddeparttime")});
    schDeparts.push({"schArrivalTime":document.getElementById(element).getAttribute("data-flight-fdarrivaltime")});
    schDeparts.push({"flightClass":document.getElementById(element).getAttribute("data-classiid")});
    schDeparts.push({"garudaNumber":document.getElementById(element).getAttribute("data-garudaNumber")});
    schDeparts.push({"garudaAvailability":document.getElementById(element).getAttribute("data-garudaAvailability")});
    
    document.getElementById("airlineID").value=airlineID;
    document.getElementById("flightNumber").value=document.getElementById(element).getAttribute("data-flight-number");
    document.getElementById("departure_id").value=departure_id;
    document.getElementById("destination_id").value=destination_id;
    document.getElementById("subclass").value=document.getElementById(element).getAttribute("data-subclass");
    document.getElementById("fddeparttime").value=document.getElementById(element).getAttribute("data-flight-fddeparttime");
    document.getElementById("fdarrivaltime").value=document.getElementById(element).getAttribute("data-flight-fdarrivaltime");
    document.getElementById("classiid").value=document.getElementById(element).getAttribute("data-classiid");
    document.getElementById("garudaNumber").value=document.getElementById(element).getAttribute("data-garudaNumber");
    document.getElementById("garudaAvailability").value=document.getElementById(element).getAttribute("data-garudaAvailability");
    
    var data = JSON.stringify({
      "airlineID":airlineID,
      "tripType":type,
      "origin":departure_id,
      "destination":destination_id,
      "departDate":depart_date,
      "returnDate":"",
      "paxAdult":paxAdult,
      "paxChild":paxChild,
      "paxInfant":paxInfant,
      "promoCode":"",
      "schDeparts":schDeparts,
      "schReturns":schReturns
    });

    //start ajax request
    var xhr = new XMLHttpRequest();
    // xhr.whitesmoke
    xhr.addEventListener("readystatechange",function(){
        if(this.readyState===4){
          var decode = JSON.parse(this.responseText)
          console.log(decode.priceDepart[0].flightNumber)
          document.getElementById("header_price_airline"+'-'+decode.airlineID+'-'+decode.priceDepart[0].flightNumber.replace(' ','')).style.display="block";
          document.getElementById("header_price_airline"+'-'+decode.airlineID+'-'+decode.priceDepart[0].flightNumber.replace(' ','')).style.margin.bottom="10px";
          document.getElementById(decode.airlineID+'_'+decode.priceDepart[0].flightNumber.replace(' ','')).innerHTML='Rp. '+decode.total_fare
        }
    })

    xhr.open("POST", "../airlines/Ajaxprice");
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.send(data)
}

function obj_arr(obj,key){
  var total_price =0;
  console.log(obj.priceDetail)

  total_price += obj.priceDetail.totalFare*1; 

  return total_price;
}


// var json_arr = {$data|json_encode};
// // var arr = JSON.parse(json_arr.sumPrice)
// var arr = [];
// console.log(arr);
jQuery(document).ready(function($){
    
    $("#route").val("OneWay");

    $("#cb_one_way").click(function(){
      $(".route_id").val("OneWay");
      $("#cb_one_way").attr("checked",true);
      $("#cb_one_way").prop("disabled",true);
    
    });

    $("#cb_round_trip").click(function() {
                          
      $(".route_id").val("RoundTrip");      
      $("#enddate").prop("disabled", false);
                            
      // if($("#route").val()=="RoundTrip"){
      //    $("#cb_one_way").attr("checked",false);
      //    $("#cb_one_way").prop("disabled",false);

      //    var a = new Date(to_ymd($('#startdate').val()));
      //    $('#enddate').val($('#enddate').val());
      //    var b = new Date(to_ymd($('#enddate').val()));
      //    var diffDays    = dateDiffInDays(a, b);  
      // }                                                     
    });

    $(".origin_id").focus(function () {
      $('#origin-list').slideDown("fast");
      // $('#depart-list').slideUp("fast");
      // $(".airlines_id").addClass("airline-input");
    })

    $("#origin-list").click(function(){
        $("#origin-list").slideUp("fast");   
    }) 

    $(".arrivalID").focus(function () {

      $('#arrival-list').slideDown("fast");
      $('#origin-list').slideUp("fast");
    
    })

    $("#arrival-list").click(function(){
        $("#arrival-list").slideUp("fast");  
    })

    $(".airlinesID").focus(function (){

      $('#item-list').slideDown("fast");
      $('#arrival-list').slideUp("fast");
    
    })

    $("#item-list").click(function(){
        $("#item-list").slideUp("fast");     
    })


    // $('#departure_date').datepicker({
    //   format: 'yyyy-mm-dd',
    //   // autoclose: true,
    //   // todayHighlight: true,
    // })

    // $('#return_date').datepicker({
    //   format: 'yyyy-mm-dd',
    //   // autoclose: true,
    //   // todayHighlight: true,
    // })

    $("#all_choose").click(function(){
        $("._checkbox").attr("checked",true);
    })

    // console.log(json_arr[0].sumPrice);

    // var i=0;
    // var j=0;
    // $.each(json_arr,function(key,obj){
    //     console.log(obj.sumPrice);
    //     arr.push(0);
    //     arr.push(obj.sumPrice.replace(',','')*1);
    //     j++;
    // })

    // console.log(j)

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


  $("#find-ticket").click(function() {
      redirect_order();
  }); 

  function redirect_order(){
                
    window.location = '../airlines/page?airlines_code='+$('#airlinesCode').val()+'&startdate='+$('#departure_date').val()+
                      '&enddate='+$('#return_date').val()+'&departure_id='+$('.depart_id').val()+'&destination_id='
                      +$('.arrival_id').val()+'&type='+$('#route').val()+'&paxAdult='+$("#num_pax_adult").val()
                      +'&departure_name='+$('.origin_id').val()+'&destination_name='+$('.arrivalID').val()
                      +'&paxChild='+$("#num_pax_child").val()+'&paxInfant='+$("#num_pax_infant").val()
                      //+'&airlineAccessCode='+$("#airlineaccessCode").val();  
  }

   // $("#find-ticket").click(function(){
   //      window.location = '{$site_url}/airlines/page?';
   // });
   // var test =[0,500]

   // $(".slider").slider({
   //    range: true,
   //    min: 0,
   //    max: arr[j-1],
   //    values:arr,
   //    slide: function( event, ui ) {
   //      console.log(ui.value)

   //      $( "#amount" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ]);
   //    }
   //  });

   //  $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
   //    " - $" + $( "#slider-range" ).slider( "values", 1 ) );
   //  });

});