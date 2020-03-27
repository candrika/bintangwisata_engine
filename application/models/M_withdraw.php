<?php

class M_withdraw extends CI_Model {

    function tableName() {
        return 'withdraw';
    }

    function pkField() {
        return 'withdraw_id';
    }

    function searchField() {
        $field = "order_no,no_ref";
        return explode(",", $field);
    }

    function selectField() {
        return "a.withdraw_id,no_ref,a.available_balance,a.amount_withdraw,a.balance,a.date_trx,a.no_account,a.account_name,a.bank_name,a.notes,a.status,a.date_settled,b.username";
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
                    join users b ON a.userin = b.user_id ";

        return $query;
    }

    function whereQuery() {
        $wer = null;
        // if($this->input->post('payment_status')!==''){
        //     $wer.=" and a.status = '".$this->input->post('payment_status')."' ";
        // }
        return "  $wer";
    }

    function orderBy() {
        return " withdraw_id desc";
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