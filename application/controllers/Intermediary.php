<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Intermediary extends MY_Controller {

	public function index()
	{
		$this->smarty->assign('message',null);
		$this->smarty->assign('content_tpl', 'login.tpl');	
		$this->smarty->display('app_template.tpl');			
	}

	// public function panel($id)
	// {	
	// 	// print_r($this->session->all_userdata());
	// 	$this->smarty->assign('message',null);
	// 	$q = $this->db->query("SELECT 
	// 								  a.intermediary_id,a.intermediary_name,a.intermediary_code,a.intermediary_legal_name,a.intermediary_address,a.intermediary_phone,a.intermediary_fax,
 //                   					  a.intermediary_id,a.intermediary_web,a.intermediary_email,a.intermediary_bankname,a.intermediary_accountname,a.intermediary_accountnumber,a.intermediary_mou_file,
	// 				               	  a.intermediary_activated_date,a.intermediary_activated_by,a.intermediary_agent_name,a.intermediary_agent_email,a.intermediary_agent_handphone,
	// 				               	  a.intermediary_agent_telephone,a.intermediary_agent_address,a.intermediary_agent_birthdate,a.intermediary_agent_noid,a.user_id,
	// 				               	  a.datein,a.userin,a.status,b.username,b.password,a.upload_from
	// 			               FROM 
	// 			               		  intermediary a 
	// 						   JOIN 
	// 						   		  users b On b.user_id=a.user_id
	// 						   where 
	// 						   		  a.user_id=$id");
	// 	$r = $q->result_array()[0];
		
	// 	$file_name=$q->row()->intermediary_mou_file;

	// 	if(file_exists(" SITE_URL()upload/$file_name")){
	// 		$this->smarty->assign('download_link', SITE_URL());
						
	// 	}else{
	// 		// echo $q->row()->upload_from;
	// 		if($q->row()->upload_from==1){
	// 			$this->smarty->assign('download_link', SITE_URL());
	// 		}else{
	// 			$this->smarty->assign('download_link',ADMIN_URL);

	// 		}
	// 	}
		
	// 	$q = $this->db->get_where('intermediary',array('intermediary_parent_id'=>$this->session->intermediary_id));
	// 	$data=[];
		
	// 	if($q->num_rows()>0){
	// 		$data = $q->result_array();
	// 	}
	// 	// print_r($data);
	// 	$this->smarty->assign('sub_agent', $data);	
	// 	$this->smarty->assign('data',$r);
	// 	$this->smarty->assign('content_tpl','intermediary/home_panel.tpl');	
	// 	$this->smarty->display('app_template.tpl');	
	// }

	public function profile_intermediary()
	{
		$this->smarty->assign('message',null);

		//untuk from profile intermediary
		// $q = $this->db->query("SELECT 
		// 							  a.intermediary_id,a.intermediary_name,a.intermediary_code,a.intermediary_legal_name,a.intermediary_address,a.intermediary_phone,a.intermediary_fax,
  //                  					  a.intermediary_id,a.intermediary_web,a.intermediary_email,a.intermediary_bankname,a.intermediary_accountname,a.intermediary_accountnumber,a.intermediary_mou_file,
		// 			               	  a.intermediary_activated_date,a.intermediary_activated_by,a.intermediary_agent_name,a.intermediary_agent_email,a.intermediary_agent_handphone,
		// 			               	  a.intermediary_agent_telephone,a.intermediary_agent_address,a.intermediary_agent_birthdate,a.intermediary_agent_noid,a.user_id,
		// 			               	  a.datein,a.userin,a.status,b.username,b.password,a.upload_from
		// 		               FROM 
		// 		               		  intermediary a 
		// 					   JOIN 
		// 					   		  users b On b.user_id=a.user_id
		// 					   where 
		// 					   		  a.user_id=".$this->session->userdata('user_id'));
		// $r = $q->result_array()[0];
		
		// $file_name=$q->row()->intermediary_mou_file;

		// if(file_exists("BASE_URL()upload/$file_name")){
		// 	$this->smarty->assign('download_link', BASE_URL());
						
		// }else{
		// 	// echo $q->row()->upload_from;
		// 	if($q->row()->upload_from==1){
		// 		$this->smarty->assign('download_link', BASE_URL());
		// 	}else{
		// 		$this->smarty->assign('download_link',ADMIN_URL);

		// 	}
		// }
		
		// //untuk menampilkan data sub agen
		// $q = $this->db->get_where('intermediary',array('intermediary_parent_id'=>$this->session->intermediary_id));
		// $data=[];	
		// if($q->num_rows()>0){
		// 	$data = $q->result_array();
		// }

		// //untuk menampilkan data peserta
		// $agen_participant = $this->agen_participant();
		// // print_r($agen_participant);
		
		// //unutk menampilkan data pemesanan dari agen
		// $ingle_order_by_agent = $this->single_order_list();
		
		// $this->smarty->assign('sub_agent', $data);	
		// $this->smarty->assign('agen_participant', $agen_participant);	
		// $this->smarty->assign('single_order_by_agent', $ingle_order_by_agent);	
		// $this->smarty->assign('data',$r);
		$this->smarty->assign('content_tpl','intermediary/home_panel.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	public function register()
	{
		$this->smarty->assign('message',null);
		$this->smarty->assign('content_tpl', 'intermediary/intermediary_register.tpl');	
		$this->smarty->display('app_template.tpl');	
	}
	
	function subintermediary_register(){

		$this->smarty->assign('message',null);
		$this->smarty->assign('content_tpl', 'intermediary/subintermediary_register.tpl');	
		$this->smarty->display('app_template.tpl');	
	} 

	function edit_sub_agent($intermediary_id){
		$q = $this->db->query("SELECT 
									  a.intermediary_id,a.intermediary_name,a.intermediary_code,a.intermediary_legal_name,a.intermediary_address,a.intermediary_phone,a.intermediary_fax,
                   					  a.intermediary_id,a.intermediary_web,a.intermediary_email,a.intermediary_bankname,a.intermediary_accountname,a.intermediary_accountnumber,a.intermediary_mou_file,
					               	  a.intermediary_activated_date,a.intermediary_activated_by,a.intermediary_agent_name,a.intermediary_agent_email,a.intermediary_agent_handphone,
					               	  a.intermediary_agent_telephone,a.intermediary_agent_address,a.intermediary_agent_birthdate,a.intermediary_agent_noid,a.user_id,
					               	  a.datein,a.userin,a.status,b.username,b.password,a.upload_from
				               FROM 
				               		  intermediary a 
							   JOIN 
							   		  users b On b.user_id=a.user_id
							   where 
							   		  a.intermediary_id=$intermediary_id");
		$r = $q->result_array()[0];

		$file_name=$r['intermediary_mou_file'];
		if(file_exists("BASE_URL()upload/$file_name")){
			$this->smarty->assign('download_link', BASE_URL());
						
		}else{
			// echo $q->row()->upload_from;
			if($q->row()->upload_from==1){
				$this->smarty->assign('download_link', BASE_URL());
			}else{
				$this->smarty->assign('download_link',ADMIN_URL);

			}
		}
		$this->smarty->assign('user_id', $this->session->userdata('user_id'));
		$this->smarty->assign('data', $r);
		$this->smarty->assign('content_tpl', 'intermediary/sub_agent_profile.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	public function order()
	{
		$this->smarty->assign('message',null);
		$this->smarty->assign('content_tpl', 'intermediary/intermediary_order_form.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function validate_checking($emailintermediary,$emailagent,$intermediaryagentnoid){
		$intermediary_email = $this->db->query("select intermediary_email from  intermediary where intermediary_email='".$emailintermediary."'");
		
		if($emailagent == $emailintermediary){
			$arr = json_encode(array('success'=>false,'message'=>'Email intermediary tidak boleh sama dengan email agen'));
			echo $arr;die; 
		}	

		if($intermediary_email->num_rows()>0){
			$arr = json_encode(array('success'=>false,'message'=>'Email intermediary sudah terdaftar'));
			echo $arr;die; 
		}
		
		$intermediary_agent_email = $this->db->query("select intermediary_agent_email from  intermediary where intermediary_agent_email='".$emailagent."'");
		
		if($intermediary_agent_email->num_rows()>0){
			$arr = json_encode(array('success'=>false,'message'=>'Email agen sudah terdaftar'));
			echo $arr;die;
		}else {
			$qins = $this->db->query("select email from users where email='".$emailagent."' and user_type_id= 3");
			
			if($qins->num_rows()>0){
				$arr = json_encode(array('success'=>false,'message'=>'Email sudah terdaftar sebagai participant silahkan masukkan email yang berbeda'));
				echo $arr;die;
			}

			$intermediary_agent_id = $this->db->query("select intermediary_agent_noid from  intermediary where intermediary_agent_noid='".$intermediaryagentnoid."'");
		
			if($intermediary_agent_id->num_rows()>0){
				$arr = json_encode(array('success'=>false,'message'=>'No KTP Agen sudah terdaftar silahkan coba kembali'));
				echo $arr;die;
			}

		}
	}

	public function save_register_intermediary(){
		$this->db->trans_begin();

		//configurasi validasi 
		$this->validate_checking($this->input->post('email_office'),$this->input->post('email_agent'),$this->input->post('identity_no_agent'));
		
		//configurasi upload file
		$config['upload_path']='./upload/';
        $config['allowed_types']='pdf|doc|docx';
        $confif['max_size']='10000';

		$this->load->library('upload',$config);	

		//validasi proses upload
		if(!$this->upload->do_upload('pks_file')){
            $err = $this->upload->display_errors();
            $json = array('success' => false, 'message' => 'Data Gagal Disimpan'.$err);
            echo json_encode($json);  
        }
        else{

        	$file = $this->upload->data();
        	$files =$this->input->post('pks_file');

        	//data untuk insert ke tabel user
        	$data_user=array(
				
				'user_type_id'=>4,
				'username'=>$this->input->post('email_agent'),
				'password'=>$this->input->post('password_agent'),
				'email'=>$this->input->post('email_agent'),
				'firstname'=>$this->input->post('fullname_agent'),
				'lastname'=>$this->input->post('fullname_agent'),
				'address' =>$this->input->post('address_agent'),
				'dateregistered' =>date('Y-d-m H:i'),
				'deleted'=>0,
				'datein' =>date('Y-d-m H:i'),
				'status' =>1,
			);

			//proses insert ke table users
        	$this->db->insert('users',$data_user);

        	//data untuk insert ke tabel intermediary
        	$intermediary=array(
	          	'intermediary_name' =>$this->input->post('company_name'),
			  	'intermediary_code' =>$this->test_rand(),
			  	'intermediary_legal_name' =>$this->input->post('company_name'),
			  	'intermediary_address' =>$this->input->post('address'),
			  	'intermediary_phone' =>$this->input->post('company_phone'),
			  	'intermediary_fax' =>$this->input->post('company_fax_number'),
			  	'intermediary_web' =>$this->input->post('company_web'),
			  	'intermediary_email' =>$this->input->post('email_office'),
			  	'intermediary_bankname' =>$this->input->post('company_bank_name'),
			  	'intermediary_accountname' =>$this->input->post('account_name'),
			  	'intermediary_accountnumber' =>$this->input->post('account_number'),
			  	'intermediary_mou_file' =>$file['file_name'],
			  	'intermediary_agent_name' =>$this->input->post('fullname_agent'),
			  	'intermediary_agent_email' =>$this->input->post('email_agent'),
			  	'intermediary_agent_handphone' =>$this->input->post('phone_number_agent'),
			  	'intermediary_agent_telephone' =>$this->input->post('phone_number_agent1'),
			  	'intermediary_agent_address' =>$this->input->post('intermediary_agent_address'),
			  	'intermediary_agent_birthdate' =>$this->input->post('birthdate_agent'),
			  	'intermediary_agent_noid' =>$this->input->post('identity_no_agent'),
			  	'user_id'=> $this->user_id('user_id','users'),
			  	'datein' =>date('Y-m-d H:m:s'),
			  	'deleted'=>0,
			  	'upload_from'=>1
			);

			//proses insert ke table intermediary
			$this->db->insert('intermediary',$intermediary);

			if($this->db->trans_status() ===false){

				$this->db->trans_rollback();
				$json=array('success'=>false,'message'=>'Registrasi Gagal');
				echo json_encode($json);
			}else{
				$this->db->trans_commit();
				$json=array('success'=>true,'message'=>'Registrasi Berhasil','url_direct'=>site_url('login'));
				echo json_encode($json);
				// redirect('intermediary/index');
			}	
		}
	}

	function update_agent_ajax(){
		$this->db->trans_begin();
        
        $id = $this->db->get_where('intermediary',array('intermediary_id'=>$this->input->post('intermediary_id')))->row();
		
		//cek no id agent
		if($id->intermediary_agent_noid==$this->input->post('intermediary_agent_noid')){
		}else{
			$number_id = $this->db->query("select intermediary_agent_noid from intermediary where intermediary_agent_noid='".$this->input->post('intermediary_agent_noid')."'");

			if($number_id->num_rows() >0){
				$json=array('success'=>false,'message'=>'No KTP Agen yang anda masukan sudah terdaftar silahkan coba kembali');
				echo json_encode($json);
				die;
			}

		}        
        
        //cek email
        if($id->intermediary_agent_email==$this->input->post('intermediary_agent_email')){

        }else{
        	$email = $this->db->query("select intermediary_agent_email from intermediary where intermediary_agent_email='".$this->input->post('intermediary_agent_email')."'");
        	
        	if($email->num_rows() >0){
				$json=array('success'=>false,'message'=>'Email Agen yang anda masukan sudah terdaftar silahkan coba kembali');
				echo json_encode($json);
				die;
			} 

			$email_participant= $this->db->query("select email from users where email='".$this->input->post('intermediary_agent_email')."' and user_type_id=3");
			
			if($email_participant->num_rows() >0){
				$json=array('success'=>false,'message'=>'Email Agen yang anda masukan sudah terdaftar sebagai participant silahkan coba kembali');
				echo json_encode($json);
				die;
			}
        }
        
        //array
		$data_user=array(
				'username'=>$this->input->post('intermediary_agent_email'),
				'password'=>$this->input->post('intermediary_agent_password'),
				'email'=>$this->input->post('intermediary_agent_email'),
		);
		
		$this->db->where('user_id',$id->user_id);
        $this->db->update('users',$data_user);
        
        $intermediary =array(
        	  'intermediary_agent_name' =>$this->input->post('intermediary_agent_name'),
			  'intermediary_agent_email' =>$this->input->post('intermediary_agent_email'),
			  'intermediary_agent_handphone' =>$this->input->post('intermediary_agent_handphone'),
			  'intermediary_agent_telephone' =>$this->input->post('intermediary_agent_telephone'),
			  'intermediary_agent_address' =>$this->input->post('intermediary_agent_address'),
			  'intermediary_agent_birthdate' =>$this->input->post('intermediary_agent_birthdate'),
			  'intermediary_agent_noid' =>$this->input->post('intermediary_agent_noid'),
        );
        // print_r($intermediary);	
        //update
        $this->db->where('intermediary_id',$this->input->post('intermediary_id'));
        $this->db->update('intermediary',$intermediary);

        if($this->db->trans_status() ===false){

			$this->db->trans_rollback();
			$json=array('success'=>false,'message'=>'Update profile agen Gagal');
			echo json_encode($json);
		}else{
			$this->db->trans_commit();
			$json=array('success'=>true,'message'=>'Update profile agen Berhasil','url_direct'=>site_url('intermediary/profile_intermediary/'));
			echo json_encode($json);
		}	
   		// echo $this->db->last_query();
	}

	function update_intermediary_ajax(){
		$this->db->trans_begin();

		//cek email
		$id = $this->db->get_where('intermediary',array('intermediary_id'=>$this->input->post('intermediary_id')))->row();
		
		if($id->intermediary_email==$this->input->post('intermediary_email')){

        }else{
        	$email = $this->db->query("select intermediary_email from intermediary where intermediary_email='".$this->input->post('intermediary_email')."'");
        	
        	if($email->num_rows() >0){
				$json=array('success'=>false,'message'=>'Email intermediary yang anda masukan sudah terdaftar silahkan coba kembali');
				echo json_encode($json);
				die;
			} 

			$email_participant= $this->db->query("select email from users where email='".$this->input->post('intermediary_email')."' and user_type_id=3");
			
			if($email_participant->num_rows() >0){
				$json=array('success'=>false,'message'=>'Email intermediary yang anda masukan sudah terdaftar sebagai participant silahkan coba kembali');
				echo json_encode($json);
				die;
			}
        }
		
		//configurasi upload file
		$config['upload_path']='./upload/';
        $config['allowed_types']='pdf|doc|docx';
        $confif['max_size']='10000';
        // $config['encrypt_name'] = TRUE;

		$this->load->library('upload',$config);	

		//validasi proses upload
		if(!$this->upload->do_upload('intermediary_mou_file') && $_FILES['intermediary_mou_file']['name']!=''){
            $err = $this->upload->display_errors();
            $json = array('success' => false, 'message' => 'Data Gagal Disimpan'.$err);
            echo json_encode($json);  
        }
        else{

        	$file  = $this->upload->data();
        	$files = $this->input->post('intermediary_mou_file');
        	
        	//array
        	$intermediary =array(
        		'intermediary_name' =>$this->input->post('name_intermadiary'),
			  	'intermediary_legal_name' =>$this->input->post('legal_name'),
			  	'intermediary_address' =>$this->input->post('intermediary_address'),
			  	'intermediary_phone' =>$this->input->post('intermediary_phone'),
			  	'intermediary_fax' =>$this->input->post('intermediary_fax'),
			  	'intermediary_web' =>$this->input->post('intermediary_web'),
			  	'intermediary_email' =>$this->input->post('intermediary_email'),
			  	'intermediary_bankname' =>$this->input->post('intermediary_bankname'),
			  	'intermediary_accountname' =>$this->input->post('intermediary_accountname'),
			  	'intermediary_accountnumber' =>$this->input->post('intermediary_accountnumber'),
			  	'datemod' =>date('Y-m-d H:m:s'),
			  	'upload_from'=>1,
        	);
        	
        	//update
			
			if(!empty($file['file_name'])){
				$intermediary['intermediary_mou_file'] =$file['file_name'];
			}

        	$this->db->where('intermediary_id',$this->input->post('intermediary_id'));
        	$this->db->update('intermediary',$intermediary);

        	if($this->db->trans_status() ===false){

				$this->db->trans_rollback();
				$json=array('success'=>false,'message'=>'Update profile perusahaan Gagal');
				echo json_encode($json);
			}else{
				$this->db->trans_commit();
				$json=array('success'=>true,'message'=>'Update profile perusahaan Berhasil','url_direct'=>site_url('intermediary/profile_intermediary/'));
				echo json_encode($json);
				// redirect('intermediary/index');
			}	
        }

	}

	function save_subintermediary(){
		$this->db->trans_begin();
		// print_r($this->session->userdata());
		//configurasi validasi 
		$this->validate_checking($this->input->post('email_office'),$this->input->post('email_agent'),$this->input->post('identity_no_agent'));
		
		//configurasi upload file
		$config['upload_path']='./upload/';
        $config['allowed_types']='pdf|doc|docx';
        $confif['max_size']='10000';

		$this->load->library('upload',$config);	

		//validasi proses upload
		if(!$this->upload->do_upload('pks_file')){
            $err = $this->upload->display_errors();
            $json = array('success' => false, 'message' => 'Data Gagal Disimpan'.$err);
            echo json_encode($json);  
        }
        else{

        	$file = $this->upload->data();
        	$files =$this->input->post('pks_file');

        	//data untuk insert ke tabel user
        	$data_user=array(
				
				'user_type_id'=>4,
				'username'=>$this->input->post('email_agent'),
				'password'=>$this->input->post('password_agent'),
				'email'=>$this->input->post('email_agent'),
				'firstname'=>$this->input->post('fullname_agent'),
				'lastname'=>$this->input->post('fullname_agent'),
				'address' =>$this->input->post('address_agent'),
				'dateregistered' =>date('Y-d-m H:i'),
				'deleted'=>0,
				'datein' =>date('Y-d-m H:i'),
				'status' =>1,
			);

			//proses insert ke table users
        	$this->db->insert('users',$data_user);

        	//data untuk insert ke tabel intermediary
        	$subintermediary=array(
        		'intermediary_parent_id'=>$this->session->userdata('intermediary_id'),
	          	'intermediary_name' =>$this->input->post('company_name'),
			  	'intermediary_code' =>$this->test_rand(),
			  	'intermediary_legal_name' =>$this->input->post('company_name'),
			  	'intermediary_address' =>$this->input->post('address'),
			  	'intermediary_phone' =>$this->input->post('company_phone'),
			  	'intermediary_fax' =>$this->input->post('company_fax_number'),
			  	'intermediary_web' =>$this->input->post('company_web'),
			  	'intermediary_email' =>$this->input->post('email_office'),
			  	'intermediary_bankname' =>$this->input->post('company_bank_name'),
			  	'intermediary_accountname' =>$this->input->post('account_name'),
			  	'intermediary_accountnumber' =>$this->input->post('account_number'),
			  	'intermediary_mou_file' =>$file['file_name'],
			  	'intermediary_agent_name' =>$this->input->post('fullname_agent'),
			  	'intermediary_agent_email' =>$this->input->post('email_agent'),
			  	'intermediary_agent_handphone' =>$this->input->post('phone_number_agent'),
			  	'intermediary_agent_telephone' =>$this->input->post('phone_number_agent1'),
			  	'intermediary_agent_address' =>$this->input->post('intermediary_agent_address'),
			  	'intermediary_agent_birthdate' =>$this->input->post('birthdate_agent'),
			  	'intermediary_agent_noid' =>$this->input->post('identity_no_agent'),
			  	'user_id'=> $this->user_id('user_id','users'),
			  	'datein' =>date('Y-m-d H:m:s'),
			  	'deleted'=>0,
			);
			// print_r($subintermediary);
			// die;
			// proses insert ke table intermediary
			$this->db->insert('intermediary',$subintermediary);

			if($this->db->trans_status() ===false){

				$this->db->trans_rollback();
				$json=array('success'=>false,'message'=>'Registrasi Gagal');
				echo json_encode($json);
			}else{
				$this->db->trans_commit();
				$json=array('success'=>true,'message'=>'Registrasi Berhasil','url_direct'=>site_url('intermediary/profile_intermediary/'));
				echo json_encode($json);
				// redirect('intermediary/index');
			}	
		}
	}

	function agen_participant(){

		$sql   = "select a.insured_id,a.intermediary_id,a.firstname,a.lastname,a.phone_number,a.phone_number1,c.email from insured a 
				  join intermediary b on b.intermediary_id=a.intermediary_id
				  join users c on c.user_id=a.user_id
				  where a.intermediary_id=".$this->session->intermediary_id." order by insured_id desc";

		$query = $this->db->query($sql);

		return $query->result_array();
	}

	function agen_participant_register()
	{
		# code...
		$this->smarty->assign('message',null);
		$this->smarty->assign('content_tpl', 'intermediary/agent_participant_register.tpl');	
		$this->smarty->display('app_template.tpl');
	}

	function single_order($intermediary_id=null)
	{
		# code...
		$this->smarty->assign('message',null);

		$num_participant=[];
		for ($i=1; $i <=5 ; $i++) { 
			# code...
			$num_participant[$i]=$i;

			// $i++;
		}
		// print_r($num_participant);
		if($this->input->get('departure_id')!=null){
			$this->smarty->assign('departure_id', $this->input->get('departure_id'));	

		}else{
			$this->smarty->assign('departure_id',null);
		}
		
		if($this->input->get('destination_id')!=null){
			$this->smarty->assign('destination_id', $this->input->get('destination_id'));	

		}else{
			$this->smarty->assign('destination_id', $this->input->get('destination_id'));	

		}

		if($this->input->get('startdate')!=null){
			$this->smarty->assign('startdate', $this->input->get('startdate'));	

		}else{
			$this->smarty->assign('startdate', null);	
		}
		
		if($this->input->get('enddate')!=null){
			 // $intermediary_id=$this->session->intermediary_id;
			$this->smarty->assign('enddate',$this->input->get('enddate'));
			
		}else{
			$this->smarty->assign('enddate',null);

		}

		if($this->input->get('type')!=null){
			$this->smarty->assign('type',$this->input->get('type'));
		}else{
			$this->smarty->assign('type',null);

		}

		$selected_package = $this->input->get('selected_package');

		$this->smarty->assign('rb_gold',null);
		$this->smarty->assign('rb_platinum',null);
		$this->smarty->assign('rb_diamond',null);
		$this->smarty->assign('rb_domestic',null);

		if($selected_package==1){
			$this->smarty->assign('rb_gold','checked=checked');
		} else if($selected_package==2){
			$this->smarty->assign('rb_platinum','checked=checked');
		} else if($selected_package==3){
			$this->smarty->assign('rb_diamond','checked=checked');
		} else if($selected_package==4){
			$this->smarty->assign('rb_domestic','checked=checked');
		}
		$this->smarty->assign('selected_package',$selected_package);

		// $num_participant=[];

		for ($i=1; $i <=5 ; $i++) { 
			# code...
			$option[$i]=$i;

			// $i++;
		}

		if($this->input->get('name')!=null){
			$this->smarty->assign('participant_name', str_replace('%20', ' ', $this->input->get('name')));
		}else{
			$this->smarty->assign('participant_name', null);	
		}

		$this->smarty->assign('participant',form_dropdown('num_participant', $option, $this->input->get('num_person'), ' id="num_participant" '));
		$this->smarty->assign('num_person', $this->input->get('num_person'));
		$this->smarty->assign('intermediary_id', $this->session->intermediary_id);	
		$this->smarty->assign('content_tpl', 'intermediary/intermediary_single_order.tpl');	
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

	function save_participant(){

		// echo $this->input->post('email');
		// $this->load->library('form_validation');
		// $this->form_validation->set_rules('email','Email','required');
		// $this->form_validation->set_rules('password','Password','required');
		// $this->form_validation->set_rules('fullname','Fullname','required');
		
		// if($this->form_validation->run() != false){			
			$this->db->trans_begin();
			
			//data untuk insert ke tabel sys_user
			$data_user=array(
				
				'user_type_id'=>3,
				'username'=>$this->input->post('email'),
				'password'=>$this->input->post('password'),
				'email'=>$this->input->post('email'),
				'firstname'=>$this->input->post('fullname'),
				'lastname'=>$this->input->post('fullname'),
				'address' =>$this->input->post('address'),
				'dateregistered' =>date('Y-m-d H:m:s'),
				'deleted'=>0,
				'datein' =>date('Y-m-d H:m:s'),
				'status' =>1,
			);		
			
			//data untuk insert ke tabel insured 
			$data_insured=array(
			  'intermediary_id'=>$this->session->userdata('intermediary_id'),
			  'gender'=>$this->input->post('gender_reg'),
			  'birthdate' => backdate2($this->input->post('birthdate')),
			  'firstname' =>$this->input->post('firstname'),
			  'lastname' =>$this->input->post('lastname'),
			  'address' =>$this->input->post('address'),
			  'phone_number' =>$this->input->post('phone_number') != ''?$this->input->post('phone_number'):0,
			  'phone_number1' =>$this->input->post('phone_number1') != ''?$this->input->post('phone_number1'):0,
			  'identity_no' =>$this->input->post('identity_no'),
			  'heirs_identity_no' =>$this->input->post('heirs_identity_no'),
			  'dateregistered' =>date('Y-m-d H:m:s'),
			  'deleted'=>0,
			  'heirs_name' =>$this->input->post('heirs_name'),
			  'heirs_phone' =>$this->input->post('heirs_phone') !=''?$this->input->post('heirs_phone'):0,
			  'heirs_phone1' =>$this->input->post('heirs_phone1') !=''?$this->input->post('heirs_phone1'):0,
			  'heirs_datebirth' =>backdate2($this->input->post('heirs_birthdate')),
			  'policy_holder' =>$this->input->post('policy_holder'),
			);			

			if($this->input->post('insured_id') == null){
				// echo "string";
				
			  	$data_insured['user_id']=$this->user_id('user_id','users');
				$this->db->insert('users',$data_user);
				$this->db->insert('insured',$data_insured);

				// print_r($this->db->insert_id());
				$this->send_sms_notif($this->db->insert_id());
				$this->send_email_account($data_insured['user_id']);
			// die;
			}else{
				
				$q = $this->db->get_where('users',array('user_id'=>$this->input->post('user_id')))->row();

				if($q->username!=$this->input->post('username') or $q->password!=$this->input->post('password')){
					$this->db->where('user_id',$this->input->post('user_id'));
					$this->db->update('users',$data_user);

				}

				$this->db->where('insured_id',$this->input->post('insured_id'));
				$this->db->update('insured',$data_insured);
				// echo $this->db->last_query();
			}
		
			if($this->db->trans_status()===false){
				$this->db->trans_rollback();
				echo json_encode(array('success'=>false,'message'=>'Data Gagal disimpan'));
			}else{
				$this->db->trans_commit();

				echo json_encode(array('success'=>true,'message'=>'Data Berhasil disimpan','url_direct'=>site_url('intermediary/profile_intermediary')));
				// echo json_encode(array('success'=>true,'message'=>'Data Berhasil disimpan'));
			}
			
		// }else{
		// 	echo "kosong";
		// }
	
	
	}

	function get_participant_name(){

		if (isset($_POST['query'])) {
			$name  = $_POST['query'];
			$sql   = "select a.insured_id,a.intermediary_id,a.firstname,a.lastname,a.phone_number,a.phone_number1,c.email from insured a 
				  	  join intermediary b on b.intermediary_id=a.intermediary_id
				  	  join users c on c.user_id=a.user_id
				  	  where  a.intermediary_id=".$this->session->intermediary_id." and (a.firstname like '%".$name."%' or a.lastname like '%".$name."%')";
			$q     = $this->db->query($sql);

			$data=[];
			$i=0;
			foreach ($q->result_array() as $key => $value) {
				# code...
				$data[$i] = array ('id'=>$value['insured_id'],
									'label'=>$value['firstname'].' '.$value['lastname'],
								    'value'=>$value['firstname'].' '.$value['lastname']);
				$i++;
			}	
			echo json_encode($data);
			// echo $sql;
		}
	}

	function edit_agen_participant($id){
		$this->smarty->assign('message',null);

		$q    = $this->db->query('select a.*,b.email,b.password,b.user_id from insured a join users b ON a.user_id=b.user_id where a.insured_id='.$id);
		$data = [];
		// $i=0;
		foreach ($q->result_array() as $key => $value) {
			# code...
			$birthdate = explode('-', $value['birthdate']);
			$heirs_datebirth =explode('-', $value['heirs_datebirth']);

			$value['birthdate']=$birthdate[2].'-'.$birthdate[1].'-'.$birthdate[0];
			$value['heirs_datebirth']=$heirs_datebirth[2].'-'.$heirs_datebirth[1].'-'.$heirs_datebirth[0];

			$data[0]=$value;
			// $i++;
		}
		// print_r($data[0]);
		$this->smarty->assign('data', $data[0]);
		$this->smarty->assign('content_tpl', 'intermediary/agent_participant_profile.tpl');	
		$this->smarty->display('app_template.tpl');;		
	}

	function agen_participantAjax(){

		if($this->input->get('id')!=''){
			$sql   = "select a.*,c.email from insured a 
					  join intermediary b on b.intermediary_id=a.intermediary_id
					  join users c on c.user_id=a.user_id
					  where a.insured_id=".$this->input->get('id');

			$query = $this->db->query($sql);

			$data=[];
			$i=0;
			foreach ($query->result() as $key => $value) {
				# code...
				$value->birthdate=backdate2($value->birthdate);
				$value->heirs_datebirth=backdate2($value->heirs_datebirth);
				$data[$i]=$value;
				$i++;
			}

			echo json_encode(array($query->result_array()));
		}
		
	}

	function single_order_list(){
		$this->load->model('m_order');

		$sql_order = $this->m_order->base_query();
		$where     = " where a.intermediary_id =".$this->session->intermediary_id." and a.intermediary_id is not null GROUP BY a.order_id";
		$query     = $sql_order.$where;	

		$sql  = $this->db->query($query)->result_array();
		$data = [];
		$i=0;
		foreach ($sql as $key => $value) {
			# code...
			$order_date = explode(" ", $value['order_date']);
			$value['order_date']=date('d F Y', strtotime($order_date[0])).' '.$order_date[1];
			$value['startdate']=date('d F Y', strtotime($value['startdate']));
			$value['enddate']=date('d F Y', strtotime($value['enddate']));
			$value['total_amount']=number_format($value['total_amount']);

			$data[$i] = $value;

			$i++;
		}
		
		return $data;
	}

	public function test_rand(){

		return rand(111111,9);
	}

	function send_sms_notif($insured_id){
		//get no order/intermediary_id
			$qins = $this->db->query("select a.phone_number,b.intermediary_name,a.intermediary_id,b.intermediary_agent_handphone,c.email
									  from insured a 
									  join intermediary b ON b.intermediary_id=a.intermediary_id 
									  join users c on c.user_id=a.user_id
									  where a.insured_id=$insured_id and a.intermediary_id is not null")->row();
					
			$number = $qins->phone_number;
			
			$content = 'JASINDO TRAVEL. Akun anda telah didaftarkan oleh agen '.$qins->intermediary_name.' silahkan cek emai anda '.$qins->email;					
			if($number!='' && $number!=null){
				$this->send_sms($number,$content);
			}
	}

	function send_email_account($user_id){
		$q = $this->db->query("select email,password from users where user_id = $user_id")->row();

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
		$this->email->to($q->email);
		$this->email->subject('User Account Information Jasindo Travel');
		$data = array(
				'email'=>$q->email,
				'password'=>$q->password,
				'address'=>$this->settings['company_address'],
			);
		
		// $this->load->view('user_information2',$data);

		$text = $this->load->view('user_information2',$data,TRUE);
		$this->email->message($text);
		$this->email->send();

		$this->db->where('user_id',$user_id);
				$this->db->update('users',array(
					'send_mail_status'=>1
		));
	}

}
?>