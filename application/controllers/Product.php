<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends MY_Controller {

	public function index()
	{
		$this->smarty->assign('content_tpl', 'home_content.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function get_package_price(){
		$depart_id = $this->input->get('depart_id');
		$destination_id = $this->input->get('destination_id');
		$num_person = $this->input->get('num_person');
		$category = $this->input->get('category');
		// $type = $this->input->get('type');
		$startdate = backdate2($this->input->get('startdate'));
		$enddate = backdate2($this->input->get('enddate'));
		$selected = $this->input->get('selected');
		$payment_type = $this->input->get('payment_type');

		//lamanya perjalanan maksimal 31 hari
		if(count_days($startdate,$enddate)>31){
			$arr = json_encode(array('success'=>false,'message'=>'Batas maksimal waktu perjalanan adalah 31 Hari.'));
			echo $arr; die;
		}
		
		if($depart_id==''){
			$arr = json_encode(array('success'=>false,'message'=>'Tentukan asal keberangkatan'));
			echo $arr; die;
		} 

		$qdepart = $this->db->get_where('departure',array('depart_name'=>$this->input->get('depart_id')));
		if($qdepart->num_rows()<=0){
			$arr = json_encode(array('success'=>false,'message'=>'Asal keberangkatan tidak benar.'));
			echo $arr; die;
		}

		$days = count_days($startdate,$enddate);
		$days = $days==0 ? 1 : $days;
		// echo $days; die;

		if($num_person==1){
			$type='Single';
		} else if($num_person==2){
			$type='Duo';
		} else {
			$type='Family';
		}
		//hitung umur untuk ekstra premi
		$ext_premi = false;
		if($this->session->userdata('logged')==1 && $this->session->userdata('user_type_id')!=1 && $this->session->userdata('insured_id')!=''){
			$qage = $this->db->query("select birthdate from insured where insured_id = ".$this->session->userdata('insured_id')." ")->row();
			$age = count_year($qage->birthdate,$startdate);
			if($age>=intval($this->settings['min_age_extra_premi']) && intval($age<=$this->settings['max_age_extra_premi'])){
				$ext_premi = true;
			}			
		} else {
			$age = 0;
			//posisi daftar baru
			// echo $this->input->get('datebirth_reg'); die;
			if($this->input->get('landing_page')!='true'){
				if($this->input->get('datebirth_reg')==''){
					$arr = json_encode(array('success'=>false,'message'=>'Tentukan tanggal lahir pemegang polis'));
					echo $arr; die;
				} else {
					$age = count_year(backdate2($this->input->get('datebirth_reg')),$startdate);
					
		
					if($age>=intval($this->settings['min_age_extra_premi']) && intval($age<=$this->settings['max_age_extra_premi'])){
						$ext_premi = true;
						// echo $this->input->get('datebirth_reg'); die;
					} else if($age>intval($this->settings['max_age_extra_premi'])){
						$arr = json_encode(array('success'=>false,'message'=>'Batas maksimal umur pemegang polis adalah '.$this->settings['max_age_extra_premi']));
						echo $arr; die;
					}
				}
			}
			

			
		}

		

		$qregion = $this->db->query("select region_id from destination where dest_name = '".str_replace('%20', ' ', $destination_id)."' ");
		if($qregion->num_rows()>0){
			
			

			$data = array();
			if($selected==1){
				$cat = array('gold');
			} else if($selected==2){
				$cat = array('platinum');
			} else if($selected==3){
				$cat = array('diamond');
			} else {
				$cat = array('gold','platinum','diamond');
			}
			
			foreach ($cat as $key => $value) {

				$region = $qregion->row();
				$region_id = $region->region_id;

				if($region_id!=4){
					$wer_cat = "and category = '".ucwords($value)."'";
				} else {
					$wer_cat = null;
				}

				$sql = "select a.premium_id,a.period_start,a.period_end,a.region_id,a.category,a.type,price,b.currency_name,
					b.rate,c.region_name,c.region_name_detail,(price*rate) as harga
					from premium a
					join ms_currency b ON a.currency_id = b.currency_id
					join region c ON a.region_id = c.region_id
					where ($days between period_start and period_end)
					$wer_cat and a.region_id = $region_id and  type = '".$type."'";
				// $sql = "select a.premium_id,a.period_start,a.period_end,a.region_id,a.category,a.type,price,b.currency_name,
				// 	b.rate,c.region_name,c.region_name_detail,((price*rate)*$num_person) as harga
				// 	from premium a
				// 	join ms_currency b ON a.currency_id = b.currency_id
				// 	join region c ON a.region_id = c.region_id
				// 	where ($days between period_start and period_end)
				// 	$wer_cat and a.region_id = $region_id and  type = '".$type."'";
					// echo $sql;
				$q = $this->db->query($sql);
				if($q->num_rows()>0){
					$d = $q->result_array();
					if($region_id!=4){
						$data[$value] = number_format($d[0]['harga'],0);
					} else {
						//domestik
						$data['success'] = true;
						$data['domestic_price'] = number_format($d[0]['price'],0);
					}
					
					$premium_id = $d[0]['premium_id'];
				} else {
					$arr = json_encode(array('success'=>false,'Data tidak ditemukan '));
					echo $arr; die;
				}				
			}

			if($region_id!=4){
				//ambil data premi internasional
				$cat = array('gold','platinum','diamond');
				foreach ($cat as $key => $value) {

					$region = $qregion->row();
					$region_id = $region->region_id;

					if($region_id!=4){
						$wer_cat = "and category = '".ucwords($value)."'";
					} else {
						$wer_cat = null;
					}


					$sql = "select a.premium_id,a.period_start,a.period_end,a.region_id,a.category,a.type,price,b.currency_name,
						b.rate,c.region_name,c.region_name_detail,(price*rate) as harga
						from premium a
						join ms_currency b ON a.currency_id = b.currency_id
						join region c ON a.region_id = c.region_id
						where ($days between period_start and period_end)
						$wer_cat and a.region_id = $region_id and  type = '".$type."'";
						// echo $sql;
					$q = $this->db->query($sql);
					if($q->num_rows()>0){
						$d = $q->result_array();
						$data[$value] = number_format($d[0]['harga'],0);
					} else {
						$arr = json_encode(array('success'=>false,'Data tidak ditemukan '));
						echo $arr; die;
					}				
				}
			}
			
			$data['participant_age'] = $age;
			$data['min_age_extra_premi'] = $this->settings['min_age_extra_premi'];
			$data['max_age_extra_premi'] = $this->settings['max_age_extra_premi'];
			$data['region_id'] = $region_id;
			$data['region_name_detail'] = $d[0]['region_name_detail'];
			$data['premium_id'] = $premium_id;
			$data['days'] = $days;
			$data['type'] = $type;

			//perluasan
			$total_perluasan = 0;
			if(isset($_GET['extension'])){
				$exten = $_GET['extension'];				
				foreach ($exten as $key => $value) {
					$total_perluasan+= $this->get_premi_perluasan($value);				
				}				
			} 
			

			$qset = $this->db->query("select * from settings")->row();

			if($region_id==4){
				//domestic
				$policy_fee = $qset->policy_fee_domestic;
			} else {
				//international
				$policy_fee = $qset->policy_fee_international;
			}

			// $data['materai_fee'] = number_format($qset->materai_fee);
			// $data['policy_fee'] = number_format($qset->policy_fee);
			$data['other_fee'] =  number_format($qset->materai_fee+$policy_fee);
			
			if($selected!=''){

				if($region_id==4){
					//domestik
					$total_premi = str_replace(',', '', $data['domestic_price']);
				} else {
					if($selected==1){
						//golde
					 	$total_premi = str_replace(',', '', $data['gold']);
						 // $data['total_premi'] = number_format($total_premi
					} else if($selected==2){
						//platinum
						$total_premi = str_replace(',', '', $data['platinum']);
					} else if($selected==3){
						//diamon
						$total_premi = str_replace(',', '', $data['diamond']);
					} else {
						$selected = 1;
						$total_premi = str_replace(',', '', $data['gold']);
					}
					// else if($selected==4){
					// 	//domestik
					// 	$total_premi = str_replace(',', '', $data['domestic_price']);
					// }
				}
				

				$total_extra_premi = 0;
				if($ext_premi){
					$total_extra_premi = $total_premi*($qset->percent_extra_premi/100);
				}



				$data['total_perluasan'] = number_format($total_perluasan);
				$data['total_premi'] = number_format($total_premi);
				$data['total_extra_premi'] = number_format($total_extra_premi);

				$subtotal = $total_premi+$qset->materai_fee+$policy_fee+$total_perluasan+$total_extra_premi;
				// echo $payment_type;
				// if($payment_type=='2'){
				// 	//CC - get from nusafin
				// 	$curl = curl_init();

				// 	// curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type: application/xml', $additionalHeaders));
				// 	curl_setopt($curl, CURLOPT_URL, API_URL_NUSAFIN.'payment/method_list?amount='.$subtotal);
				// 	curl_setopt($curl, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
				// 	// curl_setopt($curl, CURLOPT_HEADER, 1);
				// 	curl_setopt($curl, CURLOPT_USERPWD, API_KEY_NUSAFIN.":");
				// 	curl_setopt($curl, CURLOPT_TIMEOUT, 30);
				// 	curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'GET');
				// 	curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);

				// 	$response = json_decode(curl_exec($curl));
				// 	$err = curl_error($curl);
				// 	curl_close($curl);

				// 	if ($err) {
				// 		$resp = array('success'=>false,'message'=>$err);
				// 		echo json_encode($resp);
				// 		return false;
				// 	// echo "cURL Error #:" . $err;
				// 	} else {
				// 		// print_r($response[1]); die;
				// 		 $mdr = NULL;
				// 		 $payment_fee = $response[1]->{'fees'};
				// 		 $payment_desc = $response[1]->{'method_desc'};
				// 	}

				// 	// $mdr = ($qset->credit_card_fee_mdr_cust/100) * $subtotal;
				// 	// $payment_fee = $mdr + $qset->credit_card_fee_trx_cust + $qset->credit_card_fee_trx_sni;
				// 	// $payment_desc = $qset->credit_card_fee_mdr_cust.'% + '.number_format($qset->credit_card_fee_trx_cust+$qset->credit_card_fee_trx_sni);
				// } else {
				// 	//VA
				// 	$payment_fee = $qset->virtual_account_fee_cust + $qset->virtual_account_fee_sni;
				// 	$payment_desc = '';
				// }

				// $total_amount = $subtotal+$payment_fee;

				//disabled payment fee
				$payment_desc = null;
				$payment_fee = 0;
				$total_amount = $subtotal;

				$data['payment_fee'] = number_format($payment_fee);
				$data['payment_desc'] = $payment_desc;
				$data['total_amount'] = number_format($total_amount);
				$data['success'] = true;
				$data['selected'] = $selected;
				$data['startdate'] = $this->input->get('startdate');
				$data['enddate'] = $this->input->get('enddate');
			}
			
			$data['success'] = true;
			$arr = json_encode($data);
			echo $arr; 
		} else {
			$arr = json_encode(array('success'=>false,'Region tidak ditemukan'));
			echo $arr; 
		}
		
	}

	function get_premi_perluasan($value){
		$q = $this->db->query("select premium
								from extention
								where extention_id = ".$value." ")->row();
		return $q->premium;
	}

	function query_premi_ext(){

	}

	function check_voucher(){

		$voucher_code   = $this->input->get('voucher_code');
		$destination    = $this->input->get('destination_name');
		
		$periodik       = "and a.startdate <= DATE_FORMAT(now(),'%Y-%m-%d')  and a.enddate >= DATE_FORMAT(now(),'%Y-%m-%d')";

		$sql            = "SELECT a.voucher_code,b.region_id,c.region_name,a.disc_type,a.disc_amount,a.disc_percentage FROM voucher a JOIN voucher_region b on b.voucher_id=a.voucher_id JOIN region c on c.region_id=b.region_id where a.status =1 and a.voucher_code='".$voucher_code."' and a.deleted =0 $periodik group by c.region_id";		

		$query          =$this->db->query($sql);
		
		
		if($query->num_rows() >0){

				$q = $this->db->query("SELECT
										a.voucher_code,b.region_id,c.region_name,a.disc_type,a.disc_amount,a.disc_percentage 
								   FROM 
								   		voucher a JOIN voucher_region b on b.voucher_id=a.voucher_id 
								   JOIN 
								   		region c on c.region_id=b.region_id 
								   JOIN 
								   		destination d on d.region_id=c.region_id
								   where 
								   		a.status =1 and a.voucher_code='".$voucher_code."' and a.deleted =0 $periodik 
								   		and destination_id in (select destination_id from destination where dest_name='".$destination."') 
								   	group by c.region_id");
				
				if($q->num_rows()>0){

					$data=$q->row();
					
					if($data->disc_type==1){
						$diskon ='Rp '.number_format($data->disc_amount);
					}else if($data->disc_type==2){
						$diskon =$data->disc_percentage.'%';
					}
					// echo $this->db->last_query();
					echo json_encode(array('status'=>true,'message'=>'Selamat Kode Voucher Valid. Anda mendapatkan diskon sebesar <b>'.$diskon.'</b>','data'=>$data));
					die;
				}else{
					echo json_encode(array('status'=>false,'message'=>'Kode Voucher tidak berlalu di destinasi yang anda pilih'));
					die;
				}

		}else{
				echo json_encode(array('status'=>false,'message'=>'Maaf Kode Voucher tidak Valid, silahkan masukan kode yang valid'));die;
		}
				
	}
}
