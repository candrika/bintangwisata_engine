<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Backend extends MY_Controller {

	public function index()
	{
		// asdasd
	}

	function get_departure(){
		if (isset($_REQUEST['query'])) {
		    $query = $_REQUEST['query'];
		    $q = $this->db->query("select airport_code,airport_name from airports where airport_code like '%".$query."%' ");
			$array = array();
		    $variable = $q->result_array();
		    foreach ($variable as $key => $value) {
				    $array[] = array (
				        'label' => $value['airport_code'],
				        'value' => $value['airport_name']." (".$value['airport_code'].")",
				    );
		    }
		    //RETURN JSON ARRAY
		    echo json_encode ($array);
		}
	}

	function get_destination(){
		if (isset($_REQUEST['query'])) {
		    $query = $_REQUEST['query'];
		    $q = $this->db->query("select airport_code,airport_name from airports where airport_code like '%".$query."%' ");
			$array = array();
		    $variable = $q->result_array();
		    foreach ($variable as $key => $value) {
				    $array[] = array (
				        'label' => $value['airport_code'],
                        'value' => $value['airport_name']." (".$value['airport_code'].")",
				    );
		    }
		    //RETURN JSON ARRAY
		    echo json_encode ($array);
		}
	}

    function get_departure_code(){
        // echo 
        if (isset($_GET['airport_code'])) {
            $query = $_GET['airport_code'];
            $q = $this->db->query("select airport_code,airport_name from airports where airport_code='".$query."' ");
            $array = array();
            $variable = $q->result_array();
            // print_r($variable);
            foreach ($variable as $key => $value) {
                    $array[] = array (
                        'label' => $value['airport_code'],
                        'value' => $value['airport_code'],
                    );
            }
            //RETURN JSON ARRAY
            echo json_encode ($array);
        }
    }

    function get_destination_code(){
        
        if (isset($_GET['airport_code'])) {
            $query = $_GET['airport_code'];
            $q = $this->db->query("select airport_code,airport_name from airports where airport_code = '".$query."' ");
            $array = array();
            $variable = $q->result_array();
            foreach ($variable as $key => $value) {
                    $array[] = array (
                        'label' => $value['airport_code'],
                        'value' => $value['airport_code'],
                    );
            }
            //RETURN JSON ARRAY
            echo json_encode ($array);
        }
    }

    function get_airlines(){
        if (isset($_REQUEST['query'])) {
            $query = $_REQUEST['query'];
            $q = $this->db->query("select code_iata,name from airlines where code_iata like '%".$query."%'");
            $array = array();
            $variable = $q->result_array();
            foreach ($variable as $key => $value) {
                    
                    // $value['airlines_code'] = 

                    $array[] = array (
                        'label' => $value['code_iata'],
                        'value' => $value['name']." (".$value['code_iata'].")",
                    );
            }
            //RETURN JSON ARRAY
            echo json_encode ($array);
        }
    }

	public function ext_get_all($table, $dir = null) {

        if ($dir != null) {
            // echo $dir.'/m_'.$table;
            $this->load->model($dir . '/m_' . $table, 'datamodel');
        } else {
            $this->load->model('m_' . $table, 'datamodel');
        }

        $extraparams = $this->input->post('extraparams');

        $arrWer = array();
        if ($extraparams != '') {
            $wer = "";
            $p = explode(',', $extraparams);
            $jum = count($p);
            $i = 1;
            $arrWer = array();
            foreach ($p as $key => $value) {

                $vparam = explode(':', $value);
                if (preg_match('/null/', $vparam[1])) {
                    //null
                } else {
                    $wer .= $vparam[0] . "='$vparam[1]'";
                    if ($vparam[1] != 'undefined') {
                        $arrWer[$vparam[0]] = $vparam[1];
                    }
                }
                $i++;
            }
        } else {
            $wer = null;
        }

//         print_r($arrWer);
        $jum = count($arrWer);
        $i = 1;
        $wer = "";
        foreach ($arrWer as $key => $value) {
            if ($i < $jum) {
                // echo "DISISNI";
                $wer .= "$key='$value' AND ";
            } else {
                // echo 'a';
                $wer .= " AND $key='$value'";
            }
            $i++;
            # code...
        }

        $start = isset($_POST['start']) ? $_POST['start'] : 0;
        $limit = isset($_POST['limit']) ? $_POST['limit'] : 10;
        $page = $this->input->post('page');


        if ($page > 1) {
            if ($page == 2) {
                //problem saat clear search box, start-nya hilang
                $start = $limit;
            } else {
                $kali = $page - 1;
                $start = $limit * $kali;
            }
        }
// echo $page.' '.$start.' ';

        $w = " WHERE TRUE ";

        if (isset($_POST['query'])) {

            $field = 0;

            foreach ($this->datamodel->searchField() as $key => $value) {
                if ($field == 0) {
                    // $w .="(";
                    $w.=" AND ((" . $value . " LIKE '%" . strtoupper($_POST['query']) . "%') OR (" . $value . " LIKE '%" . strtolower($_POST['query']) . "%')  OR (" . $value . " LIKE '%" . ucwords(strtolower($_POST['query'])) . "%')";
                } else {
                    $w.=" OR (" . $value . " LIKE '%" . strtoupper($_POST['query']) . "%') OR (" . $value . " LIKE '%" . strtolower($_POST['query']) . "%') OR (" . $value . " LIKE '%" . ucwords(strtolower($_POST['query'])) . "%')";
                }
                $field++;
            }
            $w .=")";

            if ($extraparams != '' && $wer != '') {
                $w.="  $wer ";
            }
        } else if ($extraparams != '' && $wer != '') {
            $w.="  $wer ";
        }

        //query tambahan dari model
        if ($this->datamodel->whereQuery() != "") {
            $w.=" " . $this->datamodel->whereQuery() . " ";
        }

        $orderby = $this->datamodel->orderBy() != "" ? "ORDER BY " . $this->datamodel->orderBy() : null;
        $sql = $this->datamodel->query() . " $w " . $orderby . " LIMIT $limit OFFSET $start";

        $this->db->limit($start, $limit);
        $query_page = $this->db->query($sql);
        // echo $sql;       
        $arr = array();
        foreach ($query_page->result() as $obj) {
            if($table=='order'){

                if($obj->invoice_id!=null){
                    if($obj->status!='Paid'){
                        if($obj->days>1 || $obj->days==null){
                        //pembayaran expired
                             $obj->status = 'Expired';
                        }
                   
                    }
                } else {
                    $obj->status = null;
                }
                
                
            }

            if($table=='invoice'){
                if($obj->status!='COMPLETED'){
                    if($obj->days>1 || $obj->days==null){
                        //pembayaran expired
                         $obj->status = 'Expired';
                    }
                }
            }

            $arr[] = $obj;
        }

        $query = $this->db->query($this->datamodel->query() . " $w");

        $results = $query->num_rows();
        echo '{success:true,numrow:' . $query->num_rows() . ',results:' . $results .
        ',rows:' . json_encode($arr) . '}';
        
        $query->free_result(); 
        $query_page->free_result(); 
    }

    function load_form($data){

        if($data=='settings'){
            $q = $this->db->get('settings')->result_array()[0];

            $cr = $this->db->get_where('ms_currency',array('currency_id'=>2))->result_array()[0];

            $q['rate_usd'] = $cr['rate'];
        } else {
            $qr = $this->db->get_where($data,array($this->input->post('key')=>$this->input->post('value')));
            if($qr->num_rows()>0){
                $q = $qr->result_array()[0];
            } else {
                $q = array('payment_channel_id'=>1,'status'=>1);
            }
            
        }

         $json = json_encode(array('success' => true, 'data' => $q));
         echo $json;
    }

    function message_reply($message_id){
        $q = $this->db->query("select a.message_id,a.message_reply_id,a.message_title,a.email,a.message_content,b.message_content as message_content_source,b.email as email_to,b.datein as datein,a.datein as datereply
                    from inbox a
                    join inbox b ON a.message_reply_id = b.message_id
                    where a.message_id = $message_id");
        $data = $q->result_array()[0];
        $this->load->view('message_reply',$data);
    }

    function post_reply(){
        // echo 'pos';
        $this->load->helper('text');

        $email = $this->input->post('email');
        $message = $this->input->post('message');
        $message_reply_id = $this->input->post('message_id');

        $this->db->trans_begin();

        if($this->session->userdata('user_type_id')==1){
            $source = 3;
        } else {
            $source = 1;
        }

        $d = array(             
            'userin'=> $this->session->userdata('user_id'),
            'message_reply_id'=> $message_reply_id,
            'message_title' => 'Rep - '.word_limiter($this->input->post('message_content_reply'),5),
            'email' => $this->session->userdata('email'),
            'message_content' => $this->input->post('message_content'),
            'status' => 1,
            'datein' => date('Y-m-d H:m:s'),
            'source' => $source
        );

        $this->db->insert('inbox',$d);

        $message_id = $this->db->insert_id();

        if ($this->db->trans_status() === FALSE)
        {
            $this->db->trans_rollback();
            $arr_ret = array('success'=>false,'message'=>'Gagal membalas pesan.');
        } else {
            $this->db->trans_commit();
            $arr_ret = array('success'=>true,'message'=>'Berhasil membalas pesan.');

            $this->db->where('message_id',$message_reply_id);
            $this->db->update('inbox',array('status'=>3));

            $this->email->initialize(array(
                  'protocol' => 'smtp',
                  'smtp_host' => 'smtp.sendgrid.net',
                  'smtp_user' => 'persaki',
                  'smtp_pass' => 'persaki123',
                  'charset' => 'utf-8',
                  'mailtype' => 'html',
                  'smtp_port' => 587,
                  'crlf' => "\r\n",
                  'newline' => "\r\n"
                ));

                $q = $this->db->query("select a.message_id,a.message_reply_id,a.message_title,a.email,a.message_content,b.message_content as message_content_source,b.email as email_to,b.datein as datein,a.datein as datereply
                            from inbox a
                            join inbox b ON a.message_reply_id = b.message_id
                            where a.message_id = $message_id");
                $data = $q->result_array()[0];
                // $this->load->view('message_reply',$data);

                $this->email->from($this->settings['sender_mail_address'], 'Jasindo Travel');
                $this->email->to($data['email_to']);
                $this->email->subject('Pesan Dari Jasindo Travel');
                $text = $this->load->view('message_reply',$data,TRUE);
                $this->email->message($text);
                $this->email->send();
        }

        echo json_encode($arr_ret);
    }

    function set_read(){
        $this->db->where('message_id',$this->input->post('message_id'));
        $this->db->update('inbox',array('status'=>2));
        $json = json_encode(array('success' => true));
         echo $json;
    }

    public function ext_delete($table, $dir = null) {
        
        // $idmenu = $this->input->post('idmenu');
        // if($idmenu!='')
        // {
        //     $retAkses = $this->cekAksesUser($idmenu,'delete');
        //     // echo $this->db->last_query();
        //     if(!$retAkses['success'])
        //     {
        //         echo json_encode($retAkses);
        //         exit;
        //     }
        // }

        if ($dir != null) {
            // echo $dir.'/m_'.$table;
            $this->load->model($dir . '/m_' . $table, 'datamodel');
        } else {
            $this->load->model('m_' . $table, 'datamodel');
        }


        $this->db->trans_begin();

        $records = json_decode($this->input->post('postdata'));
        foreach ($records as $id) {
            $pkfield = $this->datamodel->pkField();
            $pkfield = explode(",", $pkfield);
            if (count($pkfield)) {
                //multitple pk id. didefinisikan di model

                $posdata = explode(":", $id);

                $pkarr = array();
                $i = 0;
                foreach ($pkfield as $key => $value) {
                    $pkarr[str_replace(" ", "", $value)] = $posdata[$i];
                    $i++;
                }
                // print_r($pkarr);
                $this->db->where($pkarr);
            } else {
                $this->db->where($this->datamodel->pkField(), $id);
            }

            $this->db->delete($this->datamodel->tableName());
           // echo $this->db->last_query();
        }

        if ($this->db->affected_rows()>0) {
            $this->db->trans_commit();
            $json = array('success' => true, 'message' => 'Berhasil');
        } else {
            $this->db->trans_rollback();
            $json = array('success' => false, 'message' => 'Gagal');
        }

         echo json_encode($json);
    }
}
?>