<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ppob extends MY_Controller {

	public function index()
	{
		$this->smarty->assign('message',null);
		// print_r();
		$this->smarty->assign('name',ucwords($this->session->userdata('real_name')));
		$this->smarty->assign('content_tpl', 'ppob.tpl');
		$this->smarty->display('app_template.tpl');	
	}
}
?>