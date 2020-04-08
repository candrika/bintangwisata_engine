<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Logout extends MY_Controller {

	public function index()
	{
		// echo "samudra";
		$userID = $this->session->userdata('userID');
		$accessToken = $this->session->userdata('apikey');
		$token = date("Y-m-d\TH:i:s.uP");
		
		$request = $this->rest_client->post('user_session/logout_session',[
			'form_params'=>[
				'userID'=>$userID,
				'accessToken'=>$accessToken,
				'token'=>$token,
				// 'securityCode'=>$securityCode
			]
		]);

		$respone = json_decode($request->getBody());
		// print_r($respone);
		// die;
		if($respone->data->status=="SUCCESS"){
			$this->session->sess_destroy();
			// echo base_url('home');
			redirect('');	
			
		}else{
			// redirect('logout');
		}
		
	}

}