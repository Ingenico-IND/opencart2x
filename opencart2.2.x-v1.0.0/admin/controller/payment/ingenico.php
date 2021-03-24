<?php
class ControllerPaymentIngenico extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('payment/ingenico');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
        $this->load->model('payment/ingenico');

        $merchant_details = $this->model_payment_ingenico->get();
        $data['error_warning'] = array();

		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
		    if(count($this->validate()) == 0){
    		    $this->model_setting_setting->editSetting('ingenico', $this->request->post);
    		    $this->session->data['success'] = $this->language->get('text_success');

    		    if(is_array($merchant_details) && !isset($merchant_details[0])){
    		        $response = $this->model_payment_ingenico->add($this->request->post);
    		    }else{
    		        $response = $this->model_payment_ingenico->edit($this->request->post);
    		    }

    		    if($response === true){
    			    $this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
    		    }
		    }else if (isset($this->error['warning'])) {
		        $data['error_warning'] = $this->error['warning'];
		    }
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_for_ingenico'] = $this->language->get('text_for_ingenico');

		//values from text box
		$data['request_type_T'] = $this->language->get('request_type_T');
		$data['verification_enabled_Y'] = $this->language->get('verification_enabled_Y');
		$data['verification_enabled_N'] = $this->language->get('verification_enabled_N');
		$data['verification_type_S'] = $this->language->get('verification_type_S');
		$data['verification_type_O'] = $this->language->get('verification_type_O');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['merchant_code'] = $this->language->get('merchant_code');
        $data['verification_enabled'] = $this->language->get('verification_enabled');
        $data['verification_type'] = $this->language->get('verification_type');
        $data['key'] = $this->language->get('key');
        $data['verification_enabled'] = $this->language->get('verification_enabled');
        $data['verification_type'] = $this->language->get('verification_type');
        $data['amount'] = $this->language->get('amount');
        $data['bank_code'] = $this->language->get('bank_code');
        $data['webservice_locator'] = $this->language->get('webservice_locator');
        $data['status'] = $this->language->get('status');
        $data['sort_order'] = $this->language->get('sort_order');
        $data['merchant_scheme_code'] = $this->language->get('merchant_scheme_code');

        $this->load->model('localisation/order_status');
        $data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();


		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_ip_add'] = $this->language->get('button_ip_add');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_payment'),
			'href' => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('payment/amazon_checkout', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('payment/ingenico', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token']);

	    if (isset($this->request->post['ingenico_merchant_code'])) {
		    $data['ingenico_merchant_code'] = $this->request->post['ingenico_merchant_code'];
		} else {
		    $data['ingenico_merchant_code'] = $this->config->get('ingenico_merchant_code');
		}
	

		if (isset($this->request->post['ingenico_key'])) {
		    $data['ingenico_key'] = $this->request->post['ingenico_key'];
		} else {
		    $data['ingenico_key'] = $this->config->get('ingenico_key');
		}
		

		if (isset($this->request->post['ingenico_webservice_locator'])) {
		    $data['ingenico_webservice_locator'] = $this->request->post['ingenico_webservice_locator'];
		} else {
		    $data['ingenico_webservice_locator'] = $this->config->get('ingenico_webservice_locator');
		}


		if (isset($this->request->post['ingenico_status'])) {
		    $data['ingenico_status'] = $this->request->post['ingenico_status'];
		} else {
		    $data['ingenico_status'] = $this->config->get('ingenico_status');
		}

		if (isset($this->request->post['ingenico_sort_order'])) {
		    $data['ingenico_sort_order'] = $this->request->post['ingenico_sort_order'];
		} else {
		    $data['ingenico_sort_order'] = $this->config->get('ingenico_sort_order');
		}

		if (isset($this->request->post['ingenico_primary_color_code'])) {
			$data['ingenico_primary_color_code'] = $this->request->post['ingenico_primary_color_code'];
		} else {
			$data['ingenico_primary_color_code'] = $this->config->get('ingenico_primary_color_code');
		}

		if (isset($this->request->post['ingenico_secondary_color_code'])) {
			$data['ingenico_secondary_color_code'] = $this->request->post['ingenico_secondary_color_code'];
		} else {
			$data['ingenico_secondary_color_code'] = $this->config->get('ingenico_secondary_color_code');
		}

		if (isset($this->request->post['ingenico_button_color_code_1'])) {
			$data['ingenico_button_color_code_1'] = $this->request->post['ingenico_button_color_code_1'];
		} else {
			$data['ingenico_button_color_code_1'] = $this->config->get('ingenico_button_color_code_1');
		}

		if (isset($this->request->post['ingenico_button_color_code_2'])) {
			$data['ingenico_button_color_code_2'] = $this->request->post['ingenico_button_color_code_2'];
		} else {
			$data['ingenico_button_color_code_2'] = $this->config->get('ingenico_button_color_code_2');
		}

		if (isset($this->request->post['ingenico_merchant_logo_url'])) {
			$data['ingenico_merchant_logo_url'] = $this->request->post['ingenico_merchant_logo_url'];
		} else {
			$data['ingenico_merchant_logo_url'] = $this->config->get('ingenico_merchant_logo_url');
		}

		if (isset($this->request->post['ingenico_enableExpressPay'])) {
			$data['ingenico_enableExpressPay'] = $this->request->post['ingenico_enableExpressPay'];
		} else {
			$data['ingenico_enableExpressPay'] = $this->config->get('ingenico_enableExpressPay');
		}

		if (isset($this->request->post['ingenico_separateCardMode'])) {
			$data['ingenico_separateCardMode'] = $this->request->post['ingenico_separateCardMode'];
		} else {
			$data['ingenico_separateCardMode'] = $this->config->get('ingenico_separateCardMode');
		}

		if (isset($this->request->post['ingenico_enableNewWindowFlow'])) {
			$data['ingenico_enableNewWindowFlow'] = $this->request->post['ingenico_enableNewWindowFlow'];
		} else {
			$data['ingenico_enableNewWindowFlow'] = $this->config->get('ingenico_enableNewWindowFlow');
		}

		if (isset($this->request->post['ingenico_merchantMsg'])) {
			$data['ingenico_merchantMsg'] = $this->request->post['ingenico_merchantMsg'];
		} else {
			$data['ingenico_merchantMsg'] = $this->config->get('ingenico_merchantMsg');
		}

		if (isset($this->request->post['ingenico_disclaimerMsg'])) {
			$data['ingenico_disclaimerMsg'] = $this->request->post['ingenico_disclaimerMsg'];
		} else {
			$data['ingenico_disclaimerMsg'] = $this->config->get('ingenico_disclaimerMsg');
		}

		if (isset($this->request->post['ingenico_paymentMode'])) {
			$data['ingenico_paymentMode'] = $this->request->post['ingenico_paymentMode'];
		} else {
			$data['ingenico_paymentMode'] = $this->config->get('ingenico_paymentMode');
		}

		if (isset($this->request->post['ingenico_paymentModeOrder'])) {
			$data['ingenico_paymentModeOrder'] = $this->request->post['ingenico_paymentModeOrder'];
		} else {
			$data['ingenico_paymentModeOrder'] = $this->config->get('ingenico_paymentModeOrder');
		}

		if (isset($this->request->post['ingenico_enableInstrumentDeRegistration'])) {
			$data['ingenico_enableInstrumentDeRegistration'] = $this->request->post['ingenico_enableInstrumentDeRegistration'];
		} else {
			$data['ingenico_enableInstrumentDeRegistration'] = $this->config->get('ingenico_enableInstrumentDeRegistration');
		}

		if (isset($this->request->post['ingenico_txnType'])) {
			$data['ingenico_txnType'] = $this->request->post['ingenico_txnType'];
		} else {
			$data['ingenico_txnType'] = $this->config->get('ingenico_txnType');
		}

		if (isset($this->request->post['ingenico_hideSavedInstruments'])) {
			$data['ingenico_hideSavedInstruments'] = $this->request->post['ingenico_hideSavedInstruments'];
		} else {
			$data['ingenico_hideSavedInstruments'] = $this->config->get('ingenico_hideSavedInstruments');
		}

		if (isset($this->request->post['ingenico_saveInstrument'])) {
			$data['ingenico_saveInstrument'] = $this->request->post['ingenico_saveInstrument'];
		} else {
			$data['ingenico_saveInstrument'] = $this->config->get('ingenico_saveInstrument');
		}

		if (isset($this->request->post['ingenico_displayErrorMessageOnPopup'])) {
			$data['ingenico_displayErrorMessageOnPopup'] = $this->request->post['ingenico_displayErrorMessageOnPopup'];
		} else {
			$data['ingenico_displayErrorMessageOnPopup'] = $this->config->get('ingenico_displayErrorMessageOnPopup');
		}

		if (isset($this->request->post['ingenico_embedPaymentGatewayOnPage'])) {
			$data['ingenico_embedPaymentGatewayOnPage'] = $this->request->post['ingenico_embedPaymentGatewayOnPage'];
		} else {
			$data['ingenico_embedPaymentGatewayOnPage'] = $this->config->get('ingenico_embedPaymentGatewayOnPage');
		}

		if (isset($this->request->post['ingenico_merchant_scheme_code'])) {
		    $data['ingenico_merchant_scheme_code'] = $this->request->post['ingenico_merchant_scheme_code'];
		} else {
		    $data['ingenico_merchant_scheme_code'] = $this->config->get('ingenico_merchant_scheme_code');
		}

		$data['button_colours'] = array(
			'orange' => $this->language->get('text_orange'),
			'tan'    => $this->language->get('text_tan')
		);

		$data['button_backgrounds'] = array(
			'white' => $this->language->get('text_white'),
			'light' => $this->language->get('text_light'),
			'dark'  => $this->language->get('text_dark'),
		);

		$data['button_sizes'] = array(
			'medium'  => $this->language->get('text_medium'),
			'large'   => $this->language->get('text_large'),
			'x-large' => $this->language->get('text_x_large'),
		);

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['verification'] = $this->url->link('custom/verification', 'token=' . $this->session->data['token'], 'SSL');
		$data['reconciliation'] = $this->url->link('custom/reconciliation', 'token=' . $this->session->data['token'], 'SSL');
		$this->response->setOutput($this->load->view('payment/ingenico.tpl', $data));
	}

	public function install() {
		$this->load->model('payment/ingenico');
		$this->model_payment_ingenico->install();
	}

	public function uninstall() {
		$this->load->model('payment/ingenico');
		$this->model_payment_ingenico->uninstall();
	}

	public function order() {
		$data['order_id'] = $this->request->get['order_id'];
		
		$this->load->model('sale/order');
	
        $query = $this->db->query("SELECT
  		o.comment,
  		DATE(o.date_added) AS mydate
		FROM
  		" . DB_PREFIX . "order_history o
		WHERE o.order_id = '" . $data['order_id'] . "'
  		AND o.order_status_id = '2'
		LIMIT 0, 1;");
            if(isset($query->rows[0]['comment']) != ''){
            $data['status'] = 'success';	
            $data['token'] = $query->rows[0]['comment'];
            $data['date'] = $query->rows[0]['mydate'];
            $data['mcode'] = $this->config->get('ingenico_merchant_code');
            $order_info = $this->model_sale_order->getOrder($data['order_id']);
            $data['currency'] = $order_info['currency_code'];
            $data['amount'] = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
        }else{
        	$data['status'] = 'fail';
        }
        
		return $this->load->view('payment/ingenico_order.tpl', $data);

		
	}

	protected function validate() {
		if (!trim($this->request->post['ingenico_merchant_code'])) {
			$this->error['warning']['merchant_code'] = $this->language->get('error_merchant_code');
		}
		

		if (!trim($this->request->post['ingenico_key'])) {
			$this->error['warning']['access_key'] = $this->language->get('error_key');
		}
		

		if (!trim($this->request->post['ingenico_webservice_locator'])) {
		    $this->error['warning']['access_webservice_locator'] = $this->language->get('error_webservice_locator');
		}
		

		if (!trim($this->request->post['ingenico_sort_order'])) {
		    $this->error['warning']['access_sort_order'] = $this->language->get('error_sort_order');
		}

		if (!trim($this->request->post['ingenico_merchant_scheme_code'])) {
		    $this->error['warning']['merchant_scheme_code'] = $this->language->get('error_merchant_scheme_code');
		}

		return $this->error;
	}
}