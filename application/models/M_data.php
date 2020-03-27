<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_data extends CI_Model {

	function get_insured_data($user_id){
		$sql = "select g.insured_id,g.user_id,g.country_id,g.birthdate,g.firstname,g.lastname,g.address,g.phone_number,g.city,g.province,g.dateregistered,h.email,i.country_name,g.zipcode,
				case 
					when gender = 1 then 'Pria'
					when gender = 2 then 'Wanita'
				end as gender_name
				from insured g
				join users h ON g.user_id = h.user_id
				left join country i ON g.country_id = i.country_id
				where h.user_id = $user_id";
		$q = $this->db->query($sql);
		return $q->result_array()[0];
	}

	function get_country(){
		$q = $this->db->query("select country_id,country_name from country order by country_name");
		$r = $q->result_array();
		$i=0;
		$options = array();
		foreach ($r as $key => $value) {
			// $options['country_id'] = $value['country_id'];
			$options[$value['country_id']] = $value['country_name'];
			// array_push($options['country_id'], $value['country_name']);
			$i++;
		}

		return $options;
	}

	function claim_data_list($user_id){
		$sql = "select a.claim_id,a.no_claim,a.diajukan_oleh,a.datein,claim_status,a.claim_type,c.user_id,
				case
				when claim_status = 1 then 'Open'
				when claim_status = 2 then 'Settled'
				when claim_status = 3 then 'Accepted'
				when claim_status = 4 then 'Rejected'
				end as claim_status_name,
				case
				when claim_type = 1 then 'Medis'
				when claim_type = 2 then 'Kecelakaan Diri'
				when claim_type = 3 then 'Ketidaknyamanan Perjalanan'
				when claim_type = 4 then 'Lainnya'
				end as claim_type_name
				from claim a
				join ".DB_NAME.".order b ON a.order_id = b.order_id
				join insured c ON b.insured_id = c.insured_id
				where c.user_id = $user_id
				order by claim_id desc";
		$q = $this->db->query($sql);
		return $q->result_array();
	}

	function claim_data_detail($claim_id){
		$sql = "select a.*,c.user_id,
					b.policy_no,
					b.insured_id,
					case
					when claim_status = 1 then 'Open'
					when claim_status = 2 then 'Settled'
					when claim_status = 3 then 'Accepted'
					when claim_status = 4 then 'Rejected'
					end as claim_status_name,
					case
					when claim_type = 1 then 'Medis'
					when claim_type = 2 then 'Kecelakaan Diri'
					when claim_type = 3 then 'Accepted'
					when claim_type = 4 then 'Rejected'
					end as claim_type_name,
					DATE_FORMAT(medis_tgl_kej, '%d-%m-%Y') as medis_tgl_kej_val,
					DATE_FORMAT(kecel_tgl_kejadian, '%d-%m-%Y') as kecel_tgl_kejadian_val,
					DATE_FORMAT(nyaman_bagdelay_tgl_awal, '%d-%m-%Y') as nyaman_bagdelay_tgl_awal_val,
					DATE_FORMAT(nyaman_bagdelay_tgl_akhir, '%d-%m-%Y') as nyaman_bagdelay_tgl_akhir_val,
					DATE_FORMAT(nyaman_cancel_bookdate, '%d-%m-%Y') as nyaman_cancel_bookdate_val,
					DATE_FORMAT(nyaman_cancel_accdate, '%d-%m-%Y') as nyaman_cancel_accdate_val,
					DATE_FORMAT(nyaman_cancel_intent_depart_date, '%d-%m-%Y') as nyaman_cancel_intent_depart_date_val,
					DATE_FORMAT(nyaman_cancel_intent_back_date, '%d-%m-%Y') as nyaman_cancel_intent_back_date_val,
					DATE_FORMAT(nyaman_baglost_date_accident, '%d-%m-%Y') as nyaman_baglost_date_accident_val,
					DATE_FORMAT(nyaman_baglost_date_report, '%d-%m-%Y') as nyaman_baglost_date_report_val,
					DATE_FORMAT(lain_date_accident, '%d-%m-%Y') as lain_date_accident_val
					from claim a
					join ".DB_NAME.".order b ON a.order_id = b.order_id
					join insured c ON b.insured_id = c.insured_id
				where a.claim_id = $claim_id";
		$q = $this->db->query($sql);
		return $q->result_array()[0];
	}

	function claim_data_detail_item($claim_id){
		$q = $this->db->get_where('claim_item',array('claim_id'=>$claim_id));
		return $q->result_array();
	}

}

