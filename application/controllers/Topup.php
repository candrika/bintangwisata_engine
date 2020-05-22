<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Topup extends MY_Controller {

	public function index()
	{
		$this->smarty->assign('message',null);
		// print_r();
		$this->smarty->assign('name',ucwords($this->session->userdata('real_name')));
		$this->smarty->assign('content_tpl', 'topup.tpl');
		$this->smarty->display('app_template.tpl');	
	}

	public function ajax_productType(){

		
	}

		
}
?>