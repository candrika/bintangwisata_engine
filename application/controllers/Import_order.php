<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Import_order extends MY_Controller {

	public function index()
	{

	}

    function import_id(){
            $di = array(
                'import_no'=>$this->generateRandomString(4).date('Ymd'),
                'userin'=> $this->session->userdata('user_id'),
                'datein'=>date('Y-m-d H:m:s')
            );
        $this->db->insert('import',$di);
        // echo $this->db->last_query(); 
        $import_id = $this->db->insert_id();
        return $import_id;
    }

    function insert_insured($d,$import_id){
         $data = array(
                'import_id' => $import_id,
                // 'user_id' => $this->session->userdata('user_id'),
                // 'country_id' => ,
                'gender' => $d['14'],
                'birthdate' => $this->insert_date($d['9']),
                'firstname' => $d['3'],
                'lastname' => $d['4'],
                'address' => $d['5'],
                // 'phone_number' => $d[''],
                // 'city' => $d['0'],
                'identity_no' => $d['7'],
                // 'province' => $d['0'],
                'zipcode' => $d['6'],
                // 'country_code' => $d['0'],
                // 'cb_promo' => $d['0'],
                'dateregistered' => date('Y-m-d H:m:s'),
                // 'dateactivated' => $d['0'],
                'deleted' => 0,
                'userin' => $this->session->userdata('user_id'),
                'datein' => date('Y-m-d H:m:s'),
                'usermod' => $this->session->userdata('user_id'),
                'datemod' => date('Y-m-d H:m:s'),
                'status' => 1,
                // 'heirs_name' => ,
                // 'heirs_address'  => ,
                // 'heirs_phone'  => ,
                // 'heirs_datebirth'  => ,
                // 'import_id' => $import_id,
                'no_urut' => $d['0']
            );
             // print_r($data); die;
            $this->db->insert('insured',$data);
            // echo $this->db->last_query(); die;
            $insured_id = $this->db->insert_id();
            return $insured_id;
    }

    function insert_order($d,$insured_id,$import_id){
        $data_order = array(
            'destination_id' => $d['11'],
            'departure_id' => $d['10'],
            'insured_id' => $insured_id,
            'extention_id' => isset($d['18']) ? $d['18'] : null,
            'order_no' => rand(11111,99999).date('Ym'),
            'startdate' => $this->insert_date($d['12']),
            'enddate' => $this->insert_date($d['13']),
            'order_date' => date('Y-m-d'),
            'other_fee' => $this->insert_number($d['20']),
            'status'=> 1,
            'issued_policy' => 2,
            'policy_no' => $d['1'],
            'policy_no_star'  => $d['2'],
            'deleted' => 0,
            'userin' => $this->session->userdata('user_id'),
            'datein' => date('Y-m-d H:m:s'),
            'usermod' => $this->session->userdata('user_id'),
            'datemod' => date('Y-m-d H:m:s'),
            'total_amount' => $this->insert_number($d['21']),
            'total_perluasan' => $this->insert_number($d['19']),
            'total_premi' => $this->insert_number($d['21']),
            'import_id'  => $import_id
        );
        // print_r($data_order); 
// die;    
        $this->db->insert('order',$data_order);
        // echo $this->db->last_query();
        $order_id = $this->db->insert_id();

        return $order_id;
    }


	function process() {
        $config['upload_path'] = './upload/xlsx';
        $config['allowed_types'] = 'xlsx';
        $config['max_size'] = '10000';

        $this->load->library('upload', $config);

        if (!$this->upload->do_upload('filexlsx')) {
            $error = $this->upload->display_errors();
            echo "{success:false, message:'" . $error . "'}";
        } else {
        	// echo json_encode($this->upload->data());die;

        	 // echo "{success:false, message:'dsadsa'}"; die;

            $file = $this->upload->data()['full_path'];
            $orig_name = $this->upload->data()['orig_name'];

            require_once DOCUMENTROOT . "/application/libraries/simplexlsx.class.php";
            $xlsx = new SimpleXLSX($file);
            $getWorksheetName = $xlsx->getWorksheetName();

            $val = $xlsx->rows(1);
            $sheet_insured_member = $xlsx->rows(2);
             // print_r($sheet_insured_member);
            $start = 4;
            while (isset($val[$start])) {
                $d = $val[$start];
                if(isset($d['0'])) {
                    $valid = $this->validasiInsured($d);
                    // print_r($valid); die;
                    if ($valid['status']==true) {
                        $oke = true;
                    } else {
                        $oke = false;
                        break;
                    }
                   
                }
                 $start++;
            }
            // echo 'oke:'.$oke; die;

            $start = 4;
            $num_member = 0;
            while (isset($sheet_insured_member[$start])) {
                $d = $sheet_insured_member[$start];

                if(isset($d['0'])) {
                    // print_r($d); die;
                    $valid_member = $this->validasiInsuredMember($d);

                    if ($valid_member['status']==true) {
                        $oke_member = true;
                        $num_member++;
                    } else {
                        $oke_member = false;
                        break;
                    }
                    $start++;
                }
            }
            // print_r($valid_member);
             // echo 'oke_member:'.$oke_member; die;

            if ($oke) {
                // $this->db->trans_begin();

                $import_id = $this->import_id();

                $start = 4;

                $total = 0;
                while (isset($val[$start])) {

                    $d = $val[$start];
                    if(isset($d['0'])) {

                        // print_r($d); die;
			    		$insured_id = $this->insert_insured($d,$import_id);
                        // print_r($data); 
                        // echo $this->db->last_query(); die;
						$order_id = $this->insert_order($d,$insured_id,$import_id);

						$this->insert_ext($d,$order_id);  

                        $total++;                    
                    }
                      $start++;
                }
                 // echo $num_member;
                if($num_member>0){
                    // echo $num_member;
                    //insert insured member
                    $this->insert_insured_member($sheet_insured_member,$import_id,$order_id);
                }                

                // $start-=1;
                // if ($this->db->trans_status() === FALSE) {
                //     $this->db->trans_rollback();
                    // echo json_encode(array('success' => false, 'message' => $start . ' Data Gagal Diimport.'));
                // } else {
                    // $this->db->trans_commit();
    //                     $this->db->trans_rollback();
                    echo json_encode(array('success' => true, 'message' => $total . ' Data Berhasil Diimport.'));
                // }
            } else {
                if(!$valid['status']){
                    echo json_encode($valid);
                } else if(!$valid_member['status']){
                    echo json_encode($valid_member);
                }
                
            }
        }
    }

    function insert_ext($d,$order_id){

         if(isset($d['18'])) {
                $q = $this->db->get_where('extention',array('extention_id'=>$d['18']))->row();

                $this->db->insert('order_ext',array(
                        'order_id'=>$order_id,
                        'extention_id'=>$d['18'],
                        'rate'=>$q->premium,
                        'datein'=>date('Y-m-d H:m:s')
                    ));

                 $this->db->last_query(); 
         }
    	
    }

    function insert_insured_member($val,$import_id,$order_id){
        $start = 4;
        $num_member = 0;
        while (isset($val[$start])) {
            $d = $val[$start];

            if(isset($d['0'])) {
                $insert = array(
                // 'insured_member_id' int(11) NOT NULL AUTO_INCREMENT,
                    'no_urut' => $d['0'],
                    'import_id' => $import_id,
                    'order_id' => $order_id,
                    'fullname' => $d['1'].' '.$d['2'],
                    'datebirth' => $this->insert_date($d['6']),
                    'relationship' => $d['8'],
                    'gender' => $d['7'],
                    'no_identity' => $d['5'],
                    'identity_type' => 2,
                    'datein' => date('Y-m-d H:m:s')
                );
                $this->db->insert('insured_member',$insert);                  
            }
              $start++;
        }    	
    }

    function insert_number($n){
    	$v = str_replace('.', '', $n);
    	return $v;
    }

    function insert_date($d){
    	$arr = explode('.', $d);
    	return $arr[2].'-'.$arr[1].'-'.$arr[0];
    }

    function generateRandomString($length = 10) {
	    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	    $charactersLength = strlen($characters);
	    $randomString = '';
	    for ($i = 0; $i < $length; $i++) {
	        $randomString .= $characters[rand(0, $charactersLength - 1)];
	    }
	    return $randomString;
	}

    function validasiInsuredMember($d,$update=false){

        $sheet_name = ' di Sheet Peserta Lain yang Ditanggung';
        $status = true;      
        $message = 'valid';

        /////////////////////////////////////////
        if($d['0']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Nama Urut tidak boleh kosong'.$sheet_name;
        } 
        /////////////////////////////////////////

        /////////////////////////////////////////
        if($d['1']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Nama Depan tidak boleh kosong'.$sheet_name;
        } 
        /////////////////////////////////////////

        /////////////////////////////////////////
        if($d['2']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Nama Belakang tidak boleh kosong'.$sheet_name;
        } 
        /////////////////////////////////////////

        /////////////////////////////////////////
        if($d['3']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Alamat tidak boleh kosong'.$sheet_name;
        } 
        /////////////////////////////////////////

         /////////////////////////////////////////
        if($d['4']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Kode POS tidak boleh kosong'.$sheet_name;
        } 
        /////////////////////////////////////////

        /////////////////////////////////////////
        if($d['5']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': No Identitas tidak boleh kosong'.$sheet_name;
        } 
        /////////////////////////////////////////

         /////////////////////////////////////////
        if($d['6']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Tgl Lahir tidak boleh kosong'.$sheet_name;
        }  else {
            $valid = $this->validasitgl($d['0'],'Tanggal lahir',$d['6']);
            if (!$valid['status']) {
                $status = false;
                $message = $valid['message']." ".$d['6'].$sheet_name;
            }
        }
        /////////////////////////////////////////

         /////////////////////////////////////////
        if($d['7']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Kode Gender tidak boleh kosong'.$sheet_name;
        } else {
            if(intval($d['7'])!=1 && intval($d['7'])!=2){
                $status = false;
                $message = 'Error data NO ' . $d['0'] . ': Kode gender salah '.$sheet_name;
            }
        }
        /////////////////////////////////////////

         /////////////////////////////////////////
        if($d['8']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Kode Hubungan tidak boleh kosong'.$sheet_name;
        } else {
            if(intval($d['8'])!=1 && intval($d['8'])!=2 && intval($d['8'])!=3){
                $status = false;
                $message = 'Error data NO ' . $d['0'] . ': Kode Hubungan salah '.$sheet_name;
            }
        }
        /////////////////////////////////////////


        return array('status' => $status, 'message' => $message);
    }

    function validasiInsured($d,$update=false)
    {
        $status = true;
      
        $message = 'valid';

        if($d['1']!=='')
        {
            $qemp = $this->db->query("select a.policy_no
										from order a
										where a.policy_no = ".$d['1']." ");
            if($qemp->num_rows()>0)
            {
                $status = false;
                $message = 'Error data NO ' . $d['0'] . ': No Polis sudah ada di dalam database ';
            } 
        }

        /////////////////////////////////////////
        if($d['3']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Nama Depan tidak boleh kosong';
        } 
        /////////////////////////////////////////

        /////////////////////////////////////////
        if($d['4']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Nama Belakang tidak boleh kosong';
        } 
        /////////////////////////////////////////

        /////////////////////////////////////////
        if($d['5']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Alamat tidak boleh kosong';
        } 
        /////////////////////////////////////////

        /////////////////////////////////////////
        if($d['6']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Kode POS tidak boleh kosong';
        } 
        /////////////////////////////////////////

        /////////////////////////////////////////
        if($d['7']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': No Identitas tidak boleh kosong';
        } 
        /////////////////////////////////////////

        /////////////////////////////////////////
        if($d['8']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Alamat Email tidak boleh kosong';
        } 
        /////////////////////////////////////////

       /////////////////////////////////////////
        if($d['9']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Tanggal lahir tidak boleh kosong';
        } else {
        	$valid = $this->validasitgl($d['0'],'Tanggal lahir',$d['9']);
            if (!$valid['status']) {
                $status = false;
                $message = $valid['message']." ".$d['9'];
            }
        }
        /////////////////////////////////////////


        ///////////////////////////////////////
        if($d['10']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Kode Kota Keberangkatan tidak boleh kosong';
        } 
        else {
            $code = $d['10'];
            $qemp = $this->db->query("select departure_id
				from departure a
				where departure_id = ". $code."");
            if($qemp->num_rows()<=0)
            {
                $status = false;
                $message = 'Error data NO ' . $d['0'] . ': Kode Kota Keberangkatan tidak ada di dalam database ';
            } 
        }

        ///////////////////////////////////////
        if($d['11']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Kode Kota Tujuan tidak boleh kosong';
        } 
        else {
            $code = $d['11'];
            $qemp = $this->db->query("select destination_id
				from destination a
				where destination_id = ". $code."");
            if($qemp->num_rows()<=0)
            {
                $status = false;
                $message = 'Error data NO ' . $d['0'] . ': Kode Kota Tujuan tidak ada di dalam database ';
            } 
        }

         /////////////////////////////////////////
        if($d['12']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Tgl Mulai tidak boleh kosong';
        } else {
        	$valid = $this->validasitgl($d['0'],'Tgl Mulai',$d['12']);
            if (!$valid['status']) {
                $status = false;
                $message = $valid['message']." ".$d['12'];
            }
        }
        /////////////////////////////////////////

          /////////////////////////////////////////
        if($d['13']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Tgl Akhir tidak boleh kosong';
        } else {
        	$valid = $this->validasitgl($d['0'],'Tgl Akhir',$d['13']);
            if (!$valid['status']) {
                $status = false;
                $message = $valid['message']." ".$d['13'];
            }
        }
        /////////////////////////////////////////

        /////////////////////////////////////////
        if($d['14']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Kode Gender tidak boleh kosong';
        } else {
        	if(intval($d['14'])!=1 && intval($d['14'])!=2){
        		$status = false;
        		$message = 'Error data NO ' . $d['0'] . ': Kode gender salah ';
        	}
        }
        /////////////////////////////////////////


         /////////////////////////////////////////
        if($d['15']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Kode Produk tidak boleh kosong';
        } else {
        	if(intval($d['15'])!=1 && intval($d['15'])!=2 && intval($d['15'])!=3 && intval($d['15'])!=4){
        		$status = false;
        		$message = 'Error data NO ' . $d['0'] . ': Kode Produk salah ';
        	}
        }
        /////////////////////////////////////////

         /////////////////////////////////////////
        if($d['16']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Kode Produk tidak boleh kosong';
        } else {
        	if(intval($d['16'])>5){
        		$status = false;
        		$message = 'Error data NO ' . $d['0'] . ': Jumlah Orang (termasuk penanggung) tidak boleh melebihi 5 orang ';
        	}
        }
        /////////////////////////////////////////

        /////////////////////////////////////////
        if($d['17']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Premi tidak boleh kosong';
        } 
        /////////////////////////////////////////

        /////////////////////////////////////////
        if($d['18']!='')
        {
           	if(intval($d['18'])!=1 && intval($d['18'])!=2 && intval($d['18'])!=3){
        		$status = false;
        		$message = 'Error data NO ' . $d['0'] . ': Kode Produk Perluasan salah ';
        	} elseif($d['19']=='')
	        {
	            $status = false;
	            $message = 'Error data NO ' . $d['0'] . ': Premi Perluasan tidak boleh kosong';
	        } 
        } 
        /////////////////////////////////////////

        /////////////////////////////////////////
        if($d['20']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Biaya Lain tidak boleh kosong';
        } 
        /////////////////////////////////////////

        /////////////////////////////////////////
        if($d['21']=='')
        {
            $status = false;
            $message = 'Error data NO ' . $d['0'] . ': Total Premi tidak boleh kosong';
        } 
        /////////////////////////////////////////

       
        return array('status' => $status, 'message' => $message);
    }

    function validasitgl($no,$jenis,$date)
    {
        $tgl = explode(".", $date);

        $bulan = isset($tgl[1]) ? intval($tgl[1]) : null;

        $message = 'Error data NO ' . $no .' : Format '.str_replace("%20", " ", $jenis).' Salah. <br><br> Format tangal dd.mm.yyy (tanggal.bulan.tahun). Contoh 01.05.201';
        if(count($tgl)<3)
        {
            $status = false;            
        } else if($bulan>12) {
            $status = false;
        } 
        else {
            $status = true;
            $message = null;
        }
        return array('message'=>$message,'status'=>$status);
    }
}
?>