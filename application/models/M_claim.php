<?php

class M_claim extends CI_Model {

    function tableName() {
        return 'v_claim';
    }

    function pkField() {
        return 'claim_id';
    }

    function searchField() {
        $field = "diajukan_oleh,no_claim,claim_type_name,claim_status_name";
        return explode(",", $field);
    }

    function selectField() {
        return "claim_id,order_id,notes_admin,ready_to_star,no_claim,no_claim_star,diajukan_oleh,hub_insured,alamat_pemohon,notlp_pemohon,nama_bank,no_rek,nama_rek,claim_type,claim_status,user_id,claim_type_name,claim_status_name,datein";
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
                    from " . $this->tableName()." g ";

        return $query;
    }

    function whereQuery() {
        $wer = null;

        if($this->input->post('startdate')!='' && $this->input->post('enddate')!=''){
            $sd = backdate2($this->input->post('startdate')).' 00:00:00';
            $nd = backdate2($this->input->post('enddate')).' 23:59:59';
            if($sd != null && $nd != null)
                $wer .= " AND g.datein BETWEEN '$sd' AND '$nd'";
        }

        return " $wer ";
    }

    function orderBy() {
        return " claim_id desc";
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