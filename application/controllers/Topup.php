<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Topup extends MY_Controller {

	public function index()
	{
		$this->smarty->assign('message',null);
		// print_r();
		$this->smarty->assign('name',ucwords($this->session->userdata('real_name')));
		$this->smarty->assign('content_tpl', 'topup.tpl');
		$this->smarty->display('app_template.tpl');	
	}

	public function ajax_productType(){
		// getProvider
		$post_data =[
			"userID"         => $this->session->userdata('userID'),
		    "accessToken"    => $this->session->userdata('apikey'),
			"productType"    => $this->input->post('prod_category')
		];

		// echo json_encode($post_data);	

		$req = $this->rest_client->post('topup/getProvider',[
			'form_params'=>$post_data,
			'http_errors'=>false
		]);

		$response = json_decode($req->getBody());	

		if($response->status == "SUCCESS"){

			echo json_encode(array('status'=>true,'data'=>$response->data));

		}else{

			echo json_encode(array('status'=>false,'data'=>[]));
		}
	}

	public function ajax_product(){

		$post_data =[
			"userID"         => $this->session->userdata('userID'),
		    "accessToken"    => $this->session->userdata('apikey'),
		    "provider"		 => $this->input->post('provider')
		];

		// echo json_encode($post_data);

		$req = $this->rest_client->post('topup/getProduct',[
			'form_params'=>$post_data,
			'http_errors'=>false
		]);

		$response = json_decode($req->getBody());

		if($response->status=="SUCCESS"){

			echo json_encode(array('status'=>true,'data'=>$response->data));

		}else{
			echo json_encode(array('status'=>false,'data'=>[]));
		}
	}

	public function process(){

		$post_data =[
			"userID"         => $this->session->userdata('userID'),
		    "accessToken"    => $this->session->userdata('apikey'),
		    'productCode'    => $this->input->post('productCode'),
			'MSISDN'         => $this->input->post('MSISDN'),
			'customerID'     => $this->input->post('customerID'),
			'sequence'       => $this->input->post('sequence')
		];

		$req = $this->rest_client->post('topup/OrderProses',[
			'form_params'=>$post_data,
			'http_errors'=>false
		]);

		$response = json_decode($req->getBody());

		// print_r($response);

		if($response->status=="SUCCESS"){

			echo json_encode(array(status=>true,'transaction_status'=>$response->detail_trx->transactionStatus,'data'=>['order_detail'=>$response->order_detail,'detail_trx'=>$response->detail_trx]));

		}else{

			$detail = [
				'transaction_status'=>$response->detail_trx->transactionStatus,
				'message'=>$response->msg->message
			];

			echo json_encode(array('status'=>false,'data'=>$detail));
		}
	}	
}
?>