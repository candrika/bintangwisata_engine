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
		$startdate = backdate2($this->input->get('startdate'));

		// echo $type;

		if($type=="OneWay"){
			$enddate = "";

		}else if($type=='RoundTrip'){
			$enddate = backdate2($this->input->get('enddate'));
		}

		$post_data = json_encode(array(
			"userID" =>$this->session->userdata('userID'),
			"accessToken"=>$this->session->userdata('accessToken'),
			"tripType" => $type,
			"origin" => $departure_id,
			"destination" => $destination_id,
			"departDate" => $startdate,
			"returnDate" => $enddate,
			"paxAdult" => $paxAdult,
			"paxChild" => $paxChild,
			"paxInfant" => $paxInfant,
			"airlineAccessCode" => " ",
			"cacheType" => "Mix",
			"isShowEachAirline" => false
		));

		$service_url = API_INTERNAL.'Airlines_dummy/Shcedule';

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
			// echo $curl_response;
		  	$arr = json_decode($curl_response);	
		  	// print_r($arr);
		  	$data = [];
		  	$i=0;
		  	$flightDetail=[];
		  	$j=0;

		  	foreach ($arr->journeyDepart as $value) {
				# code...
				
				$DepartDateTime = explode('T',$value->{'jiDepartTime'});
				$jiArrivalTime = explode('T',$value->{'jiArrivalTime'});
				
				$value->{'jiDepartTime'}  = $DepartDateTime[1];
				$value->{'jiDepartDate'}  = $DepartDateTime[0];	
				$value->{'jiArrivalTime'} = $jiArrivalTime[1];
				$human_date = strtotime($jiArrivalTime[0]);				
				$value->{'jiDepartDate'}  = date('d',$human_date);
				$value->{'jiDepartMonth'} = date('F',$human_date);
				$value->{'jiDepartDay'}  = date('D',$human_date);

				$value->{'jiArrivalTime'} = $jiArrivalTime[1];
				
				$awal  = strtotime($value->{'jiDepartTime'}); //waktu awal
				$akhir = strtotime($value->{'jiArrivalTime'}); //waktu akhir

				$diff  = $akhir - $awal;

				$jam   = floor($diff / (60 * 60));

				$menit = $diff - $jam * (60 * 60);

				$value->{'sumPrice'} = number_format($value->{'sumPrice'});
				
				$value->{'selisih'} = $jam.' jam '.floor( $menit / 60 ).'menit';

				$price_req_data = array(
				   "airlineID" => $value->{'airlineID'},
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

				$req = $this->rest_client->post('Airlines_dummy/price_all',[
					'form_params'=>$price_req_data
				]);

				$resp = json_decode($req->getBody());

				$value->{'priceDepart'} = $resp->priceDepart;
				$value->{'priceReturn'} = $resp->priceReturn;
				
				$data[$i] = $value;
				$i++;

			}
			
			//set sort airlines
			$airlineID = $this->db->get('airlines')->result();	
			$z=0;
			foreach ($airlineID as $key => $val_airlineID) {
				# code...
				// $options[$z] = $val_airlineID->
			}		
			
			// assign to smarty;
			// $this->smarty->assign('cb_participant',form_dropdown('num_participant', $options, $num_person, ' id="num_participant" '));
			
			$this->smarty->assign('data',$data);
			$this->smarty->assign('departure_name',$departure_name);
			$this->smarty->assign('destination_name',$destination_name);
			$this->smarty->assign('startdate',getHumanDate($startdate));
			$this->smarty->assign('enddate',getHumanDate($enddate));
			$this->smarty->assign('paxAdult',($paxAdult));
			$this->smarty->assign('paxChild',($paxChild));
			$this->smarty->assign('paxInfant',($paxInfant));
			$this->smarty->assign('home_opt',null);
			$this->smarty->assign('content_tpl', 'shcedule_list.tpl');	
			$this->smarty->display('app_template.tpl');	 
		}
	}

	function page_pnr(){

		$airlineID = $this->input->get('airlineID');
		$type = $this->input->get('type');
		
		if($this->input->get('departure_id')!=null){
			$departure_id     = str_replace('%20','', $this->input->get('departure_id'));

		}else{
			$departure_id     = null;

		}
		
		if($this->input->get('destination_id')!=null){
			$destination_id     = str_replace('%20', '', $this->input->get('destination_id'));

		}else{
			$destination_id   = null;
			
		}
		
		if($this->input->get('destination_name')!=''){
		 	$destination_name =str_replace('%20', '', $this->input->get('departure_name'));

		}else{
			$destination_name = null;
		}

		if($this->input->get('departure_name')!=''){
		 	$departure_name   = str_replace('%20', '', $this->input->get('destination_name'));

		}else{
			$departure_name   = null;
		}

		if($this->input->get('startdate')!=''){
		 	$startdate   =$this->input->get('startdate');

		}else{
			$startdate   = backdate2(date('Y-m-d'));
		}

		if($this->input->get('enddate')!=''){
		 	$enddate   =$this->input->get('enddate');

		}else{
			$enddate   = null;
		}

		$num_person = $this->input->get('num_person');
		$paxAdult = $this->input->get('paxAdult');
		$paxChild = $this->input->get('paxChild');
		$paxInfant = $this->input->get('paxInfant');

		for($i=1;$i<=5;$i++){
			$options[$i] = $i;
		}

		$this->smarty->assign('cb_participant',form_dropdown('num_participant', $options, $num_person, ' id="num_participant" '));

		//assign to smarty
		$this->smarty->assign('paxAdult',$paxAdult);
		$this->smarty->assign('paxChild',$paxChild);
		$this->smarty->assign('paxInfant',$num_person);
		$this->smarty->assign('num_person',$num_person);
		$this->smarty->assign('departure_id',$departure_id);
		$this->smarty->assign('destination_id',$destination_id);
		$this->smarty->assign('destination_name',$destination_name);
		$this->smarty->assign('departure_name',$departure_name);
		$this->smarty->assign('birthdate',backdate2(date('Y-m-d')));
		$this->smarty->assign('startdate',$startdate);
		$this->smarty->assign('enddate',$enddate);
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'pnr_page.tpl');	
		$this->smarty->display('app_template.tpl');	
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
}
?>