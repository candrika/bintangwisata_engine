<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class S extends MY_Controller {

	public function i($invoice_id){
		$q = $this->db->query("select invoice_url from invoice where invoice_id = ".$invoice_id." ");
		if($q->num_rows()>0){
			$r = $q->row();
			header("Location: ".$r->invoice_url);
			die();
		} else {
			echo 'invoice url not found';
		}
	}

}
?>