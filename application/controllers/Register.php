<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Register extends MY_Controller {

	public function index()
	{
		$this->smarty->assign('message',null);
		$this->smarty->assign('content_tpl', 'register.tpl');	
		$this->smarty->display('app_template.tpl');	

	}

	public function user_id($pkey,$table){

		$q = $this->db->query("select max($pkey) as id from $table");
        
        if($q->num_rows()>0){
            $r = $q->row();
            return $r->id;
        } else {
            return 1;
        }
        
	}

	public function save(){
		// echo $this->input->post('email');
		$this->load->library('form_validation');
		$this->form_validation->set_rules('email','Email','required');
		$this->form_validation->set_rules('password','Password','required');
		// $this->form_validation->set_rules('fullname','Fullname','required');
		
		if($this->form_validation->run() != false){			
			$this->db->trans_begin();
			
			//data untuk insert ke tabel sys_user
			$data_user=array(
				
				'user_type_id'=>2,
				'username'=>$this->input->post('email'),
				'password'=>$this->input->post('password'),
				'email'=>$this->input->post('email'),
				'firstname'=>$this->input->post('firstname'),
				'lastname'=>$this->input->post('lastname'),
				'address' =>$this->input->post('address'),
				'dateregistered' =>date('Y-m-d H:m:s'),
				'deleted'=>0,
				'datein' =>date('Y-m-d H:m:s'),
				'status' =>1,
			);		

			//menyimpan ke tabel sys_user
			$this->db->insert('users',$data_user);
			
			//data untuk insert ke tabel insured 
			// $data_insured=array(
			//   'user_id'=>$this->user_id('user_id','users'),
			//   'gender'=>$this->input->post('gender_reg'),
			//   'birthdate' => backdate2($this->input->post('birthdate')),
			//   'firstname' =>$this->input->post('firstname'),
			//   'lastname' =>$this->input->post('lastname'),
			//   'address' =>$this->input->post('address'),
			//   'phone_number' =>$this->input->post('phone_number') != ''?$this->input->post('phone_number'):0,
			//   'identity_no' =>$this->input->post('identity_no'),
			//   'dateregistered' =>date('Y-m-d H:m:s'),
			//   'deleted'=>0,
			//   // 'heirs_name' =>$this->input->post('heirs_name'),
			//   // 'heirs_phone' =>$this->input->post('heirs_phone') !=''?$this->input->post('heirs_phone'):0,
			//   // 'heirs_phone1' =>$this->input->post('heirs_phone1') !=''?$this->input->post('heirs_phone1'):0,
			//   // 'heirs_datebirth' =>backdate2($this->input->post('heirs_birthdate')),
			//   // 'policy_holder' =>$this->input->post('policy_holder'),
			// );			

			// //menyimpan ke tabel sys_user
			// $this->db->insert('member',$data_insured);

			if($this->db->trans_status()===false){
				$this->db->trans_rollback();
				echo json_encode(array('success'=>false,'message'=>'Registrasi Gagal'));
			}else{
				$this->db->trans_commit();

				echo json_encode(array('success'=>true,'message'=>'Registrasi Berhasil','url_direct'=>site_url('login')));
			}
			
		}else{
			echo "kosong";
		}
	
	}

	public function test($id,$tables){

		echo $this->user_id($id,$tables);

	}

	function email_checking(){
		if($this->input->get('logged')==''){
			$arr = json_encode(array('success'=>true,'message'=>'Email belum terdaftar'));
			echo $arr; die;
		}
		// echo $this->input->get('email');
		// die;
		$q = $this->db->query("select email from users where email='".$this->input->get('email')."' and user_type_id= 1");;
		if($q->num_rows()>0){
			$arr = json_encode(array('success'=>false,'message'=>'Email sudah terdaftar'));
			echo $arr; die;
		} 
	}

}
?>