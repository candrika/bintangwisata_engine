<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_panel extends MY_Controller {

	public function index()
	{
		$this->load->model(array('m_order','m_data'));
		$data = $this->m_order->order_list($this->session->user_id);
		$this->smarty->assign('data',$data);

		$data = $this->m_data->get_insured_data($this->session->user_id);
		$this->smarty->assign('data_user',$data);
		$this->smarty->assign('user_type_id',$this->session->userdata('user_type_id'));
		$data = $this->m_data->claim_data_list($this->session->user_id);
		// print_r($data);
		$this->smarty->assign('data_claim',$data);

		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'user_panel.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function change_password(){
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'change_password.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function save_password(){
		$q = $this->db->get_where('users',array('password'=>$this->input->post('password_old'),'user_id'=>$this->session->userdata('user_id')));
		if($q->num_rows()>0){
			$this->db->where('user_id',$this->session->userdata('user_id'));
			$this->db->update('users',array('password'=>$this->input->post('password_new')));
			echo json_encode(array('succes'=>true,'message'=>'<font color=green>Password berhasil diubah'));
		} else {
			echo json_encode(array('succes'=>false,'message'=>'<font color=red>Password lama salah'));
		}
	}

	function new_claim(){
		$this->smarty->assign('home_opt', null);
		$this->smarty->assign('readonly', null);	
		$this->smarty->assign('claim_type',null);	
		$this->smarty->assign('disabled', null);	
		$this->smarty->assign('hide_btn', 'block');
		$this->smarty->assign('dclaim',null);
		$this->smarty->assign('cb_term', null);

		//data asuransi yg dibeli
		$options = array();
		// $q = $this->db->query("select a.order_id,a.policy_no,insured_id
		// 						from ".DB_NAME.".order a
		// 						where policy_no is not null
		// 						and insured_id = ".$this->session->userdata('insured_id')." ");
		$q = $this->db->query("select a.order_id,a.policy_no,insured_id
								from ".DB_NAME.".order a
								where policy_no is not null
								and insured_id = ".$this->session->userdata('insured_id')." ");
		if($q->num_rows()>0){
			foreach($q->result() as $r){
				$options[$r->order_id] = $r->policy_no;
			}
			$this->smarty->assign('cb_polis',form_dropdown('order_id', $options, null, ' id="cb_no_polis" class="full-width"'));

			$this->smarty->assign('data_insured',$_SESSION);

			$this->smarty->assign('content_tpl', 'claim_form.tpl');	
		} else {
			$this->smarty->assign('title_msg','Form Klaim');
			$this->smarty->assign('type','notice');
			$this->smarty->assign('content_msg','Tidak bisa mengajukan klaim. Karena anda belum memiliki polis yang aktif.');
			$this->smarty->assign('content_tpl', 'message.tpl');	
		}
		$this->smarty->assign('dclaim_item', false);	
		
		$this->smarty->display('app_template.tpl');	
	}

	function view_claim($claim_id){
		$this->load->model('m_data');



		$this->smarty->assign('home_opt',null);
		$dclaim = $this->m_data->claim_data_detail($claim_id);
		// print_r($dclaim); die;
		$this->smarty->assign('dclaim',$dclaim);

		$dclaim_item = $this->m_data->claim_data_detail_item($claim_id);
		$this->smarty->assign('dclaim_item',$dclaim_item);

		$data_insured = $this->m_data->get_insured_data($dclaim['user_id']);
		$this->smarty->assign('data_insured',$data_insured);

		// if(intval($this->session->userdata('user_type_id'))==1){
			//administrator
			$insured_id = $data_insured['insured_id'];
		// } else {
		// 	$insured_id = $this->session->userdata('insured_id');
		// }

		$options = array(
			0=>'Pilih polis...'
		);
		$q = $this->db->query("select a.order_id,a.policy_no,insured_id
								from ".DB_NAME.".order a
								where policy_no is not null
								and insured_id = ".$insured_id."");
		foreach($q->result() as $r){
				$options[$r->order_id] = $r->policy_no;
		}
		$this->smarty->assign('cb_polis',form_dropdown('order_id', $options, array(50), ' class="full-width" disabled'));

		$this->smarty->assign('claim_type', $dclaim['claim_type']);	

		if($dclaim['claim_status']==2){
			$this->smarty->assign('readonly', null);
			$this->smarty->assign('hide_btn', 'block');
		} else {
			$this->smarty->assign('readonly', 'readonly');
			$this->smarty->assign('hide_btn', 'none');
		}
			
		if($this->session->userdata('user_type_id')>1){
			$this->smarty->assign('readonly_admin', 'readonly');
		} else {
			$this->smarty->assign('readonly_admin', null);
		}

		$this->smarty->assign('user_type_id', $this->session->userdata('user_type_id'));
		$this->smarty->assign('disabled', 'disabled');	
		$this->smarty->assign('cb_term', 'checked');
		

		$this->smarty->assign('content_tpl', 'claim_form.tpl');	

		if(intval($this->session->userdata('user_type_id'))==1 || $this->input->get('noauth')=='yes'){
			//administrator
			$this->smarty->display('app_template_popup.tpl');	
		} else {
			$this->smarty->display('app_template.tpl');	
		}
		
	}

	function replace_par($str){
		$s = str_replace('<p>', '', $str);
		return str_replace('</p>', '', $s);

	}

	function file_upload_lainnya(){
		$config['upload_path']          = './upload/';
        $config['allowed_types']        = 'gif|jpg|jpeg|png|bmp';
        $config['max_size']             = 1500;
        $config['max_width']            = 1440;
        $config['max_height']           = 900;

        $this->load->library('upload');

        $data = array();
        $data['doc_lainnya_laporan'] = null;
        
        $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_lainnya_laporan')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Tanggung Jawab Pribadi : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_lainnya_laporan'] = $this->upload->data()['file_name']; }

        // ----

          $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_lainnya_keterangan')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Perpanjangan Polis otomatis: : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_lainnya_keterangan'] = $this->upload->data()['file_name']; }

        // ----

           $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_lainnya_copy')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Biaya Sendiri atau Mobil Sewaan : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_lainnya_copy'] = $this->upload->data()['file_name']; }

        // ----

           $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_lainnya_lainnya')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Dokumen lainnya, apabila dinyatakan perlu oleh Bagian Klaim Jasindo : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_lainnya_lainnya'] = $this->upload->data()['file_name']; }


        return $data;
	}

	function file_upload_ketidaknyamanan(){
		$config['upload_path']          = './upload/';
        $config['allowed_types']        = 'gif|jpg|jpeg|png|bmp';
        $config['max_size']             = 1500;
        $config['max_width']            = 1440;
        $config['max_height']           = 900;

        $this->load->library('upload');

        $data = array();

        $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_kenyamanan_kuitansi')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Kuitansi asli pembelian tiket pesawat/tiket kereta api/tiket kapal laut/tiket pesawat/boarding pass : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_kenyamanan_kuitansi'] = $this->upload->data()['file_name']; }

        // ----

       $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_kenyamanan_laporan')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Laporan kehilangan, pencurian atau tidak kekerasan dari pihak berwenang; laporan ketidakteraturan harta benda dari maskapai penerbangan, penyedia angkutan kapal laut atau kereta api : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_kenyamanan_laporan'] = $this->upload->data()['file_name']; }

        // ----

         $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_kenyamanan_konfirmasi1')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Konfirmasi tertulis dari maskapai penerbangan; penyediaan angkutan kapal laut atau kereta api, perihal lama dan alasan penundaan, atau ada atau tidaknya transportasi pengganti yang memungkinkan, kuitansi asli atasu biaya hotel atau biaya transportasi pengganti : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_kenyamanan_konfirmasi1'] = $this->upload->data()['file_name']; }

        // ----

     

         $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_kenyamanan_konfirmasi2')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Konfirmasi tertulis dari maskapai penerbangan, penyedia angkutan kapal laut atau kereta api, bahwa karena penundaan kedatangan transportasi awal mengakibatkan tertanggung kehilangan alat transportasi lanjutannya : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_kenyamanan_konfirmasi2'] = $this->upload->data()['file_name']; }

        // ----

         $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_kenyamanan_kematian')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Surat Kematingan atau surat keterangan kejadian bencana alam atau kejadian yang tidak terduga dari berwenang atau surat Keterangan Medis/Resume Medis dari Dokter yang memeriksa tertanggung perihal ketidaklayakan tertanggung untuk melakukan perjalanan : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_kenyamanan_kematian'] = $this->upload->data()['file_name']; }

        // ----

         $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_kenyamanan_keterangan')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Surat Keterangan mengenai peristiwa pencurian/kebongkaran dari pejabatan setempat yang berwenangan : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_kenyamanan_keterangan'] = $this->upload->data()['file_name']; }

        // ----

         $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_kenyamanan_lainnya')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Dokumen lainnya, apabila dinyatakan perlu oleh Bagian Klaim Jasindo : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_kenyamanan_lainnya'] = $this->upload->data()['file_name']; }

        // ----


        return $data;
	}

	function file_upload_medis(){
		$config['upload_path']          = './upload/';
        $config['allowed_types']        = 'gif|jpg|jpeg|png|bmp';
        $config['max_size']             = 1500;
        $config['max_width']            = 1440;
        $config['max_height']           = 900;

        $this->load->library('upload');

        $data = array();

        $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_medis_resume')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Resume Medis dari dokter : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_medis_resume'] = $this->upload->data()['file_name']; }

        // ----

        $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_medis_kuitansi')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Kuitansi asli dan rincian biaya rumah sakit : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_medis_kuitansi'] = $this->upload->data()['file_name']; }

        // ----

        $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_medis_dokumen_lain')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Dokumen lainnya, apabila dinyatakan perlu oleh Bagian Klaim Jasindo : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_medis_dokumen_lain'] = $this->upload->data()['file_name']; }


        return $data;
	}

	function file_upload_kecelakaan(){
		$config['upload_path']          = './upload/';
        $config['allowed_types']        = 'gif|jpg|jpeg|png|bmp';
        $config['max_size']             = 1500;
        $config['max_width']            = 1440;
        $config['max_height']           = 900;

        $this->load->library('upload');

        $data = array();

        $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_kecelakaan_laporan')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Terjadi kesalahan pada file laporan kejadian dari kepolisisan atau instansi yang berwenang : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_kecelakaan_laporan'] = $this->upload->data()['file_name']; }

        // ----

        $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_kecelakaan_resume')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Resume medis dan penyataan Dokter perihal cacat permanen yang dialami : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_kecelakaan_resume'] = $this->upload->data()['file_name']; }

        // ----

        $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_kecelakaan_surat')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Surat Keterangan atau Sertifikat Kematian dari Pemerintah atau Lembaga yang berwenang : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_kecelakaan_surat'] = $this->upload->data()['file_name']; }

        // ----

         $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_kecelakaan_kk')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Kartu Keluarga dan/atau Surat Keterangan Institusi Pendidikan, Institusi dimana anak sah dari Tertanggung menuntut ilmu : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_kecelakaan_kk'] = $this->upload->data()['file_name']; }

        // ----

         $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_kecelakaan_fotocopy')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Foto copy Sertifikat Polis/Schedule Polis dan fotocopy identitas Tertanggung (KTP/SIM/Paspor) : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_kecelakaan_fotocopy'] = $this->upload->data()['file_name']; }

        // ----

         $this->upload->initialize($config);
        if ( ! $this->upload->do_upload('doc_kecelakaan_lainnya')) {	
			if($this->upload->display_errors()=='<p>Dokumen yang dibutuhkan belum dipilih.</p>'){

			} else {
                echo json_encode(array(
                		'success'=>false,
                		'message'=>'Dokumen lainnya, apabila dinyatakan perlu oleh Bagian Klaim Jasindo : '.$this->replace_par($this->upload->display_errors()).''
                	));
                die;
			}                
        } else { $data['doc_kecelakaan_lainnya'] = $this->upload->data()['file_name']; }


        return $data;
	}

	function save_claim(){
		
		// print_r($_POST); die;

		$this->db->trans_begin();
		$cb_klaim_type = intval($this->input->post('cb_klaim_type'));

		if($cb_klaim_type==1){
			//medis
			if(count_days($this->clear_input($this->input->post('medis_tgl_kej'),'date'),date('Y-m-d'))>45){
				$arr_ret = array('success'=>false,'message'=>'Pengajuan klaim maksimal 45 hari dari tanggal kejadian.');
				echo json_encode($arr_ret); die;
			}
		} else if($cb_klaim_type==2){
			if(count_days($this->clear_input($this->input->post('kecel_tgl_kejadian'),'date'),date('Y-m-d'))>45){
				$arr_ret = array('success'=>false,'message'=>'Pengajuan klaim maksimal 45 hari dari tanggal kejadian.');
				echo json_encode($arr_ret); die;
			}
		} else if($cb_klaim_type==3){
			if(count_days($this->clear_input($this->input->post('nyaman_tripdelay_tgl_kejadian'),'date'),date('Y-m-d'))>45){
				$arr_ret = array('success'=>false,'message'=>'Pengajuan klaim maksimal 45 hari dari tanggal kejadian.');
				echo json_encode($arr_ret); die;
			}
		} else if($cb_klaim_type==4){
			if(count_days($this->clear_input($this->input->post('lain_date_accident'),'date'),date('Y-m-d'))>45){
				$arr_ret = array('success'=>false,'message'=>'Pengajuan klaim maksimal 45 hari dari tanggal kejadian.');
				echo json_encode($arr_ret); die;
			}
		}

		
		$no_claim = rand(11111,99999).date('Ym');

		$data = array(
					  // 'claim_id' int(255) NOT NULL AUTO_INCREMENT,
			  'order_id' => $this->clear_input($this->input->post('order_id')),
			  'no_claim' => $no_claim,
			  // 'status' => $this->clear_input($this->input->post('diajukan_oleh')),
			  // 'deleted' => $this->clear_input($this->input->post('diajukan_oleh')),
			  'diajukan_oleh' => $this->clear_input($this->input->post('diajukan_oleh')),
			  'hub_insured' => $this->clear_input($this->input->post('hub_insured')),
			  'alamat_pemohon' => $this->clear_input($this->input->post('alamat_pemohon')),
			  'notlp_pemohon' => $this->clear_input($this->input->post('notlp_pemohon')),
			  'polis_lain' => $this->clear_input($this->input->post('polis_lain')),
			  'nama_bank' => $this->clear_input($this->input->post('nama_bank')),
			  'no_rek' => $this->clear_input($this->input->post('no_rek')),
			  'nama_rek' => $this->clear_input($this->input->post('nama_rek')),
			  'claim_type' => $cb_klaim_type,
			  'medis_tgl_kej' => $this->clear_input($this->input->post('medis_tgl_kej'),'date'),
			  'medis_tempat_kej' => $this->clear_input($this->input->post('medis_tempat_kej')),
			  'medis_kondisi' => $this->clear_input($this->input->post('medis_kondisi')),
			  'medis_perawatan' => $this->clear_input($this->input->post('medis_perawatan')),
			  'medis_rs' => $this->clear_input($this->input->post('medis_rs')),
			  'medis_dokter' => $this->clear_input($this->input->post('medis_dokter')),
			  'medis_jenis_perawatan' => $this->clear_input($this->input->post('medis_jenis_perawatan')),
			  'medis_lama_perawatan' => $this->clear_input($this->input->post('medis_lama_perawatan')),
			  'medis_diagnosa' => $this->clear_input($this->input->post('medis_diagnosa')),
			  'medis_biaya' => $this->clear_input($this->input->post('medis_biaya')),
			  'kecel_tgl_kejadian' => $this->clear_input($this->input->post('kecel_tgl_kejadian'),'date'),
			  'kecel_tempat' => $this->clear_input($this->input->post('kecel_tempat')),
			  'kecel_kronologis' => $this->clear_input($this->input->post('kecel_kronologis')),
			  'kecel_penyebab' => $this->clear_input($this->input->post('kecel_penyebab')),
			  'kecel_rs' => $this->clear_input($this->input->post('kecel_rs')),
			  'kecel_dokter' => $this->clear_input($this->input->post('kecel_dokter')),
			  'nyaman_tripdelay_penerbangan' => $this->clear_input($this->input->post('nyaman_tripdelay_penerbangan')),
			  'nyaman_tripdelay_tgl_kejadian' => $this->clear_input($this->input->post('nyaman_tripdelay_tgl_kejadian'),'date'),
			  'nyaman_tripdelay_waktu_berangkat' => $this->clear_input($this->input->post('nyaman_tripdelay_waktu_berangkat')),
			  'nyaman_tripdelay_penundaan' => $this->clear_input($this->input->post('nyaman_tripdelay_penundaan')),
			  'nyaman_tripdelay_kronologis' => $this->clear_input($this->input->post('nyaman_tripdelay_kronologis')),
			  'nyaman_tripdelay_kompensasi' => $this->clear_input($this->input->post('nyaman_tripdelay_kompensasi')),
			  'nyaman_bagdelay_tgl_awal' => $this->clear_input($this->input->post('nyaman_bagdelay_tgl_awal'),'date'),
			  'nyaman_bagdelay_tgl_akhir' => $this->clear_input($this->input->post('nyaman_bagdelay_tgl_akhir'),'date'),
			  'nyaman_bagdelay_tgldatang_awal' => $this->clear_input($this->input->post('nyaman_bagdelay_tgldatang_awal')),
			  'nyaman_bagdelay_tgldatang_akhir' => $this->clear_input($this->input->post('nyaman_bagdelay_tgldatang_akhir')),
			  'nyaman_bagdelay_jamdatang_awal' => $this->clear_input($this->input->post('nyaman_bagdelay_jamdatang_awal')),
			  'nyaman_bagdelay_jamdatang_akhir' => $this->clear_input($this->input->post('nyaman_bagdelay_jamdatang_akhir')),
			  'nyaman_bagdelay_lokasi_barangkat' => $this->clear_input($this->input->post('nyaman_bagdelay_lokasi_barangkat')),
			  'nyaman_bagdelay_lama_delay' => $this->clear_input($this->input->post('nyaman_bagdelay_lama_delay')),
			  'nyaman_bagdelay_destinasi' => $this->clear_input($this->input->post('nyaman_bagdelay_destinasi')),
			  'nyaman_bagdelay_alasan_delay' => $this->clear_input($this->input->post('nyaman_bagdelay_alasan_delay')),
			  'nyaman_bagdelay_noflight_awal' => $this->clear_input($this->input->post('nyaman_bagdelay_noflight_awal')),
			  'nyaman_bagdelay_noflight_akhir' => $this->clear_input($this->input->post('nyaman_bagdelay_noflight_akhir')),
			  'nyaman_bagdelay_kronologis' => $this->clear_input($this->input->post('nyaman_bagdelay_kronologis')),
			  'nyaman_cancel_bookdate' => $this->clear_input($this->input->post('nyaman_cancel_bookdate'),'date'),
			  'nyaman_cancel_accdate' => $this->clear_input($this->input->post('nyaman_cancel_accdate'),'date'),
			  'nyaman_cancel_intent_depart_date' => $this->clear_input($this->input->post('nyaman_cancel_intent_depart_date'),'date'),
			  'nyaman_cancel_intent_back_date' => $this->clear_input($this->input->post('nyaman_cancel_intent_back_date'),'date'),
			  'nyaman_cancel_kronologis' => $this->clear_input($this->input->post('nyaman_cancel_kronologis')),
			  'nyaman_cancel_terbayar' => $this->clear_input($this->input->post('nyaman_cancel_terbayar')),
			  'nyaman_cancel_bayar_klaim' => $this->clear_input($this->input->post('nyaman_cancel_bayar_klaim')),
			  'nyaman_baglost_date_accident' => $this->clear_input($this->input->post('nyaman_baglost_date_accident'),'date'),
			  'nyaman_baglost_reportto' => $this->clear_input($this->input->post('nyaman_baglost_reportto')),
			  'nyaman_baglost_timeplace' => $this->clear_input($this->input->post('nyaman_baglost_timeplace')),
			  'nyaman_baglost_date_report' => $this->clear_input($this->input->post('nyaman_baglost_date_report'),'date'),
			  'lain_atas_nama' => $this->clear_input($this->input->post('lain_atas_nama')),
			  'lain_date_accident' => $this->clear_input($this->input->post('lain_date_accident'),'date'),
			  'lain_place_accident' => $this->clear_input($this->input->post('lain_place_accident')),
			  'lain_cronology' => $this->clear_input($this->input->post('lain_cronology')),
			  'lain_document' => $this->clear_input($this->input->post('lain_document')),
			  'cb_accept_term' => $this->clear_input($this->input->post('cb_accept_term')),
			  'cronology_lost_item' => $this->clear_input($this->input->post('cronology_lost_item')),
			  'datein' => date('Y-m-d H:m:s'),
			  'datemod' => date('Y-m-d H:m:s') ,
			  'usermod' => $this->session->userdata('user_id'),
			  // 'proposed_by' => $this->clear_input($this->input->post('diajukan_oleh')),
			  // 'reviewed_by' => $this->clear_input($this->input->post('diajukan_oleh')),
			  // 'reviewed_date' => $this->clear_input($this->input->post('diajukan_oleh')),
			  // 'accepted_by' => $this->clear_input($this->input->post('diajukan_oleh')),
			  // 'accepted_date' => $this->clear_input($this->input->post('diajukan_oleh')),
			  'claim_status' => 1
			  // 'cb_klaim_type' => $cb_klaim_type
			);
		

		if($cb_klaim_type==1){
			$d = $this->file_upload_medis();

			$data['doc_medis_resume'] = isset($d['doc_medis_resume']) ? $d['doc_medis_resume'] : null;
			$data['doc_medis_kuitansi'] = isset($d['doc_medis_kuitansi']) ? $d['doc_medis_kuitansi'] : null;
			$data['doc_medis_dokumen_lain'] = isset($d['doc_medis_dokumen_lain']) ? $d['doc_medis_dokumen_lain'] : null;

		} else if($cb_klaim_type==2){
			$d = $this->file_upload_kecelakaan();

			$data['doc_kecelakaan_laporan'] = isset($d['doc_kecelakaan_laporan']) ? $d['doc_kecelakaan_laporan'] : null;
			$data['doc_kecelakaan_resume'] = isset($d['doc_kecelakaan_resume']) ? $d['doc_kecelakaan_resume'] : null;
			$data['doc_kecelakaan_surat'] = isset($d['doc_kecelakaan_surat']) ? $d['doc_kecelakaan_surat'] : null;
			$data['doc_kecelakaan_kk'] = isset($d['doc_kecelakaan_kk']) ? $d['doc_kecelakaan_kk'] : null;
			$data['doc_kecelakaan_fotocopy'] = isset($d['doc_kecelakaan_fotocopy']) ? $d['doc_kecelakaan_fotocopy'] : null;
			$data['doc_kecelakaan_lainnya'] = isset($d['doc_kecelakaan_lainnya']) ? $d['doc_kecelakaan_lainnya'] : null;

		} else if($cb_klaim_type==3){
			$d = $this->file_upload_ketidaknyamanan();

			$data['doc_kenyamanan_kuitansi'] = isset($d['doc_kenyamanan_kuitansi']) ? $d['doc_kenyamanan_kuitansi'] : null;
			$data['doc_kenyamanan_laporan'] = isset($d['doc_kenyamanan_laporan']) ? $d['doc_kenyamanan_laporan'] : null;
			$data['doc_kenyamanan_konfirmasi1'] = isset($d['doc_kenyamanan_konfirmasi1']) ? $d['doc_kenyamanan_konfirmasi1'] : null;
			$data['doc_kenyamanan_konfirmasi2'] = isset($d['doc_kenyamanan_konfirmasi2']) ? $d['doc_kenyamanan_konfirmasi2'] : null;
			$data['doc_kenyamanan_kematian'] = isset($d['doc_kenyamanan_kematian']) ? $d['doc_kenyamanan_kematian'] : null;
			$data['doc_kenyamanan_keterangan'] = isset($d['doc_kenyamanan_keterangan']) ? $d['doc_kenyamanan_keterangan'] : null;
			$data['doc_kenyamanan_lainnya'] = isset($d['doc_kenyamanan_lainnya']) ? $d['doc_kenyamanan_lainnya'] : null;

		} else if($cb_klaim_type==4){
			$d = $this->file_upload_lainnya();

			$data['doc_lainnya_laporan'] = isset($d['doc_lainnya_laporan']) ? $d['doc_lainnya_laporan'] : null;
			$data['doc_lainnya_keterangan'] = isset($d['doc_lainnya_keterangan']) ? $d['doc_lainnya_keterangan'] : null;
			$data['doc_lainnya_copy'] = isset($d['doc_lainnya_copy']) ? $d['doc_lainnya_copy'] : null;
			$data['doc_lainnya_lainnya'] = isset($d['doc_lainnya_lainnya']) ? $d['doc_lainnya_lainnya'] : null;
		}

		// print_r($data); die;

		$this->db->insert('claim',$data);

		$insert_id = $this->db->insert_id();

		$num_item_claim = count($_POST['item_name']);
		if($num_item_claim>0){
			for($i=0;$i<$num_item_claim;$i++){
				$ditem = array(
						'claim_id' => $insert_id,
						'item_name' => $_POST['item_name'][$i],
						'qty_lost' => $_POST['qty_lost'][$i],
						'price_purchase' => $_POST['price_purchase'][$i],
						'date_place_purchase' => $_POST['date_place_purchase'][$i]
				);
				$this->db->insert('claim_item',$ditem);
			}
		}

		$this->db->where('order_id',$data['order_id']);
		$this->db->update('order',array('claimed'=>1));	

		$qpolicy = $this->db->query("select policy_no from ".DB_NAME.".order where order_id = ".$data['order_id']." ")->row();

		if ($this->db->trans_status() === FALSE)
		{
		        $this->db->trans_rollback();

		  //       $this->smarty->assign('title_msg','Pengajuan Klaim');
				// $this->smarty->assign('type','error');
				// $this->smarty->assign('content_msg','Pengajuan Klaim Gagal.');
				// $this->smarty->assign('content_tpl', 'message.tpl');	

				$arr_ret = array('success'=>false,'message'=>'Pengajuan Klaim Gagal.');
		} else {
			        $this->db->trans_commit();

		   //      	$this->smarty->assign('title_msg','Pengajuan Klaim');
					// $this->smarty->assign('type','success');
					// $this->smarty->assign('content_msg','Pengajuan Klaim Berhasil dengan nomor klaim: <b> '.$no_claim.'</b>.');
					// $this->smarty->assign('content_tpl', 'message.tpl');	

					$arr_ret = array('success'=>true,'no_claim'=>$no_claim,'message'=>'Pengajuan Klaim Berhasil dengan nomor klaim: <b> '.$no_claim.'</b>.');
					//send email order
		        	$this->send_email($data,$qpolicy->policy_no);
			    }

		// $this->smarty->display('app_template.tpl');	
		echo json_encode($arr_ret);
	}

	function upload_medis(){
		
	}

	function claim_success($no_claim){
		$this->smarty->assign('home_opt',null);

	 	$this->smarty->assign('title_msg','Pengajuan Klaim');
		$this->smarty->assign('type','success');
		// $this->smarty->assign('content_msg','Pengajuan Klaim Berhasil dengan nomor klaim: <b> '.$no_claim.'</b>.');
		$this->smarty->assign('content_msg','Pengajuan Klaim Berhasil');
		$this->smarty->assign('content_tpl', 'message.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function send_email($data,$policy_no){
		$q = $this->db->query("select a.insured_id,c.email
									from ".DB_NAME.".order a
									join insured b ON a.insured_id = b.insured_id
									join users c ON b.user_id = c.user_id
									where a.order_id = ".$data['order_id']." ")->row();

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

		$this->email->attach(DOCUMENTROOT."assets/tpl/images/logo.png", "inline");
		$this->email->from($this->settings['sender_mail_address'], 'Jasindo Travel');
		$this->email->to($q->email);
		$this->email->subject('Pengajuan Klaim Jasindo Travel');

		// $this->load->model('m_claim');
		$data['d'] = $data;

		if(intval($data['d']['claim_type'])==1){
			$data['d']['claim_type_name'] = 'Medis';
		} else if(intval($data['d']['claim_type'])==2){
				$data['d']['claim_type_name'] = 'Kecelakaan Diri';
			} else if(intval($data['d']['claim_type'])==3){
					$data['d']['claim_type_name'] = 'Ketidaknyamanan Perjalanan';
				} else {
						$data['d']['claim_type_name'] = 'Klaim Lainnya';
					}

		$data['policy_no'] = $policy_no;
		$text = $this->load->view('newclaim_confirmation',$data,TRUE);
		$this->email->message($text);
		$this->email->send();
	}

	function clear_input($v,$type='text'){
		if($type=='text'){
			$r = $v=='' ? null : $v;
		} else {
			$r = $v=='' ? null : backdate2($v);
		}
		
		return $r;
	}

	function klaim_medis(){
		echo $this->settings['site_title'];
		// print_r($this->settings);
	}

	function klaim_kecelakaan(){

	}

	function klaim_kenyamanan(){

	}

	function klaim_lainnya(){

	}

}