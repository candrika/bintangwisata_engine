<?php

class M_user extends CI_Model {

    function tableName() {
        return 'users';
    }

    function pkField() {
        return 'user_id';
    }

    function searchField() {
        $field = "a.email,a.firstname,a.lastname";
        return explode(",", $field);
    }

    function selectField() {
        return "a.user_id,a.password,a.email,a.username,a.firstname,a.lastname,a.address,a.dateregistered,b.user_type_name,a.city,a.province,a.zipcode";
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
                    join user_type b ON a.user_type_id = b.user_type_id";

        return $query;
    }

    function whereQuery() {
        return " AND a.deleted = 0 and a.user_type_id = 1";
    }

    function orderBy() {
        return " a.user_id desc";
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