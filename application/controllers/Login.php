<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller {

	public function index()
	{
		$this->smarty->assign('message',null);
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

			$q = $this->db->get_where('users',array(
				'email'=>$this->input->post('email'),
				'password'=>$this->input->post('password')
				));
			if($q->num_rows()>0){
				$d = $q->result_array()[0];
				$this->session->set_userdata($d);

				if($d['user_type_id']!=1 and $d['user_type_id']!=4){
						$qins = $this->db->query("select a.*,
									case 
									when gender= 1 then 'Pria'
									else 'wanita' end as gender_name
									from insured a
									where a.user_id = ".$d['user_id']." ")->result_array()[0];
						// $qins = $this->db->get_where('insured',array('user_id'=>$d['user_id']))->result_array()[0];
						$this->session->set_userdata($qins);
				} else {
					$qins['insured_id'] = null;
				}
			
				$this->session->set_userdata(array('logged'=>true));

				if($mode=='ajax'){
					
					echo json_encode(array(
						'success'=>true,
						'message'=>'Login berhasil',
						'insured_id'=>$qins['insured_id'],
						'user_id'=>$qins['user_id'],
						'fullname'=>$qins['firstname'].' '.$qins['lastname']));
				} else {
					if($d['user_type_id']==1){
						redirect('admin_panel');
					} else if($d['user_type_id']==3){
						$q = $this->db->get_where("insured",array('user_id'=>$user_id,'deleted'=>0));

						if($q->num_rows() > 0){
							$insured=$q->result_array()[0];
							$this->session->set_userdata($insured);
						}					
					
						redirect('user_panel');
					
					}else if($d['user_type_id']==4){
						$user_id=$d['user_id'];
						
						$q = $this->db->get_where("intermediary",array('user_id'=>$user_id,'deleted'=>0));
						$cek_actived=$q->row();
						// $this->session->set_userdata($cek_actived);
												
						if($q->num_rows()>0){
							if($cek_actived->status==1){
								$this->smarty->assign('message', '<font color=red>Akun anda masih dalam tahap verifikasi</font>');	
								$this->smarty->assign('content_tpl', 'login.tpl');		
								$this->smarty->display('app_template.tpl');	
							}else if($cek_actived->status==4){
								$this->smarty->assign('message', '<font color=red>Akun anda telah ditolak</font>');	
								$this->smarty->assign('content_tpl', 'login.tpl');		
								$this->smarty->display('app_template.tpl');
							}else{
								// print_r($q->row());
								$this->session->set_userdata($q->result_array()[0]);
								redirect("intermediary/profile_intermediary");
								// print_r($this->session->userdata());
							}	

						}if($mode=='ajax'){
							echo json_encode(array(
								'success'=>false,
								'message'=>'<font color=red>Anda Belum terdaftar sebagai intermediary</font>'));
						} else {
							$this->smarty->assign('message', '<font color=red>Anda Belum terdaftar sebagai intermediary</font>');	
							$this->smarty->assign('content_tpl', 'login.tpl');		
							$this->smarty->display('app_template.tpl');	
						}
						
					}	
				}
						
				
			} else {
				if($mode=='ajax'){
					echo json_encode(array(
						'success'=>false,
						'message'=>'<font color=red>Email atau password salah</font>'));
				} else {
					$this->smarty->assign('message', '<font color=red>Email atau password salah</font>');	
					$this->smarty->assign('content_tpl', 'login.tpl');		
					$this->smarty->display('app_template.tpl');	
				}
				
			}
			
		}

		
	}

}