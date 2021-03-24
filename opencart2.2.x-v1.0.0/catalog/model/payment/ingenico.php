<?php
class ModelPaymentIngenico extends Model {
    public function getMethod($address, $total) {
        $this->load->language('payment/ingenico');

        if ($total <= 0.00) {
            $status = true;
        } else {
            $status = false;
        }
        $status = true;
        $method_data = array();

        if ($status) {
            $method_data = array(
                'code'       => 'ingenico',
                'title'      => $this->language->get('text_title'),
                'terms'      => '',
                'sort_order' => $this->config->get('ingenico_sort_order')
            );
        }
        return $method_data;
    }

    public function get() {
		    return $this->db->query("SELECT * FROM `" . DB_PREFIX . "ingenico`")->rows;
	}
}