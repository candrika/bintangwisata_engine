
tjq(document).ready(function() {
   

   // tjq("#question_message_footer").on('keyup', function (e) {

   //      if (e.keyCode == 13) {
           
        	 

   //      }

   //  });

   // $("#").click(function() {
   //   alert('s')
   //  });

   tjq('#btn_submit_message_footer').on( "click", function() {
        submit_message_footer();
    });

   function submit_message_footer(){
    if(tjq('#question_email_footer').val()==='' || tjq('#question_message_footer').val()===''){
      alert('Lengkapi email atau pesan terlebih dahulu');
    } else {
      tjq.ajax({ 
          type: 'POST', 
          url: SITE_URL+'/home/save_question', 
          data: { 
            email: tjq('#question_email_footer').val(),
            message: tjq('#question_message_footer').val()
          }, 
          dataType: 'json',
          success: function (data) { 
            console.log(data);

            tjq('#question_box').hide(1000);
            tjq('#question_box_result').show(1000);
            tjq('#question_box_result').html(data.message);
            
          }
      });
    }
    
   }
   
});

function validateInputText(el_id,el_span){
  if(tjq(el_id).val()==''){
      tjq(el_span).text('Wajib Disi');
      tjq(el_span).css("color", "red");
      return false;
   } else {
      tjq(el_span).text('');
      tjq(el_span).css("color", "green");
      return true;
   }
}


function validateEmail(email) {
  // console.log(email);
  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}

var _MS_PER_DAY = 1000 * 60 * 60 * 24;
function dateDiffInDays(a, b) {
  // Discard the time and time-zone information.
  var utc1 = Date.UTC(a.getFullYear(), a.getMonth(), a.getDate());
  var utc2 = Date.UTC(b.getFullYear(), b.getMonth(), b.getDate());

  return Math.floor((utc2 - utc1) / _MS_PER_DAY);
}

function to_ymd(date){
  // var date = "03-11-2014";
  var newdate = date.split("-").reverse().join("-");
  return newdate;
}

function email_checking(email){
  tjq.ajax({ 
        type: 'GET', 
        async:false,
        url: SITE_URL+'/order/email_checking', 
        data: { 
          email: email
        }, 
        dataType: 'json',
        success: function (data) { 
          console.log(data);

          tjq('#question_box').hide(1000);
          tjq('#question_box_result').show(1000);
          tjq('#question_box_result').html(data.message);
          
        }
    });
}

function getAge(dateString) {
  var today = new Date();
  var birthDate = new Date(dateString);
  var age = today.getFullYear() - birthDate.getFullYear();
  var m = today.getMonth() - birthDate.getMonth();
  if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
    age--;
  }
  return age+=1;
}

