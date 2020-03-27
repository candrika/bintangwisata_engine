<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Order extends MY_Controller {

	public function index()
	{
		$this->smarty->assign('content_tpl', 'home_content.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function form($order_id){
		$this->load->model('m_order');

		$data = $this->m_order->order_detail($order_id);
		// print_r($data);
		$data_ext = $this->m_order->order_ext($order_id);
		$data_member = $this->m_order->order_member($order_id);

		// $cb = isset($data_ext[0]) ? 'checked' : null;
		$this->smarty->assign('cb_ext_a',isset($data_ext[0]) ? 'checked' : null);
		$this->smarty->assign('cb_ext_b',isset($data_ext[1]) ? 'checked' : null);
		$this->smarty->assign('cb_ext_c',isset($data_ext[3]) ? 'checked' : null);

		// print_r($data_member);

		$departure_id = str_replace('%20', '', $data['depart_name']);
		$destination_id = str_replace('%20', '', $data['dest_name']);
		$num_person = $data['total_anggota'];
		$category = $data['category'];
		$selected_package = $this->input->get('selected_package');
		$type = $data['type'];
		$startdate = $data['startdate'];
		$enddate = $data['enddate'];

		$this->smarty->assign('insured_id',$data['insured_id']);
		$this->smarty->assign('user_id',$data['user_id']);				

		$this->smarty->assign('rb_gold',null);
		$this->smarty->assign('rb_platinum',null);
		$this->smarty->assign('rb_diamond',null);
		if($data['category']=='Gold'){
			$this->smarty->assign('rb_gold','checked=checked');
		} else if($data['category']=='Platinum'){
			$this->smarty->assign('rb_platinum','checked=checked');
		} else if($data['category']=='Diamond'){
			$this->smarty->assign('rb_diamond','checked=checked');
		}
		$this->smarty->assign('selected_package',$selected_package);

		for($i=1;$i<=5;$i++){
			$options[$i] = $i;
		}
		$this->smarty->assign('cb_participant',form_dropdown('num_participant', $options, $num_person, ' id="num_participant" '));

		// echo $data['startdate'];
		// $this->smarty->assign('el_part',$this->el_part());
		$sd = isset($data['startdate']) ? backdate2($data['startdate']) : null; 
		$nd = isset($data['enddate']) ? backdate2($data['enddate']) : null; 

		if($sd!=null && $nd!=null){
			$count_days = count_days(backdate2($startdate),backdate2($enddate));
		} else {
			$count_days = 0;
		}

		$this->smarty->assign('data',$data);
		$this->smarty->assign('data_ext',$data_ext);
		$this->smarty->assign('data_member',$data_member);
		$this->smarty->assign('total_data_member',count($data_member));
		$this->smarty->assign('departure_id',$departure_id);
		$this->smarty->assign('destination_id',$destination_id);
		$this->smarty->assign('num_person',$num_person);
		$this->smarty->assign('category',$category);
		$this->smarty->assign('type',$type);
		$this->smarty->assign('startdate',$sd);
		$this->smarty->assign('enddate',$nd);
		$this->smarty->assign('num_days', $count_days);

		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('footer_display','display:none;');
		$this->smarty->assign('content_tpl', 'order_page_edit.tpl');	
		$this->smarty->display('app_template_noheader.tpl');	
	}

	function page(){
		// header("Location: https://www.jasindotravel.co.id/page/perbaikan"); /* Redirect browser */
		// exit();
		$this->load->model('m_data');

		if($this->session->userdata('user_type_id')==1){
			$this->smarty->assign('title_msg','Pemesanan Paket Asuransi');
			$this->smarty->assign('type','notice');
			$this->smarty->assign('content_msg','Tidak bisa melakukan pemesanan dengan user login Administrator.');
			$this->smarty->assign('content_tpl', 'message.tpl');	
			$this->smarty->display('app_template.tpl');	die;
		}
		
		$departure_id = str_replace('%20', '', $this->input->get('departure_id'));
		$destination_id = str_replace('%20', '', $this->input->get('destination_id'));
		$num_person = $this->input->get('num_person');
		$category = $this->input->get('category');
		$selected_package = $this->input->get('selected_package');
		$type = $this->input->get('type');
		$startdate = backdate2($this->input->get('startdate'));
		$enddate = backdate2($this->input->get('enddate'));

		// print_r($_SESSION); die;
		if($this->session->userdata('logged')){
			// print_r($_SESSION); die;
			$this->smarty->assign('birthdate',$this->session->userdata('birthdate'));
			$this->smarty->assign('insured_id',$this->session->userdata('insured_id'));
			$this->smarty->assign('user_id',$this->session->userdata('user_id'));			
			$this->smarty->assign('fullname',$this->session->userdata('firstname').' '.$this->session->userdata('lastname'));	
		} else {
			$this->smarty->assign('birthdate',$this->input->get('datebirth'));
			$this->smarty->assign('name_login',null);
			$this->smarty->assign('insured_id',null);
			$this->smarty->assign('user_id',null);
			$this->smarty->assign('fullname',null);	
		}
		
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

		for($i=1;$i<=5;$i++){
			$options[$i] = $i;
		}
		$this->smarty->assign('cb_participant',form_dropdown('num_participant', $options, $num_person, ' id="num_participant" '));

		// $this->smarty->assign('el_part',$this->el_part());
		$this->smarty->assign('dd_country',form_dropdown('country_id', $this->m_data->get_country(), null, ' id="country_id" '));
		$this->smarty->assign('departure_id',$departure_id);
		$this->smarty->assign('destination_id',$destination_id);
		$this->smarty->assign('num_person',$num_person);
		$this->smarty->assign('category',$category);
		$this->smarty->assign('type',$type);
		$this->smarty->assign('startdate',$this->input->get('startdate'));
		$this->smarty->assign('enddate',$this->input->get('enddate'));
		$this->smarty->assign('num_days',count_days(backdate2($startdate),backdate2($enddate)));

		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'order_page.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function proceed(){
		// print_r($_POST); die;

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

		//create user
		if($this->session->userdata('user_id')==''){
			$user_id = $this->save_user();
		} else {
			$user_id = $this->session->userdata('user_id');
		}

		//create insured
		if($this->session->userdata('insured_id')==''){
			$insured_id = $this->save_insured($user_id);
		} else {
			$insured_id = $this->session->userdata('insured_id');
		}

		//create order
		$inserted_order = $this->save_order($insured_id);		
		$order_id = $inserted_order['order_id'];

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
				// echo $order_id;
				// print_r($data);die;
				 $this->smarty->assign('token',null);
				// $this->smarty->assign('token',$this->get_token_payment($data));
				
				$external_id = $order_id.'.'.$inserted_order['order_no'];
				$desc = $data['region_name_detail'].' '.$data['category'].' '.$data['type'].' - '.ucwords($firstname.' '.$lastname);
				// if($payment_type==1){
				// 	//dipotong langsung klo va
				  $base_amount = $data['total_premi']+$data['total_perluasan']+$data['other_fee'];
					$total_amount = $data['total_amount'];
				// } else {
				// 	$total_amount = ($data['total_amount']-$data['payment_fee']);
				// }
				$inv = $this->create_invoice_nusafin($user_id,$external_id,$data['email'],'Asuransi Perjalanan '.$desc,$base_amount,$total_amount,$payment_type);

				if(!$inv['success']){
					 $this->db->trans_rollback();
					echo json_encode(array('success'=>false,'message'=>'Maaf terjadi kegagalan dalam memproses pemesanan Anda. Mohon muat ulang halaman ini dan silahkan coba melakukan pemesanan kembali. '.$inv['message'].''));
					return false;
				} else {
					 $this->db->trans_commit();
				}

				$invoice_id = $inv['invoice_id'];
				// $invoice_id = $this->create_invoice($order_id,$data['email'],'Asuransi Perjalanan :'.$desc,$data['total_amount']);
				// echo $order_id.','.$data['email'].','.'Asuransi Perjalanan :'.','.$desc,$data['total_amount']; die;
				$this->smarty->assign('invoice_id',$invoice_id);
				  // $this->smarty->assign('invoice_id',null);

		  //       //send email order
		        $this->send_email_order($user_id,$order_id);

		  //       //send email user information
					if($this->session->userdata('logged')!==true){
						// echo 'send email';
						$this->send_email_account($user_id);
					}

		  //       $this->smarty->assign('d',$data);
		  //       $this->smarty->assign('footer_display','display:none;');
		        
				// $this->smarty->assign('content_tpl', 'order_confirmation.tpl');	
				// $this->smarty->display('app_template_nofooter.tpl');	

				echo json_encode(array('success'=>true,'url_direct'=>site_url('order/order_info_page/'.$order_id)));
		}
	}

	function get_token_payment($data){
		require_once(DOCUMENTROOT.'/assets/libs/veritrans/Veritrans.php');

		//Set Your server key
		Veritrans_Config::$serverKey = "VT-server-tbXU0rm_7hlUOIKPTtSln369";

		// Uncomment for production environment
		// Veritrans_Config::$isProduction = true;

		// Enable sanitization
		Veritrans_Config::$isSanitized = true;

		// Enable 3D-Secure
		Veritrans_Config::$is3ds = true;

		$total_amount = str_replace('.00', '', $data['total_amount']);

		// Required
		$transaction_details = array(
		  'order_id' => $data['order_no'],
		  'gross_amount' => $total_amount, // no decimal allowed for creditcard
		);

		// Optional
		$item1_details = array(
		  'id' => 'a1',
		  'price' => $total_amount,
		  'quantity' => 1,
		  'name' => $data['category'].' '.$data['type']
		);

		// Optional
		// $item2_details = array(
		//   'id' => 'a2',
		//   'price' => 20000,
		//   'quantity' => 2,
		//   'name' => "Orange"
		// );

		// Optional
		$item_details = array ($item1_details);

		// Optional
		// $billing_address = array(
		//   'first_name'    => "Andri",
		//   'last_name'     => "Litani",
		//   'address'       => "Mangga 20",
		//   'city'          => "Jakarta",
		//   'postal_code'   => "16602",
		//   'phone'         => "081122334455",
		//   'country_code'  => 'IDN'
		// );

		// Optional
		// $shipping_address = array(
		//   'first_name'    => "Obet",
		//   'last_name'     => "Supriadi",
		//   'address'       => "Manggis 90",
		//   'city'          => "Jakarta",
		//   'postal_code'   => "16601",
		//   'phone'         => "08113366345",
		//   'country_code'  => 'IDN'
		// );

		// Optional
		$customer_details = array(
		  'first_name'    => $data['firstname'],
		  'last_name'     => $data['lastname'],
		  'email'         => $data['email'],
		  'phone'         => $data['phone_number'],
		  // 'billing_address'  => $billing_address,
		  // 'shipping_address' => $shipping_address
		);

		// Optional, remove this to display all available payment methods
		$enable_payments = array('credit_card','cimb_clicks','mandiri_clickpay','echannel');

		// Fill transaction details
		$transaction = array(
		  // 'enabled_payments' => $enable_payments,
		  'transaction_details' => $transaction_details,
		  'customer_details' => $customer_details,
		  'item_details' => $item_details,
		);

		$snapToken = Veritrans_Snap::getSnapToken($transaction);
		return $snapToken;
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
		// $data['d'] = $this->m_order->order_detail($order_id);
		// $data['mode'] = $mode; 
		// $data['print'] = $print; 
		// // print_r($data); die;
		// $this->load->view('order_confirmation',$data);
		$d = $this->m_order->order_detail($order_id);
		// print_r($d); die;
		$this->smarty->assign('footer_display','display:none;');
		$this->smarty->assign('d',$d);

		$this->smarty->assign('invoice_id',$d['invoice_id']);
		$this->smarty->assign('content_tpl', 'order_confirmation.tpl');	
		$this->smarty->display('app_template_nofooter.tpl');	
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
	}

	function send_email_order($user_id,$order_id){
		// echo 'send send_email_order';
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
			
		}

		
	}

	function save_insured($user_id){
		$data = array(
					// 'insured_id' int(255) NOT NULL AUTO_INCREMENT,
				'user_id' => $user_id,
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
				// 'dateactivated' datetime DEFAULT NULL,
				// 'deleted' smallint(1) DEFAULT '0' COMMENT '1: Deleted',
				// 'userin' int(255) DEFAULT NULL,
				'datein' => date('Y-m-d H:m:s'),
				// 'usermod' int(255) DEFAULT NULL,
				// 'datemod' datetime DEFAULT NULL,
				'status' => 1
		);
		$this->db->insert('insured',$data);
		return $this->db->insert_id();
	}

	function save_user(){
		$data = array(
				'user_type_id'=> 3,
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
				// 'extention_id' int(11) DEFAULT NULL,
				'startdate' => backdate2($this->input->post('startdate')),
				'enddate' => backdate2($this->input->post('enddate')),
				'order_date' => date('Y-m-d H:m:s'),
				'payment_type'=>intval($this->input->post('payment_type_reg')),
				// 'payment_date' datetime DEFAULT NULL,
				// 'payment_channel_id' smallint(1) DEFAULT NULL,
				// 'other_fee' float(12,2) DEFAULT NULL,
				// 'tax_amount' float(12,2) DEFAULT NULL,
				// 'included_tax' smallint(1) DEFAULT NULL COMMENT '1. Included 2. Exclude',
				// 'payment_amount' => str_replace(',', '', $this->input->post('payment_amount')),
				'total_perluasan' => str_replace(',', '', $this->input->post('total_perluasan')),
				'total_ex_premi' => str_replace(',', '', $this->input->post('total_ex_premi')),
				'total_premi' => str_replace(',', '', $this->input->post('total_premi')),
				'other_fee' => str_replace(',', '', $this->input->post('other_fee')),
				'payment_fee' => str_replace(',', '', $this->input->post('payment_fee')),
				'discount_amount' => str_replace(',', '', $this->input->post('discount_amount')),
				'total_amount' => str_replace(',', '', $this->input->post('total_amount')),
				// 'payment_notes' varchar(255) DEFAULT NULL,
				'status' => 1,
            	'voucher_id'=>$this->input->post('id_voucher_code'),
				'issued_policy' => 2,
				// 'policy_no' varchar(225) DEFAULT NULL,id_voucher_code
				// 'deleted' smallint(1) DEFAULT NULL,
				// 'userin' int(255) DEFAULT NULL,
				'datein' => date('Y-m-d H:m:s'),
				'send_notif_to_family' => $this->input->post('cb_notif_family')
			);
// print_r($data);
		$this->db->insert('order',$data);
		return $data;		
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

	function tes_dp(){
		$this->smarty->display('test_date.tpl');	
	}
	
	function send_paid_sms_notif($order_id){
		//get no order/intermediary_id
			$qorder = $this->db->query("select order_no,a.intermediary_id,c.intermediary_agent_handphone,b.phone_number
				from ".DB_NAME.".order a
				join insured b ON a.insured_id = b.insured_id
				left join intermediary c ON a.intermediary_id = c.intermediary_id
				where a.order_id = $order_id")->row();

			$order_no = $qorder->order_no;
			$intermediary_id = $qorder->intermediary_id;

			if($intermediary_id==null){
				//pembelian personal	
				$number = $qorder->phone_number;
			} else {
				//pembelian dari agen, kirim ke agen
				$number = $qorder->intermediary_agent_handphone;
			}

			$content = 'JASINDO TRAVEL. Terima Kasih telah melakukan pembayaran Asuransi Perjalanan dengan nomor pesanan: '.$qorder->order_no.'. Polis akan dikirimkan melalui Email Anda.';					
			if($number!='' && $number!=null){
				$this->send_sms($number,$content);
			}
	}

	function create_invoice_nusafin($user_id,$external_id,$payer_email=null,$description,$base_amount,$amount,$payment_method){
		$user = $this->db->query("select a.user_id,a.firstname,a.lastname,b.email,a.phone_number,c.intermediary_agent_email,c.intermediary_agent_handphone
							from insured a
							join users b ON a.user_id = b.user_id
							left join intermediary c ON a.intermediary_id = c.intermediary_id
							where a.user_Id = $user_id");
		if($user->num_rows()>0){
			$ruser = $user->row();
			$email = $ruser->email;
			$fullname = $ruser->firstname.' '.$ruser->lastname;
		} else {
			return false;
		}

		$description = str_replace('%20', ' ', $description);
		$external_id_arr = explode('.',$external_id);
		$order_id = $external_id_arr[0];

		//get no order/intermediary_id
		$qorder = $this->db->query("select order_no,intermediary_id from ".DB_NAME.".order where order_id = $order_id")->row();
		$order_no = $qorder->order_no;
		$intermediary_id = $qorder->intermediary_id;

		if($intermediary_id==null){
			//pembelian personal						
			$email = $ruser->email;
			$number = $ruser->phone_number;
		} else {
			//pembelian dari agen, kirim ke agen
			$email = $ruser->intermediary_agent_email;
			$number = $ruser->intermediary_agent_handphone;
		}

		

		$inv = array(
				'order_id' =>  $order_id,
				// 'id_xd' => $response['id'],
				'user_id' => $user_id,
				// 'xendit_fee_amount' => $xnd_fee_amount,
				// 'sni_fee_amount' => $sni_fee_amount,
				// 'received_amount' => isset($response['received_amount']) ? $response['received_amount'] : null,
				'status' => 'PENDING',
				// 'merchant_name' => $response['merchant_name'],
				// 'merchant_profile_picture_url' => $response['merchant_profile_picture_url'],
				'amount' => $amount,
				'payer_email' => $email,
				'description' => $description,
				// 'expiry_date' => $response['expiry_date'],
				// 'invoice_url' => $response['invoice_url']
				// 'should_exclude_credit_card' => $response['should_exclude_credit_card'],
				// 'should_send_email' => $response['should_send_email']
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
			// curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type: application/xml', $additionalHeaders));
			curl_setopt($curl, CURLOPT_URL, API_URL_NUSAFIN.'customer/create_invoice2');
			curl_setopt($curl, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
			// curl_setopt($curl, CURLOPT_HEADER, 1);
			curl_setopt($curl, CURLOPT_USERPWD, API_KEY_NUSAFIN.":");
			curl_setopt($curl, CURLOPT_TIMEOUT, 30);
			curl_setopt($curl, CURLOPT_POST, 1);
			curl_setopt($curl, CURLOPT_POSTFIELDS, $payload);
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);

			// $response = curl_exec($curl);
			// $err = curl_error($curl);

			$response = json_decode(curl_exec($curl));
			$err = curl_error($curl);

			// echo 'send req invoice ';

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

					$short_url = site_url().'s/i/'.$invoice_id;
					$content = 'JASINDO TRAVEL. Terima kasih telah melakukan pembelian Asuransi Perjalanan Jasindo Travel dengan nomor pesanan '.$order_no.'. Berikut ini adalah tautan untuk melakukan pembayaran: '.$short_url;
					
					if($number!='' && $number!=null){
						$this->send_sms($number,$content);
					}
					
				}
				

				
			}

			// print_r($resp);
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

	function send_sms_family($name,$number){
		$content = "Bapak/Ibu ".$name." melakukan perjalanan dengan menggunakan Polis Asuransi Jasindo Travel. Untuk info lebih lanjut hubungi call center 1500073 atau akses www.jasindotravel.co.id";
		// echo $text;
		if($number!='' && $number!=null){
			$this->send_sms($number,$content);
		}
	}

	function create_policy($order_id){
		$this->load->model('m_order');

		$data = $this->m_order->order_detail($order_id);
		if($data===false){
			return false;
		}

		// if($data['policy_no']!='' && $data['policy_no']!=null){
		// 	echo json_encode(array('success'=>true,'message'=>'Polis sudah diterbitkan'));
		// 	exit;
		// }

		if($data['policy_no']==null){
			//generate policy number
			$no_polis = rand(11111,99999).date('Ymd');

			$this->db->where('order_id',$data['order_id']);
			$this->db->update('order',array('policy_no'=>$no_polis,'issued_policy'=>1));
		} else {
			$no_polis = $data['policy_no'];
		}
		
		$filename = $no_polis.'_'.$data['firstname'].'_'.$data['lastname'].'.pdf';

		$this->db->where('order_id',$data['order_id']);
		$this->db->update('order',array('file_policy'=>$filename));

		$opt_int_gold = $data['category']=='Gold' ? 'checked' : null;
		$opt_int_platinum = $data['category']=='Platinum' ? 'checked' : null;
		$opt_int_diamond = $data['category']=='Diamond' ? 'checked' : null;
		$opt_int_domestic = $data['region_id']==4 ? 'checked' : null;

		$data_ext = $this->m_order->order_ext($order_id);

		$cb_ext_a = isset($data_ext[0]) ? 'checked' : null;
		$cb_ext_b = isset($data_ext[1]) ? 'checked' : null;
		$cb_ext_c = isset($data_ext[2]) ? 'checked' : null;
		
		$data_member = $this->m_order->order_member($order_id);
		
		$data['opt_type_single'] = $data['type']=='Single' ? 'checked' : null;
		$data['opt_type_duo'] = $data['type']=='Duo' ? 'checked' : null;
		$data['opt_type_fam'] = $data['type']=='Family' ? 'checked' : null;

		$data['opt_int_gold'] = $opt_int_gold;
		$data['opt_int_platinum'] = $opt_int_platinum;
		$data['opt_int_diamond'] = $opt_int_diamond;
		$data['opt_domestic'] = $opt_int_domestic;
		$data['cb_ext_a'] = $cb_ext_a;
		$data['cb_ext_b'] = $cb_ext_b;
		$data['cb_ext_c'] = $cb_ext_c;
		$data['data'] = $data;
		$data['data_ext'] = $data_ext;
		$data['data_member'] = $data_member;
		$data['policy_no'] = $no_polis;

		if($data['no_payment']==null){
			
		}

		$text = $this->load->view('policy_page',$data,TRUE);
		$this->dompdf->loadHtml($text);

		// (Optional) Setup the paper size and orientation
		$this->dompdf->setPaper('A4', 'portrait');

		// Render the HTML as PDF
		$this->dompdf->render();

		// $this->dompdf->stream("dompdf_out.pdf", array("Attachment" => false));

		$output = $this->dompdf->output();
// echo $no_polis.'_'.$data['firstname'].'_'.$data['lastname'].'.pdf';
		file_put_contents(DOCUMENTROOT.'policy/'.$filename, $output);

		$this->send_policy($no_polis,$data['email'],$data['firstname'].' '.$data['lastname'],$filename);
		// exit(0);		// Output the generated PDF to Browser
		// $this->dompdf->stream();

		//send sms
		$content = 'JASINDO TRAVEL. Selamat!. Polis Asuransi Perjalanan Anda telah terbit dengan Nomor Polis: '.$no_polis.'. Berkas Polis telah dikirim melalui email Anda. Terima Kasih';					
		$number = $data['phone_number'];
		if($number!='' && $number!=null){
			$this->send_sms($number,$content);
		}

		if($data['send_notif_to_family']==1){
			$name = $data['firstname'].' '.$data['lastname'];
			$this->send_sms_family($name,$data['heirs_phone']);
		}
		

		// /echo json_encode(array('success'=>true,'message'=>'Polis telah berhasil diterbitkan'));
	}

	function send_policy($no_polis,$email,$fullname,$filename){
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

		$this->email->attach(DOCUMENTROOT."policy/".$filename, "inline");
		$this->email->attach(DOCUMENTROOT."assets/wording_polis_jasindo_travel.pdf", "inline");
		$this->email->attach(DOCUMENTROOT."assets/syarat_dan_ketentuan_jasindo_travel_insurance.pdf", "inline");
		// $this->email->attach(DOCUMENTROOT."assets/tpl/images/logo.png", "inline");
		$this->email->attach(DOCUMENTROOT."assets/benefit_jasindo.png", "inline");
		$this->email->from('admin@jasindotravel.com', 'Jasindo Travel');
		$this->email->to($email);
		$this->email->subject('Polis Asuransi Jasindo Travel');
		$data = array(
				'no_polis'=>$no_polis,
				'fullname'=>$fullname
			);
		$text = $this->load->view('policy_confirm',$data,TRUE);
		$this->email->message($text);
		$this->email->send();
	}

	function nusafin_callback(){
		if ($_SERVER["REQUEST_METHOD"] === "POST") {
        $data = json_decode(file_get_contents("php://input"),true);
        // print_r($data);
   

        $data_insert = array(
           'id'=>$data['id'],
            // 'user_id'=>$data['user_id'],
            'external_id'=>$data['external_id'],
            'status'=>$data['status'],
            // 'merchant_name'=>$data['merchant_name'],
            'amount'=>$data['amount'],
            // 'payer_email'=>$data['payer_email'],
            // 'description'=>$data['description'],
            'paid_amount'=>$data['paid_amount'],
            'payment_method'=>$data['payment_method'],
            'discount'=>$data['discount'],
            'fees_paid_amount'=>$data['fees_paid_amount'],
            'adjusted_received_amount'=>$data['adjusted_received_amount'],
            'date_trx'=>$data['date_trx']
        );

        $this->db->insert('nusafin_log',$data_insert);

		$arr = explode('.',$data_insert['external_id']);
		if(count($arr)>1){
			$order_id = $arr[0];

			//send sms
			$this->send_paid_sms_notif($order_id);
			//end sending sms

			 $this->db->where('order_id',$order_id);
       		 $this->db->update('invoice',array(
        		'status'=>'COMPLETED',        		
            	'xendit_fee_amount'=>4000,
            	'sni_fee_amount'=>1000,
			));
			
			$this->db->where('order_id',$order_id);
       		 $this->db->update('order',array(
        		'status'=>2     
			));
			

			//query untuk cek ada intermediary di order
			$q = $this->db->query("SELECT a.intermediary_id
								   FROM ".DB_NAME.".order a
								   where a.order_id=$order_id");

			if($q->num_rows() >0){
				
				$r = $q->row();

				if($r->intermediary_id !=null){

					$this->create_policy($order_id);

					$cek_user_account = $this->db->query("SELECT a.insured_id 
														  FROM ".DB_NAME.".order a
														  where a.intermediary_id=".$r->intermediary_id." and a.order_id=$order_id");
					if($cek_user_account->num_rows() >0){
						$cek = $cek_user_account->row();
						$this->send_notive($cek->insured_id);
					}	
				}else{
					$this->create_policy($order_id);

				}
			}else
			{
					$this->create_policy($order_id);
			}

			
			
		} 
       

	    } else {
	        print_r("Cannot ".$_SERVER["REQUEST_METHOD"]." ".$_SERVER["SCRIPT_NAME"]);
	    }
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

	function send_notive($insured_id){

		$q = $this->db->query("select a.user_id,b.email,a.phone_number,b.send_mail_status,c.intermediary_name from insured a
							   join users b ON b.user_id=a.user_id
							   join intermediary c on c.intermediary_id=a.intermediary_id
							   where a.insured_id=$insured_id and b.send_mail_status is null");

		if($q->num_rows()>0){
			$r=$q->row();

			if($r->send_mail_log==0 or $r->send_mail_log==''){
				$this->send_email_account($r->user_id);

				$this->db->where('user_id',$r->user_id);
				$this->db->update('users',array(
					'send_mail_status'=>1
				));


				$number  = $r->phone_number;

				$content = 'JASINDO TRAVEL. Akun anda telah didaftarkan oleh agen '.$r->intermediary_name.' silahkan cek emai anda '.$r->email.' untuk informasi lebih lanjut';					
				if($number!='' && $number!=null){
					$this->send_sms($number,$content);
				}
			}

		}

	}
}
