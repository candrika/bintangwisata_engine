<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Page extends MY_Controller {

	public function index()
	{
		$this->smarty->assign('content_tpl', 'home_content.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function paket_asuransi(){
		$this->smarty->assign('home_opt',null);

		$satu = $this->db->query("select price
						from premium
						where region_id = 1 and
						period_start = 1 and period_end = 4");
		$this->smarty->assign('satu', $satu->result_array());	
		
		$this->smarty->assign('content_tpl', 'paket2.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function cara_pembayaran(){
		$this->smarty->assign('site_title','Cara Pembayaran - '.$this->settings['site_title']);
		$this->smarty->assign('site_description','tata cara pembayaran premi asuransi perjalanan Jasindo Travel');
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'page_cara_pembayaran.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function benefit_jasindo_travel(){
		$this->smarty->assign('site_title','Benefit - '.$this->settings['site_title']);
		$this->smarty->assign('site_description','Informasi manfaat asuransi perjalanan Jasindo Travel');
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'page_benefit.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function tentang_jasindo_travel(){
		$this->smarty->assign('site_title','Tentang - '.$this->settings['site_title']);

		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'tentang.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function perbaikan(){
		$this->smarty->assign('site_title','Tahap Perbaikan - '.$this->settings['site_title']);

		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'perbaikan.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function klaim_jasindo_travel(){
		$this->smarty->assign('site_title','Pengajuan Klaim - '.$this->settings['site_title']);
		$this->smarty->assign('site_description','Pengajuan dan tata cara klaim asuransi perjalanan Jasindo Travel');
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'page_klaim.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function syarat_dan_ketentuan(){
		$this->smarty->assign('site_title','Syarat dan Ketentuan - '.$this->settings['site_title']);
		$this->smarty->assign('site_description','Syarat dan Ketentuan asuransi perjalanan Jasindo Travel');
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'page_tnc.tpl');	
		$this->smarty->display('app_template.tpl');	
	}

	function hubungi_kami(){
		$this->smarty->assign('site_title','Hubungi Kami - '.$this->settings['site_title']);
		$this->smarty->assign('site_description','Hubungi asuransi perjalanan Jasindo Travel');
		$this->smarty->assign('home_opt',null);
		$this->smarty->assign('content_tpl', 'hubungi_kami.tpl');	
		$this->smarty->display('app_template.tpl');	
	}
}
