<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin_panel extends MY_Controller {

	public function index()
	{	
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'admin_panel.tpl');	
		$this->smarty->display('app_template_admin.tpl');	
	}

	function message(){
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'admin/message_tab.tpl');	
		$this->smarty->display('app_template_admin.tpl');	
	}

	function inbox_page(){
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'admin/inbox_list.tpl');	
		$this->smarty->display('app_template_ext.tpl');	
	}

	function inbox(){
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'admin/inbox_list.tpl');	
		$this->smarty->display('app_template_admin.tpl');	
	}

	function outbox(){
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'admin/outbox_list.tpl');	
		$this->smarty->display('app_template_admin.tpl');	
	}

	function participant(){
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'admin/participant_list.tpl');	
		$this->smarty->display('app_template_admin.tpl');	
	}

	function order(){
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'admin/order_list.tpl');	
		$this->smarty->display('app_template_admin.tpl');	
	}

	function invoice(){
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'admin/invoice_list.tpl');	
		$this->smarty->display('app_template_admin.tpl');	
	}

	function user(){
		//user
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'admin/user_list.tpl');	
		$this->smarty->display('app_template_admin.tpl');	
	}

	function claim(){
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'admin/claim_list.tpl');	
		$this->smarty->display('app_template_admin.tpl');	
	}

	function setting(){
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'admin/settings_form.tpl');	
		$this->smarty->display('app_template_admin.tpl');	
	}

	function setting_save(){
		$this->db->trans_begin();

		$data = array(
				'site_title'=> $this->input->post('site_title'),
				'site_description'=> $this->input->post('site_description'),
				'site_keywords'=> $this->input->post('site_keywords'),
				'site_lang'=> $this->input->post('site_lang'),
				'logo'=> $this->input->post('logo'),
				'email_inbox'=> $this->input->post('email_inbox'),
				'materai_fee'=> $this->input->post('materai_fee'),
				'policy_fee_domestic'=> $this->input->post('policy_fee_domestic'),
				'policy_fee_international'=> $this->input->post('policy_fee_international'),
				'cs_email1'=> $this->input->post('cs_email1'),
				'cs_email2'=> $this->input->post('cs_email2'),
				'cs_phone1'=> $this->input->post('cs_phone1'),
				'cs_phone2'=> $this->input->post('cs_phone2'),
				'cs_phone3'=> $this->input->post('cs_phone3'),
				'company_address'=> $this->input->post('company_address'),
				'min_age_extra_premi'=> $this->input->post('min_age_extra_premi'),
				'max_age_extra_premi'=> $this->input->post('max_age_extra_premi'),
				'percent_extra_premi'=> $this->input->post('percent_extra_premi'),
				'sender_mail_address' => $this->input->post('sender_mail_address')
			);
		$this->db->update('settings',$data);

		$this->db->where('currency_id',2);
		$this->db->update('ms_currency',array('rate'=>$this->input->post('rate_usd')));

		if ($this->db->trans_status() === FALSE)
		{
	        $this->db->trans_rollback();
			$arr_ret = array('success'=>false,'message'=>'Ubah status klaim gagal.');
		} else {
			$this->db->trans_commit();
			$arr_ret = array('success'=>true,'message'=>'Ubah status klaim berhasil.');
		}

		echo json_encode($arr_ret);
	}

	function create_policy($order_id){
		$this->load->model('m_order');

		$data = $this->m_order->order_detail($order_id);

		// if($data['policy_no']!='' && $data['policy_no']!=null){
		// 	echo json_encode(array('success'=>true,'message'=>'Polis sudah diterbitkan'));
		// 	exit;
		// }

		if($data['policy_no']==null || $data['policy_no']==''){
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

	function send_notif_claim($claim_id){
		$q = $this->db->query("select a.claim_id,a.notes_admin,a.no_claim,a.order_id,c.firstname,c.lastname,DATE_FORMAT(a.datein, '%d/%m/%Y') as datein,d.email,
					case 
						when claim_status = 1 then 'Open'
						when claim_status = 2 then 'Settled'
						when claim_status = 3 then 'Accepted/Paid'
						when claim_status = 4 then 'Rejected'
					end as claim_status
					from claim a
					join ".DB_NAME.".order b ON a.order_id = b.order_id
					join insured c ON c.insured_id = b.insured_id
					join users d ON c.user_id = d.user_id
					where a.claim_id = $claim_id ");
		$r = $q->row();

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
		$this->email->to($r->email);
		$this->email->subject('Info Klaim Asuransi Jasindo Travel');
		$data = array(
				'no_claim'=>$r->no_claim,
				'fullname'=>$r->firstname.' '.$r->lastname,
				'status'=>$r->claim_status,
				'notes'=>$r->notes_admin
			);
		
		// $this->load->view('email/claim_notification',$data);
		// exit;

		$text = $this->load->view('email/claim_notification',$data,TRUE);
		$this->email->message($text);
		$this->email->send();

		// echo $this->email->print_debugger();
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
		$this->email->attach(DOCUMENTROOT."assets/benefit_jasindo.png", "inline");
		// $this->email->attach(DOCUMENTROOT."assets/tpl/images/logo.png", "inline");
		$this->email->from($this->settings['sender_mail_address'], 'Jasindo Travel');
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

	function issuing_policy($order_id){
		// $order_id = $this->input->post('order_id');

		// $q = $this->db->query("select email,password from users where user_id = $user_id")->row();

		// $this->email->initialize(array(
		//   'protocol' => 'smtp',
		//   'smtp_host' => 'smtp.sendgrid.net',
		//   'smtp_user' => 'persaki',
		//   'smtp_pass' => 'persaki123',
		//   'charset' => 'utf-8',
		//   'mailtype' => 'html',
		//   'smtp_port' => 587,
		//   'crlf' => "\r\n",
		//   'newline' => "\r\n"
		// ));

		// $this->email->attach(DOCUMENTROOT."assets/tpl/images/logo.png", "inline");
		// $this->email->from('admin@jasindotravel.com', 'Jasindo Travel');
		// $this->email->to($q->email);
		// $this->email->subject('User Account Infromation Jasindo Travel');
		// $data = array(
		// 		'email'=>$q->email,
		// 		'password'=>$q->password,
		// 	);
		// $text = $this->load->view('user_information',$data,TRUE);
		// $this->email->message($text);
		// $this->email->send();

		$this->load->model('m_order');

		$data = $this->m_order->order_detail($order_id);
		// print_r($data);
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
		// print_r($data); die;
		$this->load->view('policy_page',$data);
	}

	function news(){
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'admin/news_list.tpl');	
		$this->smarty->display('app_template_admin.tpl');	
	}

	function news_add(){
		$this->smarty->assign('d',null);
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('title','Tambah Berita');
		$this->smarty->assign('content_tpl', 'admin/news_form.tpl');	
		$this->smarty->display('app_template_iframe2.tpl');	
	}

	function news_edit($id){
		$d = $this->db->get_where('news',array('news_id'=>$id))->result_array()[0];
		$this->smarty->assign('d',$d);
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('title','Ubah Berita');
		$this->smarty->assign('content_tpl', 'admin/news_form.tpl');	
		$this->smarty->display('app_template_admin.tpl');
	}

	function news_delete(){
		$this->db->trans_begin();

		$this->db->where('news_id',$this->input->get('news_id'));
		$this->db->delete('news');

		if ($this->db->trans_status() === FALSE)
		{
	        $this->db->trans_rollback();
			$arr_ret = array('success'=>false,'message'=>'Hapus berita gagal.');
		} else {
			$this->db->trans_commit();
			$arr_ret = array('success'=>true,'message'=>'Hapus berita berhasil.');
		}

		echo json_encode($arr_ret);
	}

	function news_save(){
		$config['upload_path'] = './upload/';
        $config['allowed_types'] = 'gif|jpg|png|jpeg|bmp';
        $config['max_size'] = '10000';
        $config['max_width'] = '1024';
        $config['max_height'] = '768';

        $this->load->library('upload', $config);

        $news_image = null;
        if (!$this->upload->do_upload('news_image')) {
            $error = $this->upload->display_errors();
            // echo $error;
            if ($error != '<p>You did not select a file to upload.</p>') {
                // echo "{success:false, message:'" . $error . "'}";
                // $error = str_replace(, replace, subject)
                // echo json_encode(array('success'=>false,'message'=>$error));
                $this->smarty->assign('title_msg','Gagal Menambahkan Berita');
				$this->smarty->assign('type','notice');
				$this->smarty->assign('content_msg',$error);
				$this->smarty->assign('content_tpl', 'message.tpl');	
				$this->smarty->display('app_template_admin.tpl');	
                exit;
            }
            //  else {

            // }
        } else {
            // $data = $this->upload->data());
            // print_r($this->upload->data());
            // echo "{success:true, message:'".print_r($this->upload->data())."'}";
            // $this->prosesSaveProfileV2($this->upload->data()['orig_name'], $input);
            // $this->load->view('upload_success', $data);

            $news_image = $this->upload->data()['orig_name'];
        }

		$d = array(
				'news_title'=>$this->input->post('news_title'),
				'news_content'=>$this->input->post('news_content'),
				'news_desc'=>$this->input->post('news_desc'),
				'news_keyword'=>$this->input->post('news_keyword'),				
				'datein'=>date('Y-m-d H:m:s'),
				'userin'=>$this->session->userdata('user_id'),
				'status'=>1
		);

		if($news_image!=null){
			$d['news_image'] = $news_image;
		}

		$news_id = $this->input->post('news_id');
		if($news_id!=''){
			$this->db->where('news_id',$news_id);
			$this->db->update('news',$d);
		} else {
			$this->db->insert('news',$d);
		}
		

		redirect(site_url('admin_panel/news'));
	}

	function user_save(){
		$this->db->trans_begin();

		$user_id = $this->input->post('user_id');

			$data = array(
				'firstname'=> $this->input->post('firstname'),
				'lastname'=> $this->input->post('lastname'),
				'username'=> $this->input->post('username'),
				'email'=> $this->input->post('email'),
				'password'=> $this->input->post('password'),
				'address'=> $this->input->post('address'),
				'city'=> $this->input->post('city'),
				'province'=> $this->input->post('province'),
				'zipcode'=> $this->input->post('zipcode'),
				'user_type_id'=>1
			);

		if($user_id!=''){
			$this->db->where('user_id',$user_id);
			$this->db->update('users',$data);
		} else {
			$this->db->insert('users',$data);
		}
		

		if ($this->db->trans_status() === FALSE)
		{
	        $this->db->trans_rollback();
			$arr_ret = array('success'=>false,'message'=>'Saving data failed. Please try again later.');
		} else {
			$this->db->trans_commit();
			$arr_ret = array('success'=>true,'message'=>'Data saved successfuly.');
		}

		echo json_encode($arr_ret);
	}

	function user_delete(){
		$this->db->trans_begin();

		$this->db->where('claim_id',$this->input->post('claim_id'));
		$this->db->update('claim',array('claim_status'=>$this->input->post('claim_status')));

		if ($this->db->trans_status() === FALSE)
		{
	        $this->db->trans_rollback();
			$arr_ret = array('success'=>false,'message'=>'Ubah status klaim gagal.');
		} else {
			$this->db->trans_commit();
			$arr_ret = array('success'=>true,'message'=>'Ubah status klaim berhasil.');
		}

		echo json_encode($arr_ret);
	}

	function claim_update_star(){
		$this->db->trans_begin();

		$claim_id = $this->input->post('claim_id');

		$ready_to_star = $this->input->post('ready_to_star')=='true' ? 1 : 0;

		$this->db->where('claim_id',$claim_id);
		$this->db->update('claim',array('ready_to_star'=>$ready_to_star));

		if ($this->db->trans_status() === FALSE)
		{
	        $this->db->trans_rollback();
			$arr_ret = array('success'=>false,'message'=>'Data saving failed');
		} else {
			$this->db->trans_commit();
			
			$arr_ret = array('success'=>true,'message'=>'Data saved');
		}

		echo json_encode($arr_ret);
	}

	function claim_update(){
		$this->db->trans_begin();

		$claim_id = $this->input->post('claim_id');

		$this->db->where('claim_id',$claim_id);
		$this->db->update('claim',array(
				'claim_status'=>$this->input->post('claim_status'),
				'notes_admin'=>$this->input->post('notes_admin')
			));

		

		if ($this->db->trans_status() === FALSE)
		{
	        $this->db->trans_rollback();
			$arr_ret = array('success'=>false,'message'=>'Ubah status klaim gagal.');
		} else {
			$this->db->trans_commit();

			$this->send_notif_claim($claim_id);
			
			$arr_ret = array('success'=>true,'message'=>'Ubah status klaim berhasil.');
		}

		echo json_encode($arr_ret);
	}

	function payment_save(){
		$this->db->trans_begin();

		$no_order = $this->input->post('no_order');
		$payment_id = $this->input->post('payment_id');

		$data = array(
			// 'payment_id' int(11) NOT NULL AUTO_INCREMENT,
			// 'order_id' int(11) DEFAULT NULL,
			'payment_channel_id' => $this->input->post('payment_channel_id'),
			'amount' => $this->input->post('amount'),
			'date_payment' => backdate3($this->input->post('date_payment')),
			'dest_bank' => $this->input->post('dest_bank'),
			'account_name' => $this->input->post('account_name'),
			'bank_name' => $this->input->post('bank_name'),
			'no_order' => $this->input->post('no_order'),
			'notes' => $this->input->post('notes'),
			// 'file_doc' => $this->input->post('payment_channel_id'),
			'status' => $this->input->post('status'),
			'datein' => date('Y-m-d H:m:s'),
			'userin' => $this->session->userdata('user_id'),
			'no_payment'=> 'P'.rand(11111,99999).date('Ymd')
		);
		// print_r($data); die;

		$q = $this->db->get_where('order',array('order_no'=>$no_order));
		if($q->num_rows()>0){
			$r = $q->row();

			if($r->status==2){
				//paid
				$arr_ret = array('success'=>false,'message'=>'No Order '.$no_order.' sudah lunas');
				echo json_encode($arr_ret);
				exit;
			}

			$order_id = $r->order_id;
			$data['order_id'] = $order_id;

			$config['upload_path'] = './upload';
	        $config['allowed_types'] = 'gif|jpg|png';
	        $config['max_size'] = '1024';
	        // $config['max_width']  = '1024';
	        // $config['max_height']  = '768';

	        $this->load->library('upload');

	        $this->upload->initialize($config);

	        if (!$this->upload->do_upload('file_doc'))
	        {
	            $error = $this->upload->display_errors();
	            if($error!='<p>You did not select a file to upload.</p>')
	            {
	                $json = array('success' => false, 'message' => 'Upload Foto: '.$error);
	                echo json_encode($json);
	                exit;
	            } else {

	            }
	        } else {
		            $data['file_doc'] = $this->upload->data()['orig_name'];
		        }

		        // print_r($data);
		    if($payment_id!=''){
		    	$this->db->where('payment_id',$payment_id);
		    	$this->db->update('payment',$data);
		    } else {
		    	$this->db->insert('payment',$data);
		    }
		    

		    if ($this->db->trans_status() === FALSE)
			{
		        $this->db->trans_rollback();
				$arr_ret = array('success'=>false,'message'=>'Konfirmasi pembayaran gagal.');
			} else {
				$this->db->trans_commit();

				if(intval($data['status'])==1){
					//payment confirmed
					$this->db->where('order_id',$order_id);
					$this->db->update('order',array('status'=>5));
				} else {
					//paid
					$this->db->where('order_id',$order_id);
					$this->db->update('order',array('status'=>$data['status']));

					$this->db->where('order_id',$order_id);
					$this->db->update('invoice',array('status'=>'COMPLETED'));
				}

				$arr_ret = array('success'=>true,'message'=>'Konfirmasi pembayaran berhasil.');
			}

			echo json_encode($arr_ret);

		} else {
			$arr_ret = array('success'=>false,'message'=>'No Order salah');
			echo json_encode($arr_ret);
			exit;
		}

		
	}

	function get_summary_invoice(){
		// $payment_status = $this->input->get('payment_status');

		$sql = "SELECT COALESCE(fee_amount_paid,NULL,0) as fee_amount_paid,COALESCE(fee_xendit_paid,NULL,0) as fee_xendit_paid,COALESCE(total_amount_paid,NULL,0) as total_amount_paid,
				fee_amount_unpaid,fee_xendit_unpaid,total_amount_unpaid,totalwithdraw
				FROM (select 
				sum(sni_fee_amount) as fee_amount_paid,
				sum(xendit_fee_amount) as fee_xendit_paid,
				sum(amount) as total_amount_paid
				from invoice
				where status = 'COMPLETED') a,
				(select 
				sum(sni_fee_amount) as fee_amount_unpaid,
				sum(xendit_fee_amount) as fee_xendit_unpaid,
				sum(amount) as total_amount_unpaid
				from invoice
				where status = 'PENDING') b,
				(select sum(amount_withdraw) as totalwithdraw
				from withdraw) c";

		// if()
		$q = $this->db->query($sql);
		$r = $q->row();

		$d['fee_amount_paid'] = $r->fee_amount_paid;
		$d['fee_xendit'] = $r->fee_xendit_paid;
		$d['total_amount'] = number_format($r->total_amount_paid);
		$d['total_amount_unpaid'] = number_format($r->total_amount_unpaid);
		// $d['totalwithdraw'] = number_format($r->totalwithdraw);

		//get balance from nusafin
		// $curl = curl_init();
		// curl_setopt_array($curl, array(
		// 	CURLOPT_URL => API_URL_NUSAFIN.'balance',
		// 	CURLOPT_RETURNTRANSFER => true,
		// 	CURLOPT_ENCODING => "",
		// 	CURLOPT_MAXREDIRS => 10,
		// 	CURLOPT_TIMEOUT => 30,
		// 	CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		// 	CURLOPT_CUSTOMREQUEST => "GET",
		// 	CURLOPT_POSTFIELDS => "",
		// 	CURLOPT_HTTPHEADER => array(
		// 		"Authorization: Basic TlNQX0FQSXhueFRHTldWQXM1RnJDSjlEVTZDZVNFQkdNakF4T0RFeU1UQXhOVEV5TWpjPTo=",
		// 		"Postman-Token: 1f46a8cb-ffdf-44f1-a3a2-8b4ba0354a5e",
		// 		"cache-control: no-cache"
		// 	),
		// ));

			$curl = curl_init();
			// curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type: application/xml', $additionalHeaders));
			curl_setopt($curl, CURLOPT_URL, API_URL_NUSAFIN.'balance');
			curl_setopt($curl, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
			// curl_setopt($curl, CURLOPT_HEADER, 1);
			curl_setopt($curl, CURLOPT_USERPWD, API_KEY_NUSAFIN.":");
			curl_setopt($curl, CURLOPT_TIMEOUT, 30);
			curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "GET");
			curl_setopt($curl, CURLOPT_POSTFIELDS, "");
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);

		$response = curl_exec($curl);
		$err = curl_error($curl);

		curl_close($curl);

		if ($err) {
			// echo "cURL Error #:" . $err;
			echo json_encode(array('success'=>false,'message'=>$err));
			return false;
		} else {
			$obj = json_decode($response);
			// print_r($obj);
			$d['avail_withdraw'] = number_format($obj->{'balance'});
		}
		// $d['avail_withdraw'] = number_format($r->total_amount_paid-($r->fee_amount_paid+$r->fee_xendit_paid)-($r->totalwithdraw));
		// echo $r->total_amount_paid.'-('.$r->fee_amount_paid.'-'.$r->fee_xendit_paid.')-('.$r->totalwithdraw.')';

		echo json_encode($d);
	}

	function withdraw_save(){
		$this->db->trans_begin();

		$amount_withdraw = $this->input->post('amount_withdraw');
		// $this->db->where('claim_id',$this->input->post('claim_id'));
		$data = array(
			// 'withdraw_id' int(11) NOT NULL AUTO_INCREMENT,
			'available_balance' => $this->input->post('available_balance'),
			'amount_withdraw' => $amount_withdraw,
			'balance' => ($this->input->post('available_balance')-$this->input->post('amount_withdraw')),
			'date_trx' => date('Y-m-d H:m:s'),
			'no_account' => $this->input->post('no_account'),
			'account_name' => $this->input->post('account_name'),
			'bank_name' => $this->input->post('bank_name'),
			'notes' => $this->input->post('notes'),
			'userin' => $this->session->userdata('user_id'),
			'status' => 1
			// 'date_settled' datetime DEFAULT NULL,
			);
		$this->db->insert('withdraw',$data);

		if ($this->db->trans_status() === FALSE)
		{
	        $this->db->trans_rollback();
			$arr_ret = array('success'=>false,'message'=>'Permintaan penarikan dana gagal disimpan.');
		} else {
			$this->db->trans_commit();

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
					$this->email->from('noreply@jasindotravel.co.id');
					$this->email->to('senusaid@gmail.com');
					$this->email->subject('Penarikan Tunai Jasindo Travel');

					$text = 'Telah dilakukan penarikan tunai sebesar : '.number_format($amount_withdraw);
					$this->email->message($text);
					$this->email->send();

			$arr_ret = array('success'=>true,'message'=>'Permintaan penarikan dana berhasil disimpan.');
		}

		echo json_encode($arr_ret);
	}

	function get_star(){
		$q = $this->db->get_where('order',array('order_id'=>$this->input->get('order_id')))->row();
		echo json_encode(array('success'=>true,'policy_no_star'=>$q->policy_no_star));
	}

	function save_star(){
		$this->db->where('order_id',$this->input->post('order_id'));
		$this->db->update('order',array(
				'policy_no_star'=>$this->input->post('policy_no_star'),
				'userin_policy_star'=>$this->session->userdata('user_id'),
				'datein_policy_star'=>date('Y-m-d H:m:s')
			));
		echo json_encode(array('success'=>true,'message'=>'Saved'));
	}

	function get_star_claim(){
		$q = $this->db->get_where('claim',array('claim_id'=>$this->input->get('claim_id')))->row();
		echo json_encode(array('success'=>true,'no_claim_star'=>$q->no_claim_star));
	}

	function save_star_claim(){
		$this->db->where('claim_id',$this->input->post('claim_id'));
		$this->db->update('claim',array(
				'no_claim_star'=>$this->input->post('no_claim_star'),
				'userin_claim_star'=>$this->session->userdata('user_id'),
				'datein_claim_star'=>date('Y-m-d H:m:s')
			));
		echo json_encode(array('success'=>true,'message'=>'Saved'));
	}

	function ekspor_participant($stardate,$enddate){
		// $stardate = backdate2($stardate);
		// $enddate = backdate2($enddate);

		$this->load->model('m_participant');

		$sql = $this->m_participant->query().' '.$this->m_participant->whereQuery($stardate,$enddate).' order by '.$this->m_participant->orderBy();
		$q  = $this->db->query($sql);

		$data = array(
            'data'=>$this->db->query($sql)
        );
        $data['fontsize'] = 12;
        $data['startdate'] = $stardate;
        $data['enddate'] = $enddate;
        // print_r($data['data']->result_array()[0]);

        // $this->load->view('tplcetak/data_participant',$data); 

        $html = $this->load->view('tplcetak/data_participant', $data,true);


        $filename = "data_participant.xls";
        header("Content-Type:   application/vnd.ms-excel; charset=utf-8");
        header("Content-type:   application/x-msexcel; charset=utf-8");
        header("Content-Disposition: attachment;filename=".$filename); //tell browser what's the file name
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header("Cache-Control: max-age=0");
        echo $html;

		// print_r($q->result_array()[0]);
	}

	function ekspor_order($pay_status,$stardate,$enddate){
		$stardate = backdate2($stardate);
		$enddate = backdate2($enddate);
		// echo $enddate;

		$this->load->model('m_order');

		$sql = "select " . $this->m_order->selectField() . "
                    from " . $this->m_order->tableName()." a 
                    left join v_invoice b ON a.order_id = b.order_id
                    where true ";

        $wer = null;
    	if($pay_status=='1'){
    		$wer.=" and a.status_id IN (1,4,5)";
    	} else if($pay_status=='2'){
    		$wer.=" and a.status_id IN (2,3,6)";
    	}

        if($stardate!='' && $enddate!=''){
            $sd = $stardate.' 00:00:00';
            $nd = $enddate.' 23:59:59';
            if($sd != null && $nd != null)
                $wer .= " AND a.datein BETWEEN '$sd' AND '$nd'";
        }
        
        $sql .=" AND a.deleted = 0 $wer";
        // echo $sql; die;

		$data = array(
            'data'=>$this->db->query($sql)
        );
        $data['fontsize'] = 12;
        $data['startdate'] = $stardate;
        $data['enddate'] = $enddate;
        // print_r($data['data']->result_array());

        // $this->load->view('tplcetak/data_order',$data); 

        $html = $this->load->view('tplcetak/data_order', $data,true);


        $filename = "data_order.xls";
        header("Content-Type:   application/vnd.ms-excel; charset=utf-8");
        header("Content-type:   application/x-msexcel; charset=utf-8");
        header("Content-Disposition: attachment;filename=".$filename); //tell browser what's the file name
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header("Cache-Control: max-age=0");
        echo $html;
	}

	function ekspor_klaim(){

	}

	function delete_insured(){
		$this->db->trans_begin();

		$insured_id = $this->input->post('insured_id');

		$q = $this->db->query("select *
				from ".DB_NAME.".order
				where insured_id = ".$insured_id." ");
		foreach ($q->result() as $r) {
			
			$qclaim = $this->db->get_where('claim',array('order_id'=>$r->order_id));
			foreach ($qclaim->result() as $rc) {
				$this->db->where('claim_id',$rc->claim_id);
				$this->db->delete('claim_item');
			}
			$this->db->where('order_id',$r->order_id);
			$this->db->delete('claim');

			$this->db->where('order_id',$r->order_id);
			$this->db->delete('order_ext');

			$this->db->where('external_id',$r->order_id);
			$this->db->delete('payment_log_xd');

			$qclaim = $this->db->get_where('invoice',array('order_id'=>$r->order_id));
			foreach ($qclaim->result() as $rc) {
				$this->db->where('invoice_id',$rc->invoice_id);
				$this->db->delete('invoice_bank');
			}
			$this->db->where('order_id',$r->order_id);
			$this->db->delete('invoice');

			$this->db->where('order_id',$r->order_id);
			$this->db->delete('insured_member');

			$this->db->where('order_id',$r->order_id);
			$this->db->delete('order');
		}


		$q = $this->db->get_where('insured',array('insured_id'=>$insured_id))->row();	

		$this->db->where('insured_id',$insured_id);
		$this->db->delete('insured');

		$this->db->where('user_id',$q->user_id);
		$this->db->delete('users');

		

		if ($this->db->trans_status() === FALSE)
		{
	        $this->db->trans_rollback();
			$arr_ret = array('success'=>false,'message'=>'Menghapus data gagal.');
		} else {
			$this->db->trans_commit();
			$arr_ret = array('success'=>true,'message'=>'Menghapus data berhasil.');
		}

		echo json_encode($arr_ret);
	}

	function delete_order(){
		$this->db->trans_begin();

		$order_id = $this->input->post('order_id');

		// $q = $this->db->query("select *
		// 		from ".DB_NAME.".order
		// 		where insured_id = ".$insured_id." ");
		// foreach ($q->result() as $r) {
			
			$qclaim = $this->db->get_where('claim',array('order_id'=>$order_id));
			foreach ($qclaim->result() as $rc) {
				$this->db->where('claim_id',$rc->claim_id);
				$this->db->delete('claim_item');
			}
			$this->db->where('order_id',$order_id);
			$this->db->delete('claim');

			$this->db->where('order_id',$order_id);
			$this->db->delete('order_ext');

			$this->db->where('external_id',$order_id);
			$this->db->delete('payment_log_xd');

			$qclaim = $this->db->get_where('invoice',array('order_id'=>$order_id));
			foreach ($qclaim->result() as $rc) {
				$this->db->where('invoice_id',$rc->invoice_id);
				$this->db->delete('invoice_bank');
			}
			$this->db->where('order_id',$order_id);
			$this->db->delete('invoice');

			$this->db->where('order_id',$order_id);
			$this->db->delete('insured_member');

			$this->db->where('order_id',$order_id);
			$this->db->delete('order');
		// }
// 

		if ($this->db->trans_status() === FALSE)
		{
	        $this->db->trans_rollback();
			$arr_ret = array('success'=>false,'message'=>'Menghapus data gagal.');
		} else {
			$this->db->trans_commit();
			$arr_ret = array('success'=>true,'message'=>'Menghapus data berhasil.');
		}

		echo json_encode($arr_ret);
	}

	function delete_claim(){
		$this->db->trans_begin();

		$claim_id = $this->input->post('claim_id');
			
		$this->db->where('claim_id',$claim_id);
		$this->db->delete('claim_item');

		$this->db->where('claim_id',$claim_id);
		$this->db->delete('claim');
// 

		if ($this->db->trans_status() === FALSE)
		{
	        $this->db->trans_rollback();
			$arr_ret = array('success'=>false,'message'=>'Menghapus data gagal.');
		} else {
			$this->db->trans_commit();
			$arr_ret = array('success'=>true,'message'=>'Menghapus data berhasil.');
		}

		echo json_encode($arr_ret);
	}

	function import_order(){
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'admin/import_list.tpl');	
		$this->smarty->display('app_template_admin.tpl');	
	}

	function delete_import(){
		$this->db->trans_begin();

		$import_id = $this->input->post('import_id');
			
		$this->db->where('import_id',$import_id);
		$this->db->delete('insured_member');

		$qclaim = $this->db->get_where('order',array('import_id'=>$import_id));
		foreach ($qclaim->result() as $rc) {
			$this->db->where('order_id',$rc->order_id);
			$this->db->delete('order_ext');
		}
		$this->db->where('import_id',$import_id);
		$this->db->delete('order');

		$this->db->where('import_id',$import_id);
		$this->db->delete('insured');

		if ($this->db->trans_status() === FALSE)
		{
	        $this->db->trans_rollback();
			$arr_ret = array('success'=>false,'message'=>'Menghapus data gagal.');
		} else {
			$this->db->trans_commit();
			$arr_ret = array('success'=>true,'message'=>'Menghapus data berhasil.');
		}

		echo json_encode($arr_ret);
	}

	function export_customer(){
		
				$q = $this->db->query("select
									g.payment_id,g.external_id,g.datein,a.invoice_id,a.order_id,a.amount,a.order_no,a.total_amount,b.description,c.order_date,d.firstname,d.lastname,d.address,d.phone_number,e.email
								from
									v_invoice a
								join invoice b ON a.invoice_id = b.invoice_id
								join ".DB_NAME.".order c ON b.order_id = c.order_id
								join insured d ON c.insured_id = d.insured_id
								join users e ON d.user_id = e.user_id
								join ".DB_NAME.".order f ON b.order_id = f.order_id
								left join payment_log_xd g ON g.external_id = f.order_id
								WHERE
									TRUE
								and a. status = 'COMPLETED'
								ORDER BY
									invoice_id desc");
		foreach ($q->result() as $v) {
				// $curl = curl_init();

				$external_id = $v->order_id;
				echo $external_id.' ';
				$amount = $v->amount;
				$invoice_date = $v->order_date;
				$fullname = ucwords($v->firstname).' '.ucwords($v->lastname);
				$memo = $v->description.' - '.$fullname;
				
				$email = $v->email;
				// $email = 'guegila@gmail.com';

				// curl_setopt_array($curl, array(
				//   CURLOPT_URL => "http://apidev.nusafin.com/customer/create_invoice2",
				//   CURLOPT_RETURNTRANSFER => true,
				//   CURLOPT_ENCODING => "",
				//   CURLOPT_MAXREDIRS => 10,
				//   CURLOPT_TIMEOUT => 30,
				//   CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
				//   CURLOPT_CUSTOMREQUEST => "POST",
				//   CURLOPT_POSTFIELDS => "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; 
				// name=\"external_id\"\r\n\r\n".$external_id."\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: 
				// form-data; name=\"amount\"\r\n\r\n".$amount."\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: 
				// form-data; name=\"invoice_date\"\r\n\r\n".$invoice_date."\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: 
				// form-data; name=\"due_date\"\r\n\r\n".$invoice_date."\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: 
				// form-data; name=\"memo\"\r\n\r\n".$memo."\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: 
				// form-data; name=\"email\"\r\n\r\n".$email."\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: 
				// form-data; name=\"fullname\"\r\n\r\n".$fullname."\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: 
				// form-data; name=\"send_mail\"\r\n\r\n2\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--",
				//   CURLOPT_HTTPHEADER => array(
				//     "Authorization: Basic TlNQX0FQSXhueFRHTldWQXM1RnJDSjlEVTZDZVNFQkdNakF4T0RFeU1UQXhOVEV5TWpjPTo=",
				//     "Postman-Token: 77f8935f-d438-405e-9baa-0c46c5d6199a",
				//     "cache-control: no-cache",
				//     "content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW"
				//   ),
				// ));

				// $response = curl_exec($curl);
				// $err = curl_error($curl);

				//curl_close($curl);

				$payload = array(
					'external_id'=>$external_id,
					'amount'=>$amount,
					'invoice_date'=>$invoice_date,
					'due_date'=>$invoice_date,
					'memo'=>$memo,
					'email'=>$email,
					'fullname'=>$fullname,
					'send_mail'=>2
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
				$response = curl_exec($curl);
				$err = curl_error($curl);

				curl_close($curl);

				if ($err) {
				  echo "cURL Error #:" . $err;
				} else {
				  echo $response;
				}
		}

		/*
			1. create customer
			2. buat invoice
			3. insert payment log
			4. u
		*/
	}

	function export_pay_invoice(){
		
		$user_id = 126;
		
		$q = $this->db->query("select
									g.payment_id,g.external_id,g.datein,a.invoice_id,a.order_id,a.amount,a.order_no,a.total_amount,b.description,c.order_date,d.firstname,d.lastname,d.address,d.phone_number,e.email
								from
									v_invoice a
								join invoice b ON a.invoice_id = b.invoice_id
								join ".DB_NAME.".order c ON b.order_id = c.order_id
								join insured d ON c.insured_id = d.insured_id
								join users e ON d.user_id = e.user_id
								join ".DB_NAME.".order f ON b.order_id = f.order_id
								left join payment_log_xd g ON g.external_id = f.order_id
								WHERE
									TRUE
								and a. status = 'COMPLETED'
								ORDER BY
									invoice_id desc");
		$i=2;
		foreach ($q->result() as $v) {
				$curl = curl_init();

				$external_id = $v->order_id;
				echo $external_id.' '.$v->amount.'<br>';
				$amount = $v->amount;
				$invoice_date = $v->order_date;
				$fullname = ucwords($v->firstname).' '.ucwords($v->lastname);
				$memo = $v->description.' - '.$fullname;
				
				$email = $v->email;
				// $email = 'guegila@gmail.com';

				$curl = curl_init();

				curl_setopt_array($curl, array(
				  CURLOPT_URL =>  "https://app.nusafin.com/invoice/completed_cb_jasindo",
				  CURLOPT_RETURNTRANSFER => true,
				  CURLOPT_ENCODING => "",
				  CURLOPT_MAXREDIRS => 10,
				  CURLOPT_TIMEOUT => 30,
				  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
				  CURLOPT_CUSTOMREQUEST => "POST",
				  CURLOPT_POSTFIELDS => "{\n  \"id\": \"5bf2359ea3aa093e212e06faJSO0".$i."\",\n  \"external_id\": \"".$external_id."\",\n  \"user_id\": \"".$user_id."\",\n  \"is_high\": false,\n  \"payment_method\": \"POOL\",\n  \"status\": \"PAID\",\n  \"merchant_name\": \"NUSAFIN\",\n  \"amount\": ".$amount.",\n  \"paid_amount\": ".$amount.",\n  \"bank_code\": \"MANDIRI\",\n  \"payer_email\": \"".$email."\",\n  \"description\": \"".$memo."\",\n  \"created\": \"2018-03-19T04:01:34.017Z\",\n  \"updated\": \"2018-03-19T04:02:29.349Z\",\n  \"order_date\":\"".$invoice_date."\"\n}",
				  CURLOPT_HTTPHEADER => array(
				    "Content-Type: application/json",
				    "Postman-Token: 9a14d273-9860-41d3-ae38-fe0add7d55b7",
				    "cache-control: no-cache"
				  ),
				));

				$response = curl_exec($curl);
				$err = curl_error($curl);

				curl_close($curl);

				if ($err) {
				  echo "cURL Error #:" . $err;
				} else {
				  echo $response;
				}
				$i++;
		}
	}

	function send_email(){
		
		$q = $this->db->query("select
									g.payment_id,g.external_id,g.datein,a.invoice_id,a.order_id,a.amount,a.order_no,a.total_amount,b.description,c.order_date,d.firstname,d.lastname,d.address,d.phone_number,e.email
								from
									v_invoice a
								join invoice b ON a.invoice_id = b.invoice_id
								join jasindotravel4.order c ON b.order_id = c.order_id
								join insured d ON c.insured_id = d.insured_id
								join users e ON d.user_id = e.user_id
								join jasindotravel4.order f ON b.order_id = f.order_id
								left join payment_log_xd g ON g.external_id = f.order_id
								WHERE
									TRUE
								and a. status = 'COMPLETED'
								ORDER BY
									invoice_id desc");
		foreach ($q->result() as $v) {
				
				$email = $v->email;

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
				$this->email->subject('Pemberitahuan Kesalahan Teknis - Jasindo Travel');

				// $this->load->model('m_order');
				// $data['d'] = $this->m_order->order_detail($order_id);
				// $data['mode'] = 'email_confirm';
				$data['address'] = $this->settings['company_address'];

				$data['message'] = 'Melalui email ini Kami menginformasikan kepada Anda untuk mengabaikan email yang berisi pemesanan Asuransi Travel pada Email sebelumnya. Karena terjadi kesalahan teknis dalam proses peningkatan layanan dari Jasindo Travel.';
				// $this->load->view('email_announcement',$data);

				$text = $this->load->view('email_announcement',$data,TRUE);
				$this->email->message($text);
				$this->email->send();

				echo $email.' ';
		}

		
	}
}