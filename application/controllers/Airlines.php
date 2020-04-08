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

		// echo json_encode($post_data);
		// $service_url ='https://api.bintangwisata.com/index.php/Flight/scheduleAll';

		$curl = curl_init();

		$req_data = $this->rest_client->post('Flight/scheduleAll',[
			'form_params'=>$post_data
		]);

		$resp_data = json_decode($req_data->getBody());

		$balikan   = $resp_data->data;

		// print_r($balikan);

		$data = [];
		$data_flight=[];
		$i=0;
		$flightDetail=[];
		$j=0;
		$filter_price=[];
		$z=0;

		// die;
		if ($balikan->status=="FAILED") {
		  	// echo "cURL Error #:" . $err;
		  	// print_r($balikan);
		} else {
			
		  	foreach ($balikan->journeyDepart as $value) {
				# code...
				
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

				$req = $this->rest_client->post('Flight/priceAll',[
					'form_params'=>$price_req_data
				]);

				$resp = json_decode($req->getBody());

				foreach ($value->segment as $key => $v) {
					# code...
					// $v->{'priceDepart'} = $resp->priceDepart;
					// $v->{'priceReturn'} = $resp->priceReturn;
						
					foreach ($v->flightDetail as $key => $flight) {
						# code...
						//aircode 
						// print_r($flight);
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
						
						$j++;
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
			// print_r($data);
			// die;
			
		}

		// $this->smarty->assign('priceDetail',$filter_price);
		$this->smarty->assign('airlines',$data_flight);
		$this->smarty->assign('data',$data);
			
		//form hidden value
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
		//airlineAccessCode

		//assign view template
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
		// echo $resp;
		$array_response = json_decode($req->getBody());
		$priceData = $array_response->data;
		// die;
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
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'pnr_page.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function get_Allprice(){

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