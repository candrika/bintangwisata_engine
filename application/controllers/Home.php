<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {

	public function index()
	{	
		$userID   = 'HMU5EGTRA2';
		$password = 'HMU555TRA2';
		
		$result = $this->get_auth($userID,$password);

		$res_obj = json_decode($result);

		if($res_obj->status=='SUCCESS'){

			$this->session->set_userdata(array('apikey'=>$response_obj->accessToken,'userID'=>$response_obj->userID));
		} 

		$q = $this->db->query("SELECT *,DATE_FORMAT(now(),'%Y-%m-%d') FROM slider_image WHERE TRUE and deleted=0 and status=1 and deleted=0 
								  AND startdate <= DATE_FORMAT(now(),'%Y-%m-%d')
								  AND enddate >= DATE_FORMAT(now(),'%Y-%m-%d')");
	
			
		$data = $q->result_array();
		$this->smarty->assign('slider_image', $data);	
		$this->smarty->assign('slider_image_dir',ADMIN_URL);
		
		$ul = $this->db->get('airlines')->result();
		$depart_ul = $this->db->query("SELECT * FROM airport")->result();
		
		$arrival_ul = $this->db->query("SELECT * FROM airport")->result();
		
		// print_r($depart_ul);
		$this->smarty->assign('airline_list', $ul);	
		$this->smarty->assign('depart_ul', $depart_ul);	
		$this->smarty->assign('arrival_ul', $arrival_ul);	

		if($this->session->user_type_id!=''){
			$this->smarty->assign('type_user',$this->session->user_type_id);	

		}else{
			$this->smarty->assign('type_user','');	

		}	
	
		
		$this->smarty->assign('content_tpl', 'fligth_schedule.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function get_auth($userID,$password){

		$token = date("Y-m-d\TH:i:s.uP");
		//generate securityCode 
		$securityCode =MD5($token.MD5($password)); 

		$request = $this->rest_client->post('user_session/login_session',[
			'form_params'=>[
				'userID'=>$userID,
				'pass'=>$password,
				'token'=>$token,
				'securityCode'=>$securityCode
			]
		]);

		$respone = $request->getBody();

		return $respone;
	}

	function save_question(){
		$this->load->helper('text');

		$email = $this->input->post('email');
		$message = $this->input->post('message');

		$this->db->trans_begin();

		$d = array(				
			'message_title' => word_limiter($message,5),
			'email' => $email,
			'message_content' => $message,
			'status' => 1,
			'userin'=> 0,
			'datein' => date('Y-m-d H:m:s'),
			'source' => 1
		);

		$this->db->insert('inbox',$d);

		if ($this->db->trans_status() === FALSE)
		{
	        $this->db->trans_rollback();
			$arr_ret = array('success'=>false,'message'=>'Gagal mengirim pesan.');
		} else {
			$this->db->trans_commit();
			$arr_ret = array('success'=>true,'message'=>'Terima kasih telah mengirim pesan kepada kami. Staff kami akan membalas pesan anda max 1 x 24 Jam');
		}

		echo json_encode($arr_ret);
	}

	function contact(){
		if($_POST){
			$this->load->helper('text');

			$email = $this->input->post('email');
			$message = $this->input->post('message');
			$name = $this->input->post('name');
			$subject = $this->input->post('subject');

			$this->db->trans_begin();

			$d = array(				
				'message_title' => $subject,
				'email' => $email,
				'message_content' => $message,
				'status' => 1,
				'userin'=> 0,
				'datein' => date('Y-m-d H:m:s'),
				'source' => 4
			);

			$this->db->insert('inbox',$d);

			if ($this->db->trans_status() === FALSE)
			{
		        $this->db->trans_rollback();
		        $type = 'notice';
				// $arr_ret = array('success'=>false,'message'=>'Gagal mengirim pesan.');
				$content_msg = 'Gagal mengirim pesan. Coba beberapa saat lagi';
			} else {
				$this->db->trans_commit();
				$type = 'success';
				$content_msg = 'Terima kasih telah mengirim pesan kepada kami. Staff kami akan membalas pesan anda max 1 x 24 Jam';
			}

			$this->smarty->assign('title_msg','Kirim Pesan');
			$this->smarty->assign('type',$type);
			$this->smarty->assign('content_msg',$content_msg);
			$this->smarty->assign('content_tpl', 'message.tpl');	

			$this->smarty->display('app_template.tpl');
		}
	}
}