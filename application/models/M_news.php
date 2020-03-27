<?php
//berita
class M_news extends CI_Model {

    function tableName() {
        return 'news';
    }

    function pkField() {
        return 'news_id';
    }

    function searchField() {
        $field = "news_title,a.news_content";
        return explode(",", $field);
    }

    function selectField() {
        return "a.news_id,a.news_title,a.news_content,a.news_desc,a.news_keyword,a.status,a.userin,a.datein,a.news_image,b.username,b.email,DATE_FORMAT(a.datein,'%b') as bulan,DATE_FORMAT(a.datein,'%d') as tgl";
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
                    left join users b ON a.userin = b.user_id";

        return $query;
    }

    function whereQuery() {
        $wer = " AND a.status = 1";
        return $wer;
    }

    function orderBy() {
        return " news_id desc";
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

    function get_news($limit=null,$offset=null){
        $sql = $this->query().' WHERE TRUE '.$this->whereQuery();
        $sql.= ' order by '.$this->orderBy();
        if($limit!=null){
            $sql.= " limit $limit";
        }
        $q = $this->db->query($sql)->result_array();
        $data = array();
        $i=0;
        foreach ($q as $key => $value) {
            $data[$i] = $value;
            $data[$i]['news_desc'] = character_limiter($value['news_desc'],75);
            $data[$i]['datein'] = time_elapsed_string($value['datein']);
            $i++;
        }
        return $data;
    }

    function get_news_detail($id){
        $sql = $this->query().' WHERE TRUE '.$this->whereQuery().' and news_id = '.$id;
        $sql.= ' order by '.$this->orderBy();
        $q = $this->db->query($sql);
        if($q->num_rows()>0){
            return $q->result_array()[0];
        } else {
            return false;
        }
    }

}

?>