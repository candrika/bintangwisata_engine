<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Airlines extends MY_Controller {

	function index(){

	}

	function get_route(){

		$airlineID = $_GET['airlines_code'];

		// $q = $this->db->query("select code_iata,name from airlines where code_iata like '%".$airlineID."%'")->row();

		// print_r($q);

		$post_data = json_encode(array(
			"userID" =>$this->session->userdata('userID'),
			"accessToken"=>$this->session->userdata('accessToken'),
			"airlineID"=>$airlineID
		));

		// print_r($post_data);
		
		$service_url = API_URL.'Airlines/Route';

		// echo $service_url;

		$curl = curl_init();

		curl_setopt($curl, CURLOPT_URL, $service_url);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($curl, CURLOPT_POST, 1);
		curl_setopt($curl, CURLOPT_POSTFIELDS, $post_data);
		curl_setopt($curl, CURLOPT_HTTPHEADER, 
			array(
				'Content-Type: application/json',
				'Connection: Keep-Alive'
			));	
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);

		$curl_response = curl_exec($curl);		
		$err = curl_error($curl);

		curl_close($curl);

		if ($err) {
		  	echo "cURL Error #:" . $err;
		} else {
		  	echo  $curl_response;
		  	// $response_obj = json_decode($curl_response);

			// if($response_obj->status=='FAILED'){
			// 	print_r($response_obj);
			// }else{

			// 	$this->session->set_userdata(array('apikey'=>$response_obj->accessToken,'userID'=>$response_obj->userID));
			// }
		}
	}


	public function page(){
		
		// $this->load->model('m_data');

		$departure_id = str_replace('%20','', $this->input->get('departure_id'));
		$destination_id = str_replace('%20', '', $this->input->get('destination_id'));
		$departure_name  = str_replace('%20', '', $this->input->get('departure_name'));
		$destination_name  = str_replace('%20', '', $this->input->get('destination_name'));
		$category = $this->input->get('category');
		$paxAdult = $this->input->get('paxAdult');
		$paxChild = $this->input->get('paxChild');
		$paxInfant = $this->input->get('paxInfant');
		$type = $this->input->get('type');
		$airline_code = $this->input->get('airlines_code');
		$startdate = backdate2($this->input->get('startdate'));

		if($this->input->get('airlineAccessCode')!=null){
			$airlineAccessCode = $this->input->get('airlineAccessCode');

		}else{
			$airlineAccessCode = null;

		}

		// print_r($this->session->all_userdata());

		if($type=="OneWay"){
			$enddate = "";

		}else if($type=='RoundTrip'){
			$enddate = backdate2($this->input->get('enddate'));
		}

		
		$post_data = array(
			"userID" =>$this->session->userdata('userID'),
			"accessToken"=>$this->session->userdata('apikey'),
			"tripType" => $type,
			"origin" => $departure_id,
			"destination" => $destination_id,
			"departDate" => $startdate,
			"returnDate" => $enddate,
			"paxAdult" => $paxAdult,
			"paxChild" => $paxChild,
			"paxInfant" => $paxInfant,
			"airlineAccessCode" => $airlineAccessCode,
			"cacheType" => "FullLive",
			"isShowEachAirline" => false
		);

		
		$curl = curl_init();

		if($airline_code=='AL'){
			
			$req_data = $this->rest_client->post('Flight/scheduleAll',[
				'form_params'=>$post_data
			]);	
		}else{
			$post_data['airlineID'] = $airline_code;
			
			$req_data = $this->rest_client->post('Flight/schedule_airline',[
				'form_params'=>$post_data
			]);
		}

		
		$resp_data = json_decode($req_data->getBody());

		$balikan   = $resp_data->data;

		//decrated empty array		
		$data = [];
		$data_flight=[];
		$data_flight_return=[];
		$flightDetail=[];
		$filter_price=[];

		$flight_number = null;

		$i=0;
		$j=0;
		$z=0;
		$x=0;

		// die;
		if ($balikan->status=="FAILED") {
			$this->smarty->assign('message','Opps.. Tidak ada jadwal pesawat silahkan cari penerbangan lainya');
		} else {
			
		  	foreach ($balikan->journeyDepart as $value) {
				# code...
				
				if($airline_code=="AL"){
					$airlineID = $value->{'airlineID'};
				}else{
					$airlineID = $balikan->airlineID;
				}

				$value->{'airlineID'} = $airlineID;


				if($airline_code=="AL"){
					$sumPrice = $value->{'sumPrice'};
				}else{
					$sumPrice = null;
				}

				$value->{'sumPrice'} = $sumPrice;

				if($airline_code=="AL"){
					$journeyReference = $value->{'journeyReference'};
				}else{
					$journeyReference = null;
				}

				$value->{'journeyReference'} = $journeyReference;

				$DepartDateTime = explode('T',$value->{'jiDepartTime'});
				$jiArrivalTime = explode('T',$value->{'jiArrivalTime'});
				
				$value->{'jiDepartTime'}  = $DepartDateTime[1];
				$value->{'jiDepartDate'}  = $DepartDateTime[0];	

				$human_date = strtotime($DepartDateTime[0]);				
				
				$value->{'jiDepartDate'}  = date('d',$human_date);
				$value->{'jiDepartMonth'} = date('F',$human_date);
				$value->{'jiDepartDay'}   = date('D',$human_date);

				$value->{'jiArrivalDate'} = $jiArrivalTime[0];
				$value->{'jiArrivalTime'} = $jiArrivalTime[1];
				
				$value->{'jiDepartDateinfo'} =  backdate2($DepartDateTime[0])." ".$jiArrivalTime[1];
				$value->{'jiArrivalDateinfo'} = backdate2($jiArrivalTime[0])." ".$jiArrivalTime[1];
				
				$awal  = strtotime($value->{'jiDepartTime'}); //waktu awal
				$akhir = strtotime($value->{'jiArrivalTime'}); //waktu akhir

				$diff  = $akhir - $awal;

				$jam   = floor($diff / (60 * 60));

				$menit = $diff - $jam * (60 * 60);

				$value->{'sumPrice'} = number_format($value->{'sumPrice'});
				
				$value->{'selisih'} = $jam.' jam '.floor( $menit / 60 ).'menit';

				$price_req_data = array(
				   "userID" =>$this->session->userdata('userID'),
			       "accessToken"=>$this->session->userdata('apikey'),
				   "airlineID" => $airlineID,
				   "origin" => $value->{'jiOrigin'},
				   "destination" => $value->{'jiDestination'},
				   "tripType" => $type,
				   "departDate" => $startdate,
				   "returnDate" => $enddate,
				   "paxAdult" => $paxAdult,
				   "paxChild" => $paxChild,
				   "paxInfant"=> $paxInfant,
				   "airlineAccessCode" => "",
				   "journeyDepartReference" => $value->{'journeyReference'},
				   "journeyReturnReference" => "",
				);

				$req = $this->rest_client->post('Flight/priceAll',[
					'form_params'=>$price_req_data
				]);

				$resp = json_decode($req->getBody());
				
				if($resp !=''){
					$value->{'priceDepart'} = $resp->data;
				}

				foreach ($value->segment as $key => $v) {
					# code...

					foreach ($v->flightDetail as $key => $flight) {
						# code...
						//aircode
						$flight_number =$flight->flightNumber;

						$airlines = $this->db->get_where('airlines',array('code_iata'=>$flight->{'airlineCode'}))->row();
						
						//detail airport
						$airport_depart       = $this->db->get_where('airports',array('airport_code'=>$flight->{'fdOrigin'}))->row();
						$airport_destination  = $this->db->get_where('airports',array('airport_code'=>$flight->{'fdDestination'}))->row();

						$flight->{'depart_city'}      = $airport_depart->city;
						$flight->{'depart_airports'}  = $airport_depart->airport_name;

						$flight->{'destination_city'}     = $airport_destination->city;
						$flight->{'destination_airports'} = $airport_destination->airport_name;

						// $data_flight[$j]['name']=$airlines->name;
						// $data_flight[$j]['code']=$flight->{'airlineCode'};
						
						$depart_datetime = explode('T', $flight->{'fdDepartTime'});
						$data_flight[$j]['depart_time']=$depart_datetime[1];

						if(isset($flight->{'depart_city'})){

						}else{
							$flight->{'depart_city'}=null;
						}

						if(isset($flight->{'depart_airports'})){

						}else{
							$flight->{'depart_airports'}=null;
							
						}

						if(isset($flight->{'destination_city'})){

						}else{
							$flight->{'depart_airports'}=null;
							
						}

						if(isset($flight->{'destination_airports'})){

						}else{
							$flight->{'destination_airports'}=null;
							
						}
						
						$j++;
					}

					foreach ($v->availableDetail as $key => $available) {
						# code...

						if(isset($available->availabityStatus)){

						}else{
							$available->availabityStatus=null;
						}

						if(isset($available->price)){

						}else{
							$available->price=null;
						}

						if(isset($available->classiId)){

						}else{
							$available->classiId=null;
						}

	                    if(isset($available->subClass)){

	                    }else{
							$available->subClass=null;	                     	
						}

						if(isset($available->cabin)){

	                    }else{
							$available->cabin=null;	                     	
						}

						// AIRLINESEGMENTCODE
						if(isset($available->airlineSegmentCode)){

	                    }else{
							$available->airlineSegmentCode=null;	                     	
						}
					}

					if(isset($v->garudaAvailability)){

					}else{
						$v->garudaAvailability=null;
					}

					if(isset($v->garudaNumber)){

					}else{
						$v->garudaNumber=null;
					}

					// foreach ($v->priceDepart as $key => $priceDepart) {
					// 	# code...
						 
					// 	foreach ($priceDepart->priceDetail as $key => $priceDetail) {
					// 		# code...
					// 		// print_r($priceDepart);
					// 		$filter_price[$z] = $priceDetail;
					// 		$z++;
					// 	}
					// }

					// print_r($v);
				}
				
				$data[$i] = $value;
				$i++;

			}

			if($balikan->journeyReturn!=null){
				foreach ($balikan->journeyReturn as $key => $journeyReturn) {
					# code...
					$data_flight_return[$x] = $journeyReturn;
					$x++;
				}
			}

			$this->smarty->assign('message',null);	
		}
		// die;	
		//
		// print_r($data);
		// die;
		$ul = $this->db->get('airlines')->result();
		$depart_ul = $this->db->query("SELECT * FROM airports")->result();	
		$arrival_ul = $this->db->query("SELECT * FROM airports")->result();

		$this->smarty->assign('depart_ul', $depart_ul);	
		$this->smarty->assign('arrival_ul', $arrival_ul);
		$this->smarty->assign('airlines',$data_flight);
		$this->smarty->assign('data',$data);
		$this->smarty->assign('data_flight_return',$data_flight_return);
		$this->smarty->assign('airlineCode',$airline_code);
		$this->smarty->assign('airline_list', $ul);	
		$this->smarty->assign('flight_number', $flight_number);	

		//form hidden value
		// $this->smarty->assign('type',$type);
		$this->smarty->assign('type',$type);
		$this->smarty->assign('depart_date',$startdate);
		$this->smarty->assign('return_date',$enddate);
		$this->smarty->assign('departure_id',$departure_id);
		$this->smarty->assign('destination_id',$destination_id);
		$this->smarty->assign('departure_name',$departure_name);
		$this->smarty->assign('destination_name',$destination_name);
		$this->smarty->assign('startdate',getHumanDate($startdate));
		$this->smarty->assign('enddate',getHumanDate($enddate));
		$this->smarty->assign('paxAdult',($paxAdult));
		$this->smarty->assign('paxChild',($paxChild));
		$this->smarty->assign('paxInfant',($paxInfant));
		$this->smarty->assign('paxInfant',($paxInfant));
		$this->smarty->assign('airlineAccessCode',($airlineAccessCode));
	
		//assign view template
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'shcedule_list.tpl');	
		$this->smarty->display('app_template.tpl');	 
	}

	function preview_detail(){
		// returndate
		if($this->input->post('airlineCode')=='AL'){
			$price_req_data = array(
				"userID" =>$this->session->userdata('userID'),
				"accessToken"=>$this->session->userdata('apikey'),
				"airlineID" =>$this->input->post('airlineID'),
				"origin" => $this->input->post('departure_id'),
				"destination" => $this->input->post('destination_id'),
				"tripType" => $this->input->post('type'),
				"departDate" => $this->input->post('depart_date'),
				"returnDate" => $this->input->post('returndate'),
				"paxAdult" => $this->input->post('paxAdult'),
				"paxChild" => $this->input->post('paxChild'),
				"paxInfant"=> $this->input->post('paxInfant'),
				"airlineAccessCode" =>  $this->input->post('airlineAccessCode'),
				"journeyDepartReference" => $this->input->post('journeyReference'),
				"journeyReturnReference" => "",
			);



			$req = $this->rest_client->post('Flight/priceAll',[
				'form_params'=>$price_req_data
			]);

			$resp = json_decode($req->getBody());
			$data = $resp->data;
		}else{
			
			$schDeparts=array(
				"airlineCode"=>$this->input->post('airlineCode'),
		        "flightNumber"=>$this->input->post('flightNumber'),
		        "schOrigin" =>$this->input->post('departure_id'),
		        "schDestination" =>$this->input->post('destination_id'),
		        "detailSchedule"=>$this->input->post('detailSchedule'),
		        "schDepartTime"=>$this->input->post('fddeparttime'),
		        "schArrivalTime"=>$this->input->post('fdarrivaltime'),
		        "flightClass"=>$this->input->post('flightClass'),
		        "garudaNumber"=>$this->input->post('garudaNumber'),
		        "garudaAvailability"=>$this->input->post('garudaAvailability')

			);

			$price_req_data = array(
				"userID" =>$this->session->userdata('userID'),
				"accessToken"=>$this->session->userdata('apikey'),
				"airlineID" =>$this->input->post('airlineID'),
				"origin" => $this->input->post('departure_id'),
				"destination" => $this->input->post('destination_id'),
				"tripType" => $this->input->post('type'),
				"departDate" => $this->input->post('depart_date'),
				"returnDate" => $this->input->post('returndate'),
				"paxAdult" => $this->input->post('paxAdult'),
				"paxChild" => $this->input->post('paxChild'),
				"paxInfant"=> $this->input->post('paxInfant'),
				"promoCode" =>"",
				"journeyDepartReference" => $this->input->post('journeyReference'),
				"schDeparts" => array($schDeparts),
				"schReturn" => array(),
			);

			
			$req = $this->rest_client->post('Flight/price',[
				'form_params'=>$price_req_data
			]);

			$resp = json_decode($req->getBody());
			$data = $resp;
		}

		//set value
		$array_oneWay =array(
			 "airlineID"=> $this->input->post('airlineID'),
	         "jiDepartTime"=> $this->input->post('depart_date'),
	         "jiArrivalTime"=> $this->input->post('arrival_date'),
	         "jiOrigin"=> $this->input->post('departure_id'),
	         "jiDestination"=> $this->input->post('destination_id'),
	         "category"=>$this->input->post('category'),
	         "segment"=>array(
	         	"flightDetail"=>$_POST['flight'],
	         	"availableDetail"=>$_POST['available'],
	         	"garudaNumber"=>$this->input->post('garudaNumber'),
	         	"garudaAvailability"=>$this->input->post('garudaAvailability')
	         ),
	         "sumPrice"=>$this->input->post('sumPrice'),
	         "journeyReference"=>$this->input->post('journeyReference')
		);

		$this->session->set_userdata($array_oneWay);
		
		$awal = strtotime($_POST['flight'][2]); //waktu awal
		$akhir = strtotime($_POST['flight'][3]); //waktu akhir

		$diff  = $akhir - $awal;

		$jam   = floor($diff / (60 * 60));
		
		$menit = $diff - $jam * (60 * 60);

		$aktual_time = $jam.'Jam '.floor($menit/60).'Menit';

		$departDateTIme = explode('T', $_POST['flight'][2]);
		$DepartDate = backdate2($departDateTIme[0]);

		$arrivalDateTIme = explode('T', $_POST['flight'][3]);
		$ArrivalDate = backdate2($arrivalDateTIme[0]);

		$_POST['flight'][2] = $DepartDate.' '.$departDateTIme[1];
		$_POST['flight'][3] = $ArrivalDate.' '.$arrivalDateTIme[1];
		
		//set value 
		$this->smarty->assign('airlineID',$this->input->post('airlineID'));
		$this->smarty->assign('depart_date',$this->input->post('depart_date'));
		$this->smarty->assign('stardate_date',$this->input->post('stardate_date'));
		$this->smarty->assign('arrival_date',$this->input->post('arrival_date'));
		$this->smarty->assign('departure_id',$this->input->post('departure_id'));
		$this->smarty->assign('departure_name',$this->input->post('departure_name'));
		$this->smarty->assign('destination_id',$this->input->post('destination_id'));
		$this->smarty->assign('destination_name',$this->input->post('destination_name'));
		$this->smarty->assign('type',$this->input->post('type'));
		$this->smarty->assign('paxAdult',$this->input->post('paxAdult'));
		$this->smarty->assign('paxChild',$this->input->post('paxChild'));
		$this->smarty->assign('paxInfant',$this->input->post('paxInfant'));
		$this->smarty->assign('flight',$_POST['flight']);
		$this->smarty->assign('available',$_POST['available']);
		$this->smarty->assign('aktual_time',$aktual_time);
		$this->smarty->assign('garudaNumber',$this->input->post('garudaNumber'));
		$this->smarty->assign('garudaAvailability',$this->input->post('garudaAvailability'));
		$this->smarty->assign('departPrice',$data);
		$this->smarty->assign('airlineCode',$this->input->post('airlineCode'));

		//assign view template		
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'preview_detail.tpl');	
		$this->smarty->display('app_template.tpl');	 
	}

	function full_schedule_flight(){
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'shcedule_list.tpl');	
		$this->smarty->display('app_template.tpl');
	}

	function page_pnr(){

		$airlineID = $this->input->post('airlineID');
		$type = $this->input->post('type');
		
		if($this->input->post('airlineAccessCode')!=null){
			$airlineAccessCode     =  $this->input->post('airlineAccessCode');

		}else{
			$airlineAccessCode     = null;
		}

		if($this->input->post('depart_date')!=null){
			$depart_date     =  $this->input->post('depart_date');

		}else{
			$depart_date     = null;
		}

		if($this->input->post('arrival_date')!=null){
			$arrival_date     =  $this->input->post('arrival_date');

		}else{
			$arrival_date     = null;
		}

		if($this->input->post('jiDepartDateinfo')!=null){
			$jiDepartDateinfo     =  $this->input->post('jiDepartDateinfo');

		}else{
			$jiDepartDateinfo     = null;
		}

		if($this->input->post('jiArrivalDateinfo')!=null){
			$jiArrivalDateinfo     =  $this->input->post('jiArrivalDateinfo');

		}else{
			$jiArrivalDateinfo     = null;
		}

		if($this->input->post('selisih')!=null){
			$selisih     = $this->input->post('selisih');

		}else{
			$selisih     = null;
		}

		if($this->input->post('departure_id')!=null){
			$departure_id     = str_replace('%20','', $this->input->post('departure_id'));

		}else{
			$departure_id     = null;
		}
		
		if($this->input->post('destination_id')!=null){
			$destination_id     = str_replace('%20', '', $this->input->post('destination_id'));

		}else{
			$destination_id   = null;
		}
		
		if($this->input->post('departure_name')!=''){
		 	$departure_name =str_replace('%20', '', $this->input->post('departure_name'));

		}else{
			$departure_name = null;
		}

		if($this->input->post('destination_name')!=''){
		 	$destination_name   = str_replace('%20', '', $this->input->post('destination_name'));

		}else{
			$destination_name   = null;
		}

		if($this->input->post('stardate_date')!=''){
		 	$startdate   =$this->input->post('stardate_date');

		}else{
			$startdate   = backdate2(date('Y-m-d'));
		}

		if($this->input->post('return_date')!=''){
		 	$enddate   =$this->input->post('return_date');

		}else{
			$enddate   = null;
		}

		$num_person = $this->input->post('num_person');
		
		if ($this->input->post('paxAdult')!='') {
			
			$paxAdult = $this->input->post('paxAdult');

		}else{
			$paxAdult = 0;

		}

		if ($this->input->post('paxChild')!='') {
			
			$paxChild = $this->input->post('paxChild');

		}else{
			$paxChild = 0;

		}

		if ($this->input->post('paxInfant')!='') {
			$paxInfant = $this->input->post('paxInfant');
			
		}else{
			$paxInfant = 0;
		}
		

		for($i=1;$i<=5;$i++){
			$options[$i] = $i;
		}

		$price_req_data = array(
			"userID" =>$this->session->userdata('userID'),
			"accessToken"=>$this->session->userdata('apikey'),
			"airlineID" => $airlineID,
			"origin" => $departure_id,
			"destination" => $destination_id,
			"tripType" => $type,
			"departDate" => $depart_date,
			"returnDate" => null,
			"paxAdult" => $paxAdult,
			"paxChild" => $paxChild,
			"paxInfant"=> $paxInfant,
			"airlineAccessCode" => $airlineAccessCode,
			"journeyDepartReference" => $this->input->post('journeyReference'),
			"journeyReturnReference" => "",
		);
		// echo json_encode($price_req_data);

		$req = $this->rest_client->post('Flight/priceAll',[
			'form_params'=>$price_req_data
		]);

		$resp = $req->getBody();
		$array_response = json_decode($req->getBody());
		$priceData = $array_response->data;
		
		$kode_negara = $this->db->get('country')->result_array();

		// $j=0;
		// $country_code = [];
		// $country_code = [];
		// foreach ($kode_negara as $key => $value) {
		// 	# code...
		// 	$country_code[$j] = $value->{'country_code'}; 
		// 	$country_name[$j] = $value->{'country_name'};

		// 	$j++;
		// }

		//set value
		$this->smarty->assign('country_code',$kode_negara);
		// $this->smarty->assign('country_name',$country_name);
		$this->smarty->assign('cb_participant',form_dropdown('num_participant', $options, $num_person, ' id="num_participant" '));
		$this->smarty->assign('airlinePrice',$priceData);
		$this->smarty->assign('airlineID',$airlineID);
		$this->smarty->assign('DepartDateinfo',$jiDepartDateinfo);
		$this->smarty->assign('ArrivalDateinfo',$jiArrivalDateinfo);
		$this->smarty->assign('depart_date',$depart_date);
		$this->smarty->assign('arrival_date',$arrival_date);
		$this->smarty->assign('selisih',$selisih);
		$this->smarty->assign('paxAdult',$paxAdult);
		$this->smarty->assign('paxChild',$paxChild);
		$this->smarty->assign('paxInfant',$paxInfant);
		$this->smarty->assign('num_person',$num_person);
		$this->smarty->assign('departure_id',$departure_id);
		$this->smarty->assign('destination_id',$destination_id);
		$this->smarty->assign('destination_name',$destination_name);
		$this->smarty->assign('departure_name',$departure_name);
		$this->smarty->assign('birthdate',backdate2(date('Y-m-d')));
		$this->smarty->assign('startdate',$startdate);
		$this->smarty->assign('enddate',$enddate);
		
		//assign template
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'pnr_page.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function Ajaxprice(){

		if ($_SERVER["REQUEST_METHOD"] === "POST") {
			
			$data = json_decode(file_get_contents("php://input"), true);
			
			$data['userID']=$this->session->userdata('userID');
			$data['accessToken']=$this->session->userdata('apikey');
			
			$arr_depart = [];
			
			$arr_depart['airlineCode'] = $data['schDeparts'][0]['airlineCode'];
			$arr_depart['flightNumber'] = $data['schDeparts'][1]['flightNumber'];
			$arr_depart['schOrigin'] = $data['schDeparts'][2]['schOrigin'];
			$arr_depart['schDestination'] = $data['schDeparts'][3]['schDestination'];
			$arr_depart['detailSchedule'] = $data['schDeparts'][4]['detailSchedule'];
			$arr_depart['schDepartTime'] = $data['schDeparts'][5]['schDepartTime'];
			$arr_depart['schArrivalTime'] = $data['schDeparts'][6]['schArrivalTime'];
			$arr_depart['flightClass'] = $data['schDeparts'][7]['flightClass'];
			$arr_depart['garudaNumber'] = $data['schDeparts'][8]['garudaNumber'];
			$arr_depart['garudaAvailability'] = $data['schDeparts'][9]['garudaAvailability'];
			
			$data['schDeparts'] = array($arr_depart);

			if(!empty($data['schReturns'])){

			}else{
				$data['schReturns'] =array();
			}

			$request = $this->rest_client->post('flight/price',[
				'form_params'=>$data
			]);

			$response = json_decode($request->getBody());
			// print_r($response);

			$json = [];
			$total_fare = null;

			foreach ($response->priceDepart as $key => $value) {
				# code...
				foreach ($value->priceDetail as $key => $v) {
					# code...
					$total_fare +=$v->{'totalFare'};
				}
			}
			
			$json['airlineID'] = $response->{'airlineID'};
			$json['origin'] = $response->{'origin'};
			$json['destination'] = $response->{'destination'};
			$json['returnDate'] = $response->{'returnDate'};
			$json['paxAdult'] = $response->{'paxAdult'};
			$json['paxChild'] = $response->{'paxChild'};
			$json['paxInfant'] = $response->{'paxInfant'};
			$json['priceDepart']=$response->priceDepart;
			$json['total_fare'] = number_format($total_fare);

			echo json_encode($json);
			//4210217741
		}
	}

	function input_pnr(){

		// {
		// 	"userID" : "UserAPI",
		// 	"accessToken":"064125474f1f4e9538440a5e31b952fd",
		// 	"airlineID" : "QZ",
		// 	"tripType" : "OneWay",
		// 	"origin" : "SUB",
		// 	"destination" : "CGK",
		// 	"departDate" : "2015-11-21",
		// 	"returnDate" : "",
		// 	"paxAdult" : "1",
		// 	"paxChild" : "0",
		// 	"paxInfant" : "0",
		// 	"schDepart" : " 0~O~~O02H00~AAB1~~45~X|QZ~7681~ ~~SUB~11/21/2015 05:30~CGK~11/21/2015 06:40~",
		// 	"schReturn" : "",
		// 	"contactTitle" : "MR",
		// 	"contactFirstName" : "Garry",
		// 	"contactLastName" : "Cokie",
		// 	"contactCountryCodePhone" : "62",
		// 	"contactAreaCodePhone" : "856",
		// 	"contactRemainingPhoneNo" : "55308669",
		// 	"insurance" : "", 
		// 	"paxDetails" : 
		// 	[
		// 	      {
		// 	          "IDNumber" : "1122334455",
		// 	          "title" : "MR",
		// 	          "firstName" : "Garry",
		// 	          "lastName" : "Cokie",
		// 	          "birthDate" : "1980-08-17",
		// 	          "gender" : "Male",
		// 	          "nationality" : "ID",
		// 	          "birthCountry" : "ID",
		// 	          "parent" : "",
		// 	          "passportNumber" : "",
		// 	          "passportIssuedCountry" : "",
		// 	          "passportIssuedDate" : "",
		// 	          "passportExpiredDate" : "",
		// 	          "type":"Adult",
		// 	     }
		// 	] 
		// }

	}

	public function scrap_natoin_code(){

		$clien = new GuzzleHttp\Client();

		$body = '<th data-field="name" data-sortable="true">';

		$req = $clien->request('GET','https://id.wikipedia.org/wiki/Daftar_bendera_negara_di_dunia',[
			'headers' => [
        		'Content-Type' => 'text/plain',
    		],
			'body'=> $body
		]);

		$resp = $req->getBody();
		
		echo $resp;
	}

	public function getStringBetween($text,$sebelum,$sesudah){
		$text= ''.$text;
		$ini = strpos($text, $sebelum);
		if($ini==0)
			return '';
		$ini +=strlen($sebelum);
		$panjang = strripos($text, $ini, $panjang);
		return substr($text, $ini,$panjang);
	}
}
?>