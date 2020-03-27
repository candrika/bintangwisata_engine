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

	// public function schedule_list()
	// {
	// 	//$this->load->model(array('m_order','m_data'));
		

	// 	$data = $this->m_order->order_list($this->session->user_id);

	// 	// $this->smarty->assign('data',$data);

	// 	$this->smarty->assign('home_opt',null);
	// 	$this->smarty->assign('content_tpl', 'user_panel.tpl');	
	// 	$this->smarty->display('app_template.tpl');	
	// }

	public function page(){
		
		// $this->load->model('m_data');

		$departure_id = str_replace('%20', '', $this->input->get('departure_id'));
		$destination_id = str_replace('%20', '', $this->input->get('destination_id'));
		$category = $this->input->get('category');
		$paxAdult = $this->input->get('paxAdult');
		$paxChild = $this->input->get('paxChild');
		$paxInfant = $this->input->get('paxInfant');
		$type = $this->input->get('type');
		$startdate = backdate2($this->input->get('startdate'));

		// echo $type;

		if($type=="OneWay"){
			$enddate = null;

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

		$service_url = API_URL.'Airlines_dummy/Shcedule';

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

				
				$data[$i] = $value;
				$i++;

			}
						
			// print_r($data);
			// die;
			$this->smarty->assign('data',$data);
			// $this->smarty->assign('flightDetail',$flightDetail);
			$this->smarty->assign('home_opt',null);
			$this->smarty->assign('content_tpl', 'shcedule_list.tpl');	
			$this->smarty->display('app_template.tpl');	
			// $new_data =array('journeyDepart'=>) 
		}
		// die;
		
	}
}
?>