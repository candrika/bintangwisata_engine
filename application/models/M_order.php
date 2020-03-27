<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_order extends CI_Model {

	function tableName() {
        return 'v_order';
    }

    function pkField() {
        return 'order_id';
    }

    function searchField() {
        $field = "a.depart_name,a.dest_name,a.region_name,a.firstname,a.lastname,a.order_no,a.no_reference,a.email,a.policy_no,a.policy_no_star";
        return explode(",", $field);
    }

    function selectField() {
        return "a.order_id,a.import_id,a.days,b.payment_fee,destination_id,invoice_id,departure_id,premium_id,insured_id,startdate,enddate,a.order_date,a.payment_date,a.payment_channel_id,a.payment_amount,a.datein,a.depart_name,a.dest_name,region_id,category,type,currency_name,region_name,region_name_detail,a.user_id,country_id,birthdate,firstname,lastname,address,phone_number,city,province,dateregistered,a.order_no,email,country_name,zipcode,gender,a.status,a.total_amount,a.total_perluasan,a.total_premi,a.other_fee,no_reference,policy_no,a.policy_no_star,subtotal_premi";
    }
    
    function fieldCek()
    {
        //field yang perlu dicek didatabase apakah sudah ada apa belum
        $f = array(
          'noinduk'=>'Nomor Induk'  
        );
        return $f;
    }

    function query() {
        $query = "select " . $this->selectField() . "
                    from " . $this->tableName()." a 
                    left join v_invoice b ON a.order_id = b.order_id";

        return $query;
    }

    function whereQuery() {
    	$wer = null;
    	if($this->input->post('payment_status')=='1'){
    		$wer.=" and a.status_id IN (1,4,5)";
    	} else if($this->input->post('payment_status')=='2'){
    		$wer.=" and a.status_id IN (2,3,6)";
    	}

        if($this->input->post('startdate')!='' && $this->input->post('enddate')!=''){
            $sd = backdate2($this->input->post('startdate')).' 00:00:00';
            $nd = backdate2($this->input->post('enddate')).' 23:59:59';
            if($sd != null && $nd != null)
                $wer .= " AND a.datein BETWEEN '$sd' AND '$nd'";
        }



        if($this->input->post('import_id')!=''){
            $wer = " AND a.import_id = ".$this->input->post('import_id')." ";
        }
        
        return " AND a.deleted = 0 $wer";
    }

    function orderBy() {
        return "a.order_id desc";
    }

    function updateField() { 
        $data = array(
            'idsiswa' => $this->input->post('idsiswa') == '' ? $this->m_data->getSeqVal('seq_siswa') : $this->input->post('idsiswa'),
            'idunit' => $this->m_data->getID('unit', 'namaunit', 'idunit', $this->input->post('namaunit')),
            'namasiswa' => $this->input->post('namasiswa'),
            'namaibu' => $this->input->post('namaibu'),
            'namaayah' => $this->input->post('namaayah'),
            'alamat' => $this->input->post('alamat'),
            'kota' => $this->input->post('kota'),
            'phone' => $this->input->post('phone'),
            'tglmasuk' => $this->input->post('tglmasuk')!='' ? backdate($this->input->post('tglmasuk')) : null,
            'tahunajaranmasuk' => $this->input->post('tahunajaranmasuk')!='' ? $this->input->post('tahunajaranmasuk') : null,
            'foto' => $this->input->post('foto'),
            'noinduk' => $this->input->post('noinduk')
//            'tglkeluar' => $this->input->post('tglkeluar')
        );
        return $data;
    }

	function base_query(){
		$sql = "select 
				a.order_id,a.intermediary_id,a.payment_fee,l.invoice_id,a.policy_no,no_reg,no_kwitansi,a.destination_id,a.departure_id,a.premium_id,a.insured_id,startdate,enddate,order_date,payment_date,k.payment_channel_id,payment_amount,a.datein,
				b.depart_name,c.dest_name,d.region_id,d.category,d.type,e.currency_name,f.region_name,f.region_name_detail,g.identity_no,g.user_id,g.country_id,g.birthdate,
				g.firstname,g.lastname,g.address,g.phone_number,g.city,g.province,g.heirs_name,g.heirs_address,g.heirs_phone,g.heirs_datebirth,g.dateregistered,a.order_no,h.email,i.country_name,g.zipcode,a.total_ex_premi,
				case g.gender 
				when 1 then 'Pria' 
				when 2 then 'Wanita' 
				else 'Undefined' end as gender,
				case a.status
				when 1 then 'Awaiting Payment' 
				when 2 then 'Paid' 
				when 3 then 'Policy Issued' 
				when 4 then 'Rejected' 
				when 5 then 'Payment Confirmed' 
				when 6 then 'Closed' 
				else 'Undefined' end as status,a.total_amount,a.total_perluasan,a.total_premi,a.other_fee,total_anggota,k.no_payment,subtotal_premi,
                n.email as email_agen,n.user_id as user_id_agen,a.send_notif_to_family
				from ".DB_NAME.".order a
				join departure b ON a.departure_id = b.departure_id
				join destination c ON a.destination_id = c.destination_id
				left join premium d ON a.premium_id = d.premium_id
				left join ms_currency e ON d.currency_id = e.currency_id
				left join region f ON d.region_id = f.region_id
				join insured g ON a.insured_id = g.insured_id
				left join users h ON g.user_id = h.user_id
				left join country i ON g.country_id = i.country_id
                left join (select order_id,count(*) as total_anggota from insured_member
                    group by order_id) j ON a.order_id = j.order_id
                left join payment k ON k.order_id = a.order_id
                left join v_invoice l ON l.order_id = a.order_id
                left join intermediary m ON m.intermediary_id=g.intermediary_id
                left join users n ON n.user_id=m.user_id";
		return $sql;
	}

    function order_ext($order_id){
        $sql = "select a.ext_order_id,a.order_id,a.extention_id,a.rate,b.extention_name,b.extention_desc,b.items
                from order_ext a
                join extention b ON a.extention_id = b.extention_id
                where a.deleted = 0 and a.order_id = $order_id";
        $q = $this->db->query($sql);
        return $q->result_array();
    }

    function order_member($order_id){
        $sql = "select a.fullname,a.datebirth,a.no_identity,
                case a.relationship
                when 1 then 'Pasangan' 
                when 2 then 'Suami/Istri' 
                when 3 then 'Anak' 
                when 4 then 'Saudara Kandung' 
                when 5 then 'Pasangan' 
                else 'Undefined' end as relationship,
                case a.gender
                when 1 then 'Laki-laki' 
                when 2 then 'Perempuan' 
                else 'Undefined' end as gender
                from insured_member a
                where a.deleted = 0 and a.order_id = $order_id";
        $q = $this->db->query($sql);
        return $q->result_array();
    }

	function order_detail($order_id){
		$sql = $this->base_query();
		$sql.= " where a.order_id = $order_id";
		$q = $this->db->query($sql);
        // echo $sql;
		
        if($q->num_rows()>0){
			return $q->result_array()[0];
		} else {
			// echo 'data tidak ditemukan. mohon coba kembali'; die;
			return false;
		}
	}

	function order_list($user_id){
		$sql = $this->base_query();
		$sql.= " where h.user_id = $user_id order by a.order_id desc";
		$q = $this->db->query($sql);
		return $q->result_array();
	}
}
?>