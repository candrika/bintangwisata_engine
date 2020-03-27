<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Payment extends MY_Controller {

	public function index()
	{
		require_once(DOCUMENTROOT.'/assets/libs/veritrans-php/Veritrans.php');

		//Set Your server key
		Veritrans_Config::$serverKey = "VT-server-tbXU0rm_7hlUOIKPTtSln369";

		// Uncomment for production environment
		// Veritrans_Config::$isProduction = true;

		// Enable sanitization
		Veritrans_Config::$isSanitized = true;

		// Enable 3D-Secure
		Veritrans_Config::$is3ds = true;

		// Required
		$transaction_details = array(
		  'order_id' => rand(),
		  'gross_amount' => 94000, // no decimal allowed for creditcard
		);

		// Optional
		$item1_details = array(
		  'id' => 'a1',
		  'price' => 18000,
		  'quantity' => 3,
		  'name' => "Apple"
		);

		// Optional
		$item2_details = array(
		  'id' => 'a2',
		  'price' => 20000,
		  'quantity' => 2,
		  'name' => "Orange"
		);

		// Optional
		$item_details = array ($item1_details, $item2_details);

		// Optional
		$billing_address = array(
		  'first_name'    => "Andri",
		  'last_name'     => "Litani",
		  'address'       => "Mangga 20",
		  'city'          => "Jakarta",
		  'postal_code'   => "16602",
		  'phone'         => "081122334455",
		  'country_code'  => 'IDN'
		);

		// Optional
		$shipping_address = array(
		  'first_name'    => "Obet",
		  'last_name'     => "Supriadi",
		  'address'       => "Manggis 90",
		  'city'          => "Jakarta",
		  'postal_code'   => "16601",
		  'phone'         => "08113366345",
		  'country_code'  => 'IDN'
		);

		// Optional
		$customer_details = array(
		  'first_name'    => "Andri",
		  'last_name'     => "Litani",
		  'email'         => "andri@litani.com",
		  'phone'         => "081122334455",
		  'billing_address'  => $billing_address,
		  'shipping_address' => $shipping_address
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
		echo "snapToken = ".$snapToken;
	}

	function invoice_page($id){
		$q = $this->db->get_where('invoice',array('invoice_id'=>$id));
		if($q->num_rows()<=0){
			echo 'not found'; die;
		} else {
			$r = $q->result_array()[0];

			if (strpos($r['invoice_url'], 'nusafin.com') !== false) {
			    echo "<script>location.href='".$r['invoice_url']."';</script>";
			}

			$this->load->model('m_order');

			$order = $this->m_order->order_detail($r['order_id']);
		 // print_r($order); die;

			$status = $q->status='PENDING' ? 'Belum Dibayar' : 'Sudah Dibayar';
			$this->smarty->assign('order', $order);	
			$this->smarty->assign('status', $status);	
			$this->smarty->assign('data', $r);	

			// print_r($r);

			$qbank = $this->db->get_where('invoice_bank',array('invoice_id'=>$r['invoice_id'],'bank_code'=>'MANDIRI'));
			if(!isset($qbank->result_array()[0])){
				echo 'Terjadi kesalahan. Harap hubungi admin lebih lanjut <br><br> invoice id:'.$r['invoice_id']; die;
			}

			$this->smarty->assign('mandiri', $qbank->result_array()[0]);
			$qbank = $this->db->get_where('invoice_bank',array('invoice_id'=>$r['invoice_id'],'bank_code'=>'BCA'));
			// $this->smarty->assign('bca', $qbank->result_array()[0]);
			 $this->smarty->assign('bca', null);
			$qbank = $this->db->get_where('invoice_bank',array('invoice_id'=>$r['invoice_id'],'bank_code'=>'BNI'));
			$this->smarty->assign('bni', $qbank->result_array()[0]);
			$qbank = $this->db->get_where('invoice_bank',array('invoice_id'=>$r['invoice_id'],'bank_code'=>'BRI'));
			$this->smarty->assign('bri', $qbank->result_array()[0]);
		}
		$this->smarty->assign('content_tpl', 'invoice_page.tpl');	
		$this->smarty->display('app_template_blank.tpl');	
	}

	function notification(){
		print_r($_POST);
	}

	function finish(){
		print_r($_POST);
	}

	function unfinish(){
		print_r($_POST);
	}

	function error(){
		print_r($_POST);
	}

	function save_result(){

		/*
			payment_type : 
				bank_transfer: bca

		*/

		$data = array(
			'status_code' => $this->input->post('result[status_code]'),
			'status_message' => $this->input->post('result[status_message]'),
			'transaction_id' => $this->input->post('result[transaction_id]'),
			'order_id'  => $this->input->post('result[order_id]'),
			'gross_amount'  => $this->input->post('result[gross_amount]'),
			'payment_type' => $this->input->post('result[payment_type]'),
			'transaction_time'  => $this->input->post('result[transaction_time]'),
			'transaction_status'  => $this->input->post('result[transaction_status]'),
			// 'va_numbers_bank' => $this->input->post('result[va_numbers_bank]'),
			// 'va_numbers_no' => $this->input->post('result[va_numbers_no]'),
			'fraud_status' => $this->input->post('result[fraud_status]'),
			'pdf_url' => $this->input->post('result[pdf_url]'),
			'finish_redirect_url'  => $this->input->post('result[finish_redirect_url]')
		);

		// if()

		$this->db->insert('payment_log',$data);
		
		$arr_ret = array('success'=>true,'message'=>'saved');
		echo json_encode($arr_ret);
	}

	function end(){
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'payment_end.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function finish_payment(){
		//xendit payment
		// $this->db->insert('payment_log_xd',array('id'=>111));
		 if ($_SERVER["REQUEST_METHOD"] === "POST") {
	        $data = json_decode(file_get_contents("php://input"));



	        // print_r("\n\$data contains the updated invoice data \n\n");
	        // print_r($data);
	        // print_r("\n\nUpdate your database with the invoice status \n\n");

	        $d = array(
        		// 'payment_id'=>$data
        		'id'=>$data->{'id'},
				'user_id'=>$data->{'user_id'},
				'external_id'=>$data->{'external_id'},
				'is_high'=>$data->{'is_high'},
				'status'=>$data->{'status'},
				'merchant_name'=>$data->{'merchant_name'},
				'amount'=>$data->{'amount'},
				'received_amount'=>$data->{'received_amount'},
				'payer_email'=>$data->{'payer_email'},
				'description'=>$data->{'description'},
				'xendit_fee_amount'=>$this->settings['virtual_account_fee_cust'],
				// 'sni_fee_amount'=>$data->{'sni_fee_amount'},
				'expiry_date'=>$data->{'expiry_date'},
				'invoice_url'=>$data->{'invoice_url'},
				'paid_amount'=>$data->{'paid_amount'},
				'payment_method'=>$data->{'payment_method'},
				'adjusted_received_amount'=>$data->{'adjusted_received_amount'},
				'adjusted_xendit_fee_amount'=>$data->{'adjusted_xendit_fee_amount'},
				'datein'=>date('Y-m-d H:m:s')
        	);
			$this->db->insert('payment_log_xd',$d);
			
			 if($data->{'merchant_name'}!='Xendit'){
				$cek = $this->db->get_where('order',array('order_id'=>intval($data->{'external_id'})));
				if($cek->num_rows()>0){
	
					if($data->{'status'}=='PAID'){
					
						//update di order 
						$this->db->where('order_id',intval($data->{'external_id'}));
						$this->db->update('order',array('status'=>2));
		
						//update di invoice
						$this->db->where('order_id',intval($data->{'external_id'}));
						$this->db->update('invoice',array('status'=>$data->{'status'}));
		
						//terbitkan polis
						// $this->load->library('../controllers/admin_panel');
						$this->create_policy($data->{'external_id'});
					}
					
				}
			}
			
        	

	    } else {
	        print_r("Cannot ".$_SERVER["REQUEST_METHOD"]." ".$_SERVER["SCRIPT_NAME"]);
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

		echo json_encode(array('success'=>true,'message'=>'Polis telah berhasil diterbitkan'));
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
}
?>