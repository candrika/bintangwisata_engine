<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Order_intermediary extends MY_Controller {

	public function index()
	{
		$this->smarty->assign('content_tpl', 'home_content.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function save_participant($user_id){

		$ins =array(
				'user_id' => $user_id,
				'intermediary_id'=>$this->input->post('intermediary_id'),
				'country_id'  => $this->input->post('country_id'),
				'gender' => $this->input->post('gender_reg'),
				'birthdate' => $this->input->post('datebirth')!='' ? backdate2($this->input->post('datebirth')) : null,
				'firstname' => $this->input->post('firstname'),
				'lastname' => $this->input->post('lastname'),
				'identity_no' => $this->input->post('identity_no'),				
				'address' => $this->input->post('address'),
				'phone_number' => $this->input->post('phone_number'),
				'city' => $this->input->post('city'),
				'country_code' => $this->input->post('country_code'),
				'province' => $this->input->post('province'),
				'zipcode' => $this->input->post('zipcode'),
				'cb_promo' => $this->input->post('cb_promo'),
				'dateregistered' => date('Y-m-d H:m:s'),
				'heirs_name' => $this->input->post('heirs_name'),		
				'heirs_phone' => $this->input->post('heirs_phone'),		
				'heirs_datebirth' => $this->input->post('heirs_datebirth')!='' ? backdate2($this->input->post('heirs_datebirth')) : null,
				'identity_no' => $this->input->post('identity_no'),		
				'datein' => date('Y-m-d H:m:s'),
				'status' => 1
		);
		$this->db->insert('insured',$ins);
		return $this->db->insert_id();
	}

	function proceed(){
		
		// print_r($_POST);die;
		$payment_type = intval($this->input->post('payment_type_reg'));
		//cek data peserta lain jika num_participant > 2
		if(intval($this->input->post('num_participant'))>2){
			for($i=1;$i<count($_POST['fullname']);$i++){
				// print_r($_POST['fullname']);
				if($_POST['fullname'][$i]==''){
					echo json_encode(array('success'=>false,'message'=>'Data peserta lain yang diasuransikan belum lengkap.')); exit;
				} else if($_POST['datebirth_participant'][$i]==''){
					echo json_encode(array('success'=>false,'message'=>'Data peserta lain yang diasuransikan belum lengkap.')); exit;
				} else if($_POST['no_identity'][$i]==''){
					echo json_encode(array('success'=>false,'message'=>'Data peserta lain yang diasuransikan belum lengkap.')); exit;
				} 
			}
		}

		$this->db->trans_begin();


		$firstname = $this->input->post('firstname');
		$lastname = $this->input->post('lastname');

		if($this->input->post('user_id') == ''){
			$user_id = $this->save_user();

		}else{
			$user_id = $this->input->post('user_id');
		
		}

		if($this->input->post('insured_id') == ''){

			$insured_id = $this->save_participant($user_id);
		
		}else{
			$insured_id = $this->input->post('insured_id');
			// echo "string";
		}

		$inserted_order = $this->save_order($insured_id);
		// print_r($insert_order);
		$order_id =$inserted_order['order_id'];
		
		//perluasan
		$this->save_order_ext($order_id);	

		//create member insured
		$this->save_member_insured($order_id);

		if ($this->db->trans_status() === FALSE)
		{
		        $this->db->trans_rollback();
		        echo json_encode(array('success'=>false,'message'=>'error occured, please try again later.'));
		}
		else
		{
		       

		        $this->smarty->assign('home_opt',null);
		        
		        $this->load->model('m_order');
				$data = $this->m_order->order_detail($order_id);
				$this->smarty->assign('token',null);
				
				$external_id = $order_id.'.'.$inserted_order['order_no'];
				$desc = $data['region_name_detail'].' '.$data['category'].' '.$data['type'].' - '.ucwords($firstname.' '.$lastname);
				$base_amount = $data['total_premi']+$data['total_perluasan']+$data['other_fee'];
				$total_amount = $data['total_amount'];
				

				$inv = $this->create_invoice_nusafin($user_id,$external_id,$data['email_agen'],'Asuransi Perjalanan '.$desc,$base_amount,$total_amount,$payment_type);
				// print_r($inv);
				$this->send_sms_notif($this->input->post('intermediary_id'),$inserted_order['order_no'],$inv['invoice_id']);

				if(!$inv['success']){
					$this->db->trans_rollback();
					echo json_encode(array('success'=>false,'message'=>'Maaf terjadi kegagalan dalam memproses pemesanan Anda. Mohon muat ulang halaman ini dan silahkan coba melakukan pemesanan kembali. '.$inv['message'].''));
					return false;
				} else {
					$this->db->trans_commit();
				}

				$invoice_id = $inv['invoice_id'];
				$this->smarty->assign('invoice_id',$invoice_id);
			    //send email order
		        $this->send_email_order($user_id,$order_id);

				echo json_encode(array('success'=>true,'url_direct'=>site_url('Order_intermediary/order_info_page/'.$order_id)));
		}

	}

	
	function user_info_page(){
		$data = array();
		$this->load->view('user_information',$data);
	}

	function details($order_id){
		$this->load->model('m_order');
		$data['d'] = $this->m_order->order_detail($order_id);
		$data['mode'] = null; 
		$data['print'] = null; 
		// print_r($data); die;
		$this->load->view('order_confirmation',$data);
	}

	function order_info_page($order_id,$mode=null,$print=null){
		$this->load->model('m_order');
		
		$d = $this->m_order->order_detail($order_id);
		// echo $this->db->last_query();
		// print_r($d); die;
		$this->smarty->assign('footer_display','display:none;');
		$this->smarty->assign('d',$d);

		$this->smarty->assign('invoice_id',$d['invoice_id']);

		if($this->input->post('intermediary_id') !=''){
			// echo $this->session->userdata('intermediary_id');
			$this->smarty->assign('sess_intermediaryid',$this->session->userdata('intermediary_id'));

		}
		$this->smarty->assign('invoice_id',$d['invoice_id']);
		$this->smarty->assign('content_tpl', 'intermediary/intermediary_order_confirmation.tpl');	
		$this->smarty->display('app_template_nofooter.tpl');	
	}

	function send_email_order($user_id,$order_id){
		// echo 'send send_email_order';
		$q = $this->db->query("select a.email,a.password from users a 
							   join intermediary b on b.user_id=a.user_id 
							   join ".DB_NAME.".order c on c.intermediary_id=b.intermediary_id  where c.order_id = $order_id")->row();
		// die;
		// print_r($q->row());
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
		$this->email->subject('Order Confirmation Jasindo Travel');

		$this->load->model('m_order');
		$data['d'] = $this->m_order->order_detail($order_id);
		$data['mode'] = 'email_confirm';
		$data['address'] = $this->settings['company_address'];

		 // $this->load->view('order_confirmation2',$data);

		$text = $this->load->view('order_confirmation2',$data,TRUE);
		$this->email->message($text);
		$this->email->send();
	}

	function tesmail(){
		$this->send_email_order(43,49);
	}

	function save_member_insured($order_id){

		for($i=0;$i<count($_POST['fullname']);$i++){

			if($_POST['fullname'][$i]!='' && $_POST['fullname'][$i]!=' '){
				$d = array(
				// 'insured_member_id' int(11) NOT NULL AUTO_INCREMENT,
					'order_id' => $order_id,
					'fullname' => $_POST['fullname'][$i],
					'datebirth' => $_POST['datebirth_participant'][$i]!='' ? backdate2($_POST['datebirth_participant'][$i]) : null,
					'relationship' => $_POST['relationship'][$i],
					'gender' => $_POST['gender'][$i],
					'no_identity' => $_POST['no_identity'][$i],
					'identity_type' => 2,

					// 'deleted' smallint(1) DEFAULT '0',
					// 'userin' int(255) DEFAULT NULL,
					'datein' => date('Y-m-d H:m:s')
					// 'usermod' int(255) DEFAULT NULL,
					// 'datemod' datetime DEFAULT NULL,
				);
				$this->db->insert('insured_member',$d);
			}
			// echo $this->db->last_query();	
		}

		// die;
		
	}

	function save_user(){
		$data = array(
				'user_type_id'=> 3,
				'username' => $this->input->post('email_reg'),
				'password' => rand(11111,99999),
				'email' => $this->input->post('email_reg'),
				'dateregistered' => date('Y-m-d H:m:s'),
				'datein' => date('Y-m-d H:m:s')
		);
		$this->db->insert('users',$data);
		return $this->db->insert_id();
	}

	function save_order($insured_id){
		$q = $this->db->query("select max(order_id) as id
									from ".DB_NAME.".order")->row();
		$order_id = $q->id+1;

		$departure_id = $this->db->query("select departure_id from departure where depart_name = '".$this->input->post('departure_id')."' ")->row();
		$destination_id = $this->db->query("select destination_id from destination where dest_name = '".$this->input->post('destination_id')."' ")->row();

		$data = array(
				'order_id'=>$order_id,
				'order_no'=>rand(11111,99999).date('Ym'),
				'destination_id' => $destination_id->destination_id,
				'departure_id' => $departure_id->departure_id,
				'premium_id' => $this->input->post('premium_id'),
				'insured_id' => $insured_id,
				'intermediary_id'=>$this->input->post('intermediary_id'),
				'startdate' => backdate2($this->input->post('startdate')),
				'enddate' => backdate2($this->input->post('enddate')),
				'order_date' => date('Y-m-d H:m:s'),
				'payment_type'=>intval($this->input->post('payment_type_reg')),
				'send_notif_to_family' => $this->input->post('cb_notif_family'),
				'total_perluasan' => str_replace(',', '', $this->input->post('total_perluasan')),
				'total_ex_premi' => str_replace(',', '', $this->input->post('total_ex_premi')),
				'total_premi' => str_replace(',', '', $this->input->post('total_premi')),
				'other_fee' => str_replace(',', '', $this->input->post('other_fee')),
				'payment_fee' => str_replace(',', '', $this->input->post('payment_fee')),
				'total_amount' => str_replace(',', '', $this->input->post('total_amount')),
				'status' => 1,
				'issued_policy' => 2,
				'datein' => date('Y-m-d H:m:s'),
            	'voucher_id'=>$this->input->post('id_voucher_code'),
				'discount_amount' => str_replace(',', '', $this->input->post('discount_amount')),
            	
			);

		$this->db->insert('order',$data);
		return $data;		
	}

	function tes_dp(){
		$this->smarty->display('test_date.tpl');	
	}

	function save_order_ext($order_id){

		if(isset($_POST['extension'])){
			if(count($_POST['extension'])>0){
				foreach ($_POST['extension'] as $key => $value) {
					$q = $this->db->query("select extention_id,premium from extention where extention_id = ".$value." ")->row();
					$this->db->insert('order_ext',array(
							'order_id'=>$order_id,
							'extention_id'=>$q->extention_id,
							'rate'=>$q->premium,
							'datein'=>date('Y-m-d H:m:s')
						));
				}
			}
		}
		
		
	}

	function create_invoice_nusafin($user_id,$external_id,$payer_email=null,$description,$base_amount,$amount,$payment_method){
		$user = $this->db->query("select b.user_id,b.intermediary_name,c.email
							from insured a
							join intermediary b ON a.intermediary_id = b.intermediary_id
							join users c ON c.user_id=b.user_id
							where a.user_id = $user_id");
		// echo $this->db->last_query();
		if($user->num_rows()>0){
			
			$ruser = $user->row();
			$email = $ruser->email;
			$fullname = $ruser->intermediary_name;
		} else {
			return false;
		}

		$description = str_replace('%20', ' ', $description);
		$external_id_arr = explode('.',$external_id);
		$order_id = $external_id_arr[0];

		$inv = array(
				'order_id' =>  $order_id,
				'user_id' => $user_id,
				'status' => 'PENDING',
				'amount' => $amount,
				'payer_email' => $email,
				'description' => $description,
		 	);

		$this->db->insert('invoice',$inv);

		$invoice_id = $this->db->insert_id();

		$curl = curl_init();

		$payload = array(
					'external_id'=>$external_id,
					'base_amount'=>$base_amount,
					'amount'=>$amount,
					'invoice_date'=>date('Y-m-d'),
					'due_date'=>date('Y-m-d', strtotime("+1 day")),
					'memo'=>$description,
					'email'=>$email,
					'fullname'=>$fullname,
					'send_mail'=>1,
					'payment_method'=>$payment_method
		);

		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, API_URL_NUSAFIN.'customer/create_invoice2');
		curl_setopt($curl, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
		curl_setopt($curl, CURLOPT_USERPWD, API_KEY_NUSAFIN.":");
		curl_setopt($curl, CURLOPT_TIMEOUT, 30);
		curl_setopt($curl, CURLOPT_POST, 1);
		curl_setopt($curl, CURLOPT_POSTFIELDS, $payload);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);

		
		$response = json_decode(curl_exec($curl));
		$err = curl_error($curl);

		
		curl_close($curl);

		if ($err) {
			$resp = array('success'=>false,'message'=>$err);
			 // echo "cURL Error #:" . $err;
		} else {
			// print_r($response);
			if(!$response->{'status'}){
				$resp = array('success'=>false,'message'=>$response->{'message'});
			} else {
				$resp = array('success'=>true,'message'=>'Invoice created successfully','invoice_id'=>$invoice_id);
			}
			  
			if($resp['success']){
				$this->db->where('invoice_id',$invoice_id);
				$this->db->update('invoice',array(
					'invoice_url'=>$response->{'url_invoice'}
				));
			}
						
		}
		
		return $resp;
	}

	function create_invoice($external_id,$payer_email,$description,$amount){		

		require DOCUMENTROOT.'/vendor/autoload.php'; 

		 $options['secret_api_key'] = SECRET_API_KEY; 

		 $xenditPHPClient = new XenditClient\XenditPHPClient($options); 

		 // $external_id = 'SNI'.rand(111,999);
		 // $payer_email = 'imamteguh1@gmail.com';
		 // $description = 'Asuransi Travel Perjalanan';
		 // $amount = 26000;
		 // $options['should_send_email'] = 'true';

		 $response = $xenditPHPClient->createInvoice((string) $external_id, $amount, $payer_email, $description, $options);
		 // print_r($response); 

		$qset = $this->db->query("select * from settings")->row();

		$qorder = $this->db->query("select payment_type from ".DB_NAME.".order where order_id = ".$external_id." " )->row();
		$payment_type = $qorder->payment_type;

		if($payment_type==1){
			//va
			$sni_fee_amount = $qset->virtual_account_fee_sni;
			$xnd_fee_amount = $qset->virtual_account_fee_cust;
		} else {
			//cc
			$sni_fee_amount = $qset->credit_card_fee_trx_sni;
			$xnd_fee_amount = $qset->credit_card_fee_trx_cust+($qset->credit_card_fee_mdr_cust/100);
		}

			// $xendit_fee_amount = isset($response['xendit_fee_amount']) ? $response['xendit_fee_amount'] : null;
			// $received_amount = isset($response['received_amount']) ? $response['received_amount'] : null;

		  $inv = array(
				'order_id' =>  $external_id,
				'id_xd' => $response['id'],
				'user_id' => $response['user_id'],
				'xendit_fee_amount' => $xnd_fee_amount,
				'sni_fee_amount' => $sni_fee_amount,
				// 'received_amount' => isset($response['received_amount']) ? $response['received_amount'] : null,
				'status' => $response['status'],
				'merchant_name' => $response['merchant_name'],
				'merchant_profile_picture_url' => $response['merchant_profile_picture_url'],
				'amount' => $response['amount'],
				'payer_email' => $response['payer_email'],
				'description' => $response['description'],
				'expiry_date' => $response['expiry_date'],
				'invoice_url' => $response['invoice_url'],
				'should_exclude_credit_card' => $response['should_exclude_credit_card'],
				'should_send_email' => $response['should_send_email']
		 	);
		 $this->db->insert('invoice',$inv);

		 $invoice_id = $this->db->insert_id();

		 if(count($response['available_banks'])>0){
		 	foreach ($response['available_banks'] as $key => $value) {
			 	$bank = array(
						// 'invoice_bank_id' => $,
						'invoice_id' => $invoice_id,
						'bank_code' => $value['bank_code'],
						'collection_type' => $value['collection_type'],
						'bank_account_number' => $value['bank_account_number'],
						'transfer_amount' => $value['transfer_amount'],
						'bank_branch' => $value['bank_branch'],
						'account_holder_name' => $value['account_holder_name'],
						'identity_amount' => $value['identity_amount']
			 		);
			 	$this->db->insert('invoice_bank',$bank);
			 }
		 }
		 


		 return $invoice_id;
	}

	function email_checking(){
		if($this->input->get('logged')=='1'){
			$arr = json_encode(array('success'=>true,'message'=>'Email belum terdaftar'));
			echo $arr; die;
		}

		$q = $this->db->get_where('users',array('email'=>$this->input->get('email')));
		if($q->num_rows()>0){
			$arr = json_encode(array('success'=>false,'message'=>'Email sudah terdaftar'));
			echo $arr; die;
		} else {
			$arr = json_encode(array('success'=>true,'message'=>'Email belum terdaftar'));
			echo $arr; die;
		}
	}

	function send_sms_notif($intermediary_id,$order_no,$invoice_id){

		$q=$this->db->query("SELECT intermediary_agent_handphone,intermediary_agent_email from intermediary where intermediary_id=$intermediary_id")->row();
		// print_r($q);
		$phone_number = $q->intermediary_agent_handphone;
		$email        = $q->intermediary_agent_email;
		$content = 'JASINDO TRAVEL. Terima Kasih telah melakukan pemesanan melalui Jasindo Travel, No order anda: '.$order_no.'. Invoince akan dikirimkan ke Email Anda '.$email.'. Berikut ini adalah tautaun untuk melakukan pembayaran '.site_url().'s/i/'.$invoice_id; 
		// echo $content;
		
		$this->send_sms($phone_number,$content);
	}
}
?>