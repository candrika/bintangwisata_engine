<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_inbox extends CI_Model {

	function tableName() {
        return 'v_inbox';
    }

    function pkField() {
        return 'order_id';
    }

    function searchField() {
        $field = "message_title,message_content,fullname,status_name,source";
        return explode(",", $field);
    }

    function selectField() {
        return "message_id,message_title,message_content,fullname,status_name,status,source,message_content_reply,email,email_user,email_user_reply,datein";
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
    	if($this->input->post('message_status')!=''){
    		$wer.=" and a.status = ".intval($this->input->post('message_status'))." ";
    	}

        $box = null;
        if($this->input->post('inbox')=='out'){
            $box = " and userin = ".$this->session->userdata('user_id')." and message_reply_id is not null";
        } else {
            $box = " and userin != ".$this->session->userdata('user_id')."";
        }

        return " AND message_id is not null $box $wer";
    }

    function orderBy() {
        return "a.message_id desc";
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