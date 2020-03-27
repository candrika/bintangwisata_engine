<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class News extends MY_Controller {

	public function index(){
		$this->load->model('m_news');
		// print_r($this->m_news->get_news(4)); die;
		$this->smarty->assign('footer_news', $this->m_news->get_news(4));	
		$this->smarty->assign('list_news', $this->m_news->get_news(10));	

		$this->smarty->assign('content_tpl', 'news_list.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function add(){
		$this->smarty->assign('d',null);
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('title','Tambah Berita');
		$this->smarty->assign('content_tpl', 'admin/news_form.tpl');	
		$this->smarty->display('app_template_iframe2.tpl');	
	}

	function edit($id){
		$d = $this->db->get_where('news',array('news_id'=>$id))->result_array()[0];
		$this->smarty->assign('d',$d);
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('title','Ubah Berita');
		$this->smarty->assign('content_tpl', 'admin/news_form.tpl');	
		$this->smarty->display('app_template_iframe2.tpl');
	}

	function detail($id){
		$this->load->model('m_news');
		// print_r($this->m_news->get_news(4)); die;
		$this->smarty->assign('footer_news', $this->m_news->get_news(4));	
		$d = $this->m_news->get_news_detail($id);

		if($d===false){
			$this->smarty->assign('title_msg','Berita');
			$this->smarty->assign('type','notice');
			$this->smarty->assign('content_msg','Berita tidak ditemukan.');
			$this->smarty->assign('content_tpl', 'message.tpl');	
			$this->smarty->display('app_template.tpl');	die;
		} 

		$this->smarty->assign('d', $d);	

		$this->smarty->assign('site_title', $d['news_title'].$this->settings['site_title']);
		$this->smarty->assign('site_keywords',$d['news_keyword']);
		$this->smarty->assign('site_description',$d['news_desc']);

		$this->smarty->assign('content_tpl', 'news_detail.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function save(){
		$config['upload_path'] = './upload/';
        $config['allowed_types'] = 'gif|jpg|png|jpeg|bmp';
        $config['max_size'] = '10000';
        $config['max_width'] = '1024';
        $config['max_height'] = '768';

        $this->load->library('upload', $config);

        $news_image = null;
        if (!$this->upload->do_upload('news_image')) {
            $error = $this->upload->display_errors();
            // echo $error; die;
            if ($error != '<p>Dokumen yang dibutuhkan belum dipilih.</p>') {
                // echo "{success:false, message:'" . $error . "'}";
                // $error = str_replace(, replace, subject)
                // echo json_encode(array('success'=>false,'message'=>$error));
                $this->smarty->assign('title_msg','Gagal Menambahkan Berita');
				$this->smarty->assign('type','notice');
				$this->smarty->assign('content_msg',$error);
				$this->smarty->assign('content_tpl', 'message.tpl');	
				$this->smarty->display('app_template_iframe2.tpl');	
                exit;
            }
            //  else {

            // }
        } else {
            // $data = $this->upload->data());
            // print_r($this->upload->data());
            // echo "{success:true, message:'".print_r($this->upload->data())."'}";
            // $this->prosesSaveProfileV2($this->upload->data()['orig_name'], $input);
            // $this->load->view('upload_success', $data);

            $news_image = $this->upload->data()['orig_name'];
        }

		$d = array(
				'news_title'=>$this->input->post('news_title'),
				'news_content'=>$this->input->post('news_content'),
				'news_desc'=>$this->input->post('news_desc'),
				'news_keyword'=>$this->input->post('news_keyword'),				
				'datein'=>date('Y-m-d H:m:s'),
				'userin'=>$this->session->userdata('user_id'),
				'status'=>1
		);

		if($news_image!=null){
			$d['news_image'] = $news_image;
		}

		$news_id = $this->input->post('news_id');
		if($news_id!=''){
			$this->db->where('news_id',$news_id);
			$this->db->update('news',$d);
		} else {
			$this->db->insert('news',$d);
		}
		
		$this->smarty->assign('title_msg','Sukses Menyimpan Berita');
		$this->smarty->assign('type','success');
		$this->smarty->assign('content_msg','Sukses Menyimpan Berita');
		$this->smarty->assign('content_tpl', 'message.tpl');	
		$this->smarty->display('app_template_iframe2.tpl');	

		// redirect(site_url('news/news'));
	}

}
?>