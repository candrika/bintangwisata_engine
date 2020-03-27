<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Logout extends MY_Controller {

	public function index()
	{
		$userID = $this->session->userdata('userID');
		$accessToken = $this->session->userdata('userID');
		$token = date("Y-m-d\TH:i:s.uP");
		
		$request = $this->rest_client->post('user_session/login_session',[
			'form_params'=>[
				'userID'=>$userID,
				'accessToken'=>$accessToken,
				'token'=>$token,
				// 'securityCode'=>$securityCode
			]
		]);

		$respone = json_decode($request->getBody());
		
		if($respone->status=="SUCCESS"){
			$this->session->sess_destroy();
			redirect('login');	
			
		}else{
			redirect('logout');
		}
		
	}

}