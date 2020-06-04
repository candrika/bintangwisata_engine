<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ppob extends MY_Controller {

	public function index()
	{
		$this->smarty->assign('message',null);
		// print_r();
		$this->smarty->assign('name',ucwords($this->session->userdata('real_name')));
		$this->smarty->assign('content_tpl', 'ppob.tpl');
		$this->smarty->display('app_template.tpl');	
	}

	function get_product_category(){

		$post_params = [
			"userID" => $this->session->userdata('userID'),
			"accessToken"=>$this->session->userdata('apikey'),
			"productGroup"=>$this->input->post("prod_category")
		];

		// http_errors' => false

		$req = $this->rest_client->post('Ppob/ProductList',[
			'form_params'=>$post_params,
			'http_errors'=>false
		]);

		$resp = $req->getBody();

		$resp_obj=json_decode($resp);

		if($resp_obj->status=='FAILED'){
			if($resp_obj->msg=="member authentication failed"){

				$this->session->sess_destroy();
				// redirect('login');
				echo json_encode(array('url'=>'login'));
			}
		}else{

			echo json_encode($resp_obj->data);
		}
	}

	public function inquery_process(){
		
		$post_params=[

		    "userID"         => $this->session->userdata('userID'),
		    "accessToken"    => $this->session->userdata('apikey'),
		    "productCode"    => $this->input->post('productCode'),
		    "customerID"     => $this->input->post('customerID'),
		    "customerMSISDN" => $this->input->post('customerMSISDN')
		];

		$req = $this->rest_client->post('ppob/InqueryProses',[
			'form_params'=>$post_params,
			'http_errors'=>false
		]);

		$response = json_decode($req->getBody());

		if($response->status=='SUCCESS'){

			echo json_encode(array('status'=>true,'data'=>$response->data));

		}else{
			echo json_encode(array('status'=>false,'message'=>'Proses inquery gagal','data'=>[]));
			return false;	
		}
	}

	public function payment(){

		print_r($this->session->all_userdata());

		$post_params = [
			"userID"             => $this->session->userdata('userID'),
		    "accessToken"        => $this->session->userdata('apikey'),
		    "billingReferenceID" => $this->input->post('billingReferenceID')
		];

		//check member saldo deposit
		
		// $req = $this->rest_client->post('topup/');
	}
}
?>