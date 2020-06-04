<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_panel extends MY_Controller {

	public function index()
	{	
		//main menu
		$main_menu = $this->create_menuTree($id_parent=0)->result_array();
		$this->smarty->assign('main_menu',$main_menu);
		$data = $this->m_data->get_member_profile($this->session->user_id);
		$this->smarty->assign('data_user',$data);
		
		//sub menu

		//new content
		$news = $this->get_news();
		$this->smarty->assign('news',$news);

		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'user_panel.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function change_password(){
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'change_password.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function save_password(){
		$q = $this->db->get_where('users',array('password'=>$this->input->post('password_old'),'user_id'=>$this->session->userdata('user_id')));
		if($q->num_rows()>0){
			$this->db->where('user_id',$this->session->userdata('user_id'));
			$this->db->update('users',array('password'=>$this->input->post('password_new')));
			echo json_encode(array('succes'=>true,'message'=>'<font color=green>Password berhasil diubah'));
		} else {
			echo json_encode(array('succes'=>false,'message'=>'<font color=red>Password lama salah'));
		}
	}


	function send_email($data,$policy_no){
		$q = $this->db->query("select a.insured_id,c.email
									from ".DB_NAME.".order a
									join insured b ON a.insured_id = b.insured_id
									join users c ON b.user_id = c.user_id
									where a.order_id = ".$data['order_id']." ")->row();

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

		$this->email->attach(DOCUMENTROOT."assets/tpl/images/logo.png", "inline");
		$this->email->from($this->settings['sender_mail_address'], 'Jasindo Travel');
		$this->email->to($q->email);
		$this->email->subject('Pengajuan Klaim Jasindo Travel');

		// $this->load->model('m_claim');
		$data['d'] = $data;

		if(intval($data['d']['claim_type'])==1){
			$data['d']['claim_type_name'] = 'Medis';
		} else if(intval($data['d']['claim_type'])==2){
				$data['d']['claim_type_name'] = 'Kecelakaan Diri';
			} else if(intval($data['d']['claim_type'])==3){
					$data['d']['claim_type_name'] = 'Ketidaknyamanan Perjalanan';
				} else {
						$data['d']['claim_type_name'] = 'Klaim Lainnya';
					}

		$data['policy_no'] = $policy_no;
		$text = $this->load->view('newclaim_confirmation',$data,TRUE);
		$this->email->message($text);
		$this->email->send();
	}

	function create_menuTree($id_parent){

		return $this->m_data->menu_member($id_parent);
		// echo $this->db->last_query();
	}

	function get_news(){

		return $this->m_data->news()->result_array();
	}
}