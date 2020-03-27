<?php

class M_participant extends CI_Model {

    function tableName() {
        return 'insured';
    }

    function pkField() {
        return 'insured_id';
    }

    function searchField() {
        $field = "g.firstname,g.lastname,g.phone_number,h.email";
        return explode(",", $field);
    }

    function selectField() {
        return "g.insured_id,g.user_id,g.country_id,g.birthdate,g.firstname,g.lastname,g.address,g.phone_number,g.city,g.province,g.dateregistered,h.email,i.country_name,g.identity_no,g.zipcode,heirs_name,heirs_address,heirs_phone,heirs_datebirth";
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
                    from " . $this->tableName()." g "
                 . "left join users h ON g.user_id = h.user_id
                    left join country i ON g.country_id = i.country_id";

        return $query;
    }

    function whereQuery($startdate=null,$enddate=null) {
        $wer = null;
        if($this->input->post('startdate')!='' && $this->input->post('enddate')!=''){
            $sd = backdate2($this->input->post('startdate')).' 00:00:00';
            $nd = backdate2($this->input->post('enddate')).' 23:59:59';
            if($sd != null && $nd != null)
                $wer .= " AND g.dateregistered BETWEEN '$sd' AND '$nd'";
        }

        if($startdate!=null && $enddate!=null){
            $sd = backdate2($startdate).' 00:00:00';
            $nd = backdate2($enddate).' 23:59:59';
            if($sd != null && $nd != null)
                $wer .= " AND g.dateregistered BETWEEN '$sd' AND '$nd'";
        }

        return " and g.deleted = 0 $wer";
    }

    function orderBy() {
        return "g.insured_id desc";
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