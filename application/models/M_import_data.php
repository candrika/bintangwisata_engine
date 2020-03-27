<?php

class M_import_data extends CI_Model {

    function tableName() {
        return DB_NAME.'.import';
    }

    function pkField() {
        return 'import_id';
    }

    function searchField() {
        $field = "import_no";
        return explode(",", $field);
    }

    function selectField() {
        return "a.import_id,a.import_no,a.userin,a.datein,b.email,total_order,total_insured";
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
                    join users b ON a.userin = b.user_id
                    join (select import_id,count(*) as total_order
                        from ".DB_NAME.".order
                        group by import_id) c ON a.import_id = c.import_id
                    join (select import_id,count(*) as total_insured
                        from insured
                        group by import_id) d ON a.import_id = d.import_id";

        return $query;
    }

    function whereQuery() {
        $wer = null;

        if($this->input->post('startdate')!='' && $this->input->post('enddate')!=''){
            $sd = backdate2($this->input->post('startdate')).' 00:00:00';
            $nd = backdate2($this->input->post('enddate')).' 23:59:59';
            if($sd != null && $nd != null)
                $wer .= " AND a.datein BETWEEN '$sd' AND '$nd'";
        }

        return " $wer ";
    }

    function orderBy() {
        return " import_id desc";
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