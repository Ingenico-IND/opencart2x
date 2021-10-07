<?php

class ControllerCustomVerification extends Controller{ 
    protected $data = array();
    public function index(){
        
        $this->load->language('custom/verification');
        $this->document->setTitle($this->language->get('heading_title'));

        $data['heading_title'] = $this->language->get('heading_title');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('order_title'),
            'href'      => $this->url->link('sale/order', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('custom/verification', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->load->model('payment/Worldline');

        $merchant_details = $this->model_payment_Worldline->get();
        
        $data['mrc_code'] = $merchant_details[0]['merchant_code'];
        //$data['currency'] = $this->currency->getCode();
        $this->load->model('sale/order');
        
        $query = $this->db->query("SELECT order_id FROM " . DB_PREFIX . "order ORDER BY 1 DESC LIMIT 0,1");
       $order_info =  $this->model_sale_order->getOrder($query->rows[0]);
       $data['currency'] = $order_info['currency_code'];

     if($data['currency']==''){
        $data['currency']= 'INR';
     }
        $merchantTxnRefNumber = null; 
        $date = null;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');    

        $this->response->setOutput($this->load->view('custom/verification.tpl', $data));
    }
}
?>