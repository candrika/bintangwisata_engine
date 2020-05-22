<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller {

	public function index()
	{
		$this->smarty->assign('message',null);
		$this->smarty->assign('prod_id',null);
		$this->smarty->assign('content_tpl', 'login.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function check_ajax(){

	}

	function forgot(){
		$this->smarty->assign('message',null);
		$this->smarty->assign('content_tpl', 'request_pass_form.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function create_new_pass(){
		$token = $this->input->get('id');
		$this->smarty->assign('token',$token);
		$this->smarty->assign('title_msg',null);
		$this->smarty->assign('type','notice');

		if($_POST){
			$password = $this->input->post('password');
			$password2 = $this->input->post('password2');
			$token = $this->input->post('token');

			if($password!=$password2){
				$this->smarty->assign('message','Kata kunci tidak sama. Mohon ulangi lagi.');	
				$this->smarty->assign('content_tpl', 'create_pass_form.tpl');		
			} else {
				$this->db->where('token_forgot_pass',$token);
				$this->db->update('users',array('password'=>$password,'token_forgot_pass'=>null));

				$this->smarty->assign('title_msg',null);
				$this->smarty->assign('type','success');
				$this->smarty->assign('content_msg','Kata kunci berhasil diubah');		
				$this->smarty->assign('content_tpl', 'message.tpl');
			}

		} else {
			$q = $this->db->get_where('users',array('token_forgot_pass'=>$token));
			if($q->num_rows()>0){
				$this->smarty->assign('message',null);	
				$this->smarty->assign('content_tpl', 'create_pass_form.tpl');		
			} else {
				$this->smarty->assign('content_msg','Terjadi kegagalan. Mohon hubungi administrator.');		
				$this->smarty->assign('content_tpl', 'message.tpl');			
			}	
		}
		
		
			
		$this->smarty->display('app_template.tpl');	
	}

	function request_new_pass(){
		if($_POST){
			$email = $this->input->post('email');

			$q = $this->db->get_where('users',array('email'=>$email));
			if($q->num_rows()>0){
				$r = $q->row();

				$token = $this->gen_token();

				$this->db->where('user_id',$r->user_id);
				$this->db->update('users',array('token_forgot_pass'=>$token));

				$this->send_email_req_pass($email,$token);

				$this->smarty->assign('message', '<font color=white>Instruksi pembuatan password baru telah dikirimkan ke alamat email Anda. Terima Kasih.</font>');
			} else {
				$this->smarty->assign('message', '<font color=red>Email yang Anda masukkan tidak terdaftar</font>');	
			}
			$this->smarty->assign('content_tpl', 'request_pass_form.tpl');		
			$this->smarty->display('app_template.tpl');	
		}
	}

	function gen_token(){
		 $random_string_length = 120;
		 $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
		 $string = '';
		 $max = strlen($characters) - 1;
		 for ($i = 0; $i < $random_string_length; $i++) {
		      $string .= $characters[mt_rand(0, $max)];
		 }
		 return $string;
	}

	function send_email_req_pass($email,$token){
		$this->email->initialize(array(
		  'protocol' => 'smtp',
		  'smtp_host' => 'smtp.sendgrid.net',
		  'smtp_user' => 'persaki',
		  'smtp_pass' => 'persaki123',
		  'charset' => 'utf-8',
		  'mailtype' => 'html',
		  'smtp_port' => 587,
		  'crlf' => "\r\n",
		  'newline' => "\r\n"
		));

		// $this->email->attach(DOCUMENTROOT."assets/tpl/images/logo.png", "inline");
		$this->email->from($this->settings['sender_mail_address'], 'Jasindo Travel');
		$this->email->to($email);
		$this->email->subject('Permintaan Kata Kunci Baru');

		$data = array(
			'token_forgot_pass'=>$token,
			'email'=>$email
		);
		$data['address'] = $this->settings['company_address'];
		// $this->load->view('req_new_pass',$data);
		$text = $this->load->view('req_new_pass',$data,TRUE);
		$this->email->message($text);
		$this->email->send();
	}

	function check(){

		if($_POST){
			$mode = $this->input->post('mode');
			$prod_id = $this->input->post('prod_id');

			$q = $this->db->get_where('users',array(
				'email'=>$this->input->post('email'),
				'password'=>$this->input->post('password')
				));
			if($q->num_rows()>0){
				$d = $q->result_array()[0];
				$this->session->set_userdata($d);

				// $this->session->set_userdata(array('logged'=>true));

				$cek_member = $this->db->get_where('users',array(
					'email'=>$this->input->post('email'),
					'password'=>$this->input->post('password')
				));

				if($cek_member->num_rows() > 0){
					
					$r_member = $cek_member->row(); 

					$userID   = 'HMU5EGTRA2';
					$password = 'HMU555TRA2';
					
					
					$token = date("Y-m-d\TH:i:s.uP");
					$securityCode =MD5($token.MD5($password)); 
					
					$request = $this->rest_client->post('user_session/login_session',[
						'form_params'=>[
							'userID'=>$userID,
							'pass'=>$password,
							'token'=>$token,
							'securityCode'=>$securityCode
						]
					]);

					$respone = json_decode($request->getBody());
					// echo $request->getBody();
					// print_r($respone);die;
					if($respone->data->status=='SUCCESS'){
						// $this->session->sess_destroy();
						// print_r($r_member);
						// die;
						$this->session->set_userdata(array(
								'apikey'=>$respone->data->accessToken,
								'userID'=>$respone->data->userID,
								'member_id'=>$r_member->user_id,
								'id_member_type'=>$r_member->user_type_id,
								'real_name'=>$r_member->firstname." ".$r_member->lastname,
								'logged'=>true
							)
						);	
						// echo $prod_id;die;
						if($prod_id!=''){
							$prod = $this->db->get_where('product',array('prod_id'=>$prod_id))->row();
							redirect("$prod->prod_name");

						}else{
							//$this->session->sess_destroy();
							redirect('home');
						}


					}else{

					} 
					
				}else{
					$this->smarty->assign('message', '<font color=red>Anda belum memiliki akun</font>');	
					$this->smarty->assign('content_tpl', 'login.tpl');		
					$this->smarty->display('app_template.tpl');	
				}
				
			} else {
				if($mode=='ajax'){
					echo json_encode(array(
						'success'=>false,
						'message'=>'<font color=red>Email atau password salah</font>'));
				} else {
					$this->smarty->assign('prod_id',$prod_id);
					$this->smarty->assign('message', '<font color=red>Email atau password salah</font>');	
					$this->smarty->assign('content_tpl', 'login.tpl');		
					$this->smarty->display('app_template.tpl');	
				}
				
			}
			
		}

		
	}

}