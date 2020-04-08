<?php
// 
require_once(DOCUMENTROOT.'/assets/libs/SmartyBC.class.php');
// require DOCUMENTROOT.'/vendor/autoload.php';
require 'vendor/autoload.php';

// use Spipu\Html2Pdf\Html2Pdf;
use Dompdf\Dompdf;
// use 

class MY_Controller extends CI_Controller{
    
    public $smarty;
    public $bahasa;
    public $logo;
    public $settings;
    public $rest_client; 
            
    function __construct() {
        parent::__construct();
        
        $this->smarty = new SmartyBC();
        $this->dompdf = new Dompdf();

        $this->settings = $this->settings();

        $this->load->helper('text');
        
        $this->smarty->template_dir = DOCUMENTROOT.'/assets/template/templates/';
        $this->smarty->compile_dir = DOCUMENTROOT.'/assets/template/templates_c/';
        $this->smarty->config_dir = DOCUMENTROOT.'/assets/template/configs/';
        $this->smarty->cache_dir = DOCUMENTROOT.'/assets/template/cache/';
        
        $this->smarty->assign('assets_url',$this->assets_url());
        $this->smarty->assign('site_url',  site_url());
        $this->smarty->assign('base_url',  base_url());
        $this->smarty->assign('logged',  $this->session->userdata('logged'));
        $this->smarty->assign('user_type_id',  $this->session->userdata('user_type_id'));
        $this->smarty->assign('dt_sess',  $_SESSION);
        $this->smarty->assign('year_now',  date('Y'));
        $this->smarty->assign('settings',$this->settings);
        
        $this->smarty->assign('site_title',$this->settings['site_title']);
        $this->smarty->assign('site_keywords',$this->settings['site_keywords']);
        $this->smarty->assign('site_description',$this->settings['site_description']);

        $this->smarty->assign('dir_app',DIR_APP);
        $this->smarty->assign('slideshow',false);
        $this->smarty->assign('footer_display','display:block;');
        // $this->smarty->assign('home_opt',"class='image-bg1' style='margin-top:-40px;' ");
        $this->smarty->assign('home_opt',null);

        $this->smarty->assign('user_type_id',$this->session->userdata('user_type_id'));

        if($this->session->userdata('user_type_id')==1){
            $this->smarty->assign('header_tpl','admin_header.tpl');
            // $this->smarty->assign('footer_display','display:none;');

        } else {
            $this->smarty->assign('header_tpl','header.tpl');
            if($this->session->userdata('user')!='') {
                // echo $this->session->userdata('user_type_id'); die;
                $q = $this->db->query("select firstname,lastname from insured where user_id = ".$this->session->userdata('user_id')." ")->row();
                $this->smarty->assign('fullname',$q->firstname.' '.$q->lastname);    
            } else {
                 $this->smarty->assign('fullname',null);
            }
        }

        $this->rest_client = new GuzzleHttp\Client(['base_uri' =>API_INTERNAL,'curl' => array( CURLOPT_SSL_VERIFYPEER => false ,CURLOPT_SSL_VERIFYHOST=>FALSE),'header'=>array('Accept' => 'application/json')]);

        $this->load->model('m_news');
        $this->smarty->assign('footer_news', $this->m_news->get_news(4));   
    }

    // function send_sms($number,$content){
    //     $curl = curl_init();

    //     curl_setopt_array($curl, array(
    //       CURLOPT_URL => "http://sms.senusa.id/send",
    //       CURLOPT_RETURNTRANSFER => true,
    //       CURLOPT_ENCODING => "",
    //       CURLOPT_MAXREDIRS => 10,
    //       CURLOPT_TIMEOUT => 30,
    //       CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    //       CURLOPT_CUSTOMREQUEST => "POST",
    //       CURLOPT_POSTFIELDS => "account_code=JSNDTRVL&destination=".$number."&content=".$content,
    //       CURLOPT_HTTPHEADER => array(
    //         "Content-Type: application/x-www-form-urlencoded",
    //         "Postman-Token: 7ae6114a-2ca2-454b-8aba-d2f38eb772af",
    //         "cache-control: no-cache"
    //       ),
    //     ));

    //     $response = curl_exec($curl);
    //     $err = curl_error($curl);

    //     curl_close($curl);

    //     if ($err) {
    //       // echo "cURL Error #:" . $err;
    //     } else {
    //       // echo $response;
    //     }
    // }

    function settings(){
        $q = $this->db->get('settings');
        return $q->result_array()[0];
    }

    function assets_url()
    {
        return base_url().'/assets/tpl/';
    }

    public function logout_session()
    {
        // print_r($this->);
        $userID = $this->session->userdata('userID');
        $accessToken = $this->session->userdata('userID');
        $token = date("Y-m-d\TH:i:s.uP");
        
        $request = $this->rest_client->post('user_session/logout_session',[
            'form_params'=>[
                'userID'=>$userID,
                'accessToken'=>$accessToken,
                'token'=>$token,
                // 'securityCode'=>$securityCode
            ]
        ]);

        $respone = json_decode($request->getBody());
        
        if($respone->status=="SUCCESS"){
            $this->session->sess_destroy();
            // redirect('login');  
            
        }else{
            redirect('logout');
        }
        
    }
}
?>
