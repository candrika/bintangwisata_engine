<?php

class M_invoice extends CI_Model {

    function tableName() {
        return 'v_invoice';
    }

    function pkField() {
        return 'claim_id';
    }

    function searchField() {
        $field = "order_no";
        return explode(",", $field);
    }

    function selectField() {
        return "invoice_id,days,id_xd,order_id,user_id,xendit_fee_amount,sni_fee_amount,received_amount,status,amount,order_no,other_fee,total_ex_premi,total_perluasan,total_premi,subtotal_premi,payment_fee,total_amount,payment_type";
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
                    from " . $this->tableName()." a ";

        return $query;
    }

    function whereQuery() {
        $wer = null;
        if($this->input->post('payment_status')!==''){
            $wer.=" and a.status = '".$this->input->post('payment_status')."' ";
        }
        return "  $wer";
    }

    function orderBy() {
        return " invoice_id desc";
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

}

?>