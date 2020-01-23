<?php  
class ControllerExtensionModulePDQO extends Controller {
    public function index() {
        $this->load->model('setting/setting');
        $data = array();
        $data['t'] = array_merge($data, $this->language->load('extension/module/pdqo'));
        $settings = $this->model_setting_setting->getSetting('pdqo');
        if(isset($settings['pdqo_module']['settings'])) {
            $data['window'] = $settings['pdqo_module']['settings']['window'];
            $data['fields'] = $settings['pdqo_module']['settings']['fields'];

            if($this->customer->isLogged()) {
                $this->load->model('account/customer');
                $customer_data = $this->model_account_customer->getCustomer($this->customer->getId());
                
                $lastname = $this->customer->getLastname();
                $firstname = $this->customer->getFirstname();
                $phone = $this->customer->getTelephone();
                $email = $this->customer->getEmail();

                if(!$lastname) { $lastname = ''; }
                if(!$firstname) { $firstname = ''; }
                if(!$phone) { $phone = ''; }
                if(!$email) { $email = ''; }
                if(!$lastname && !$firstname) { $name = ''; }else{ $name = $lastname . ' ' . $firstname; }

                $data['fields']['name']['value'] = $name;
                $data['fields']['email']['value'] = $email;
                $data['fields']['phone']['value'] = $phone;
                $data['fields']['comment']['value'] = '';
            }else{
                
                if(isset($this->session->data['pdqo_name'])) {
                    $name = $this->session->data['pdqo_name'];
                }else{
                    $name = '';
                }
                if(isset($this->session->data['pdqo_email'])) {
                    $email = $this->session->data['pdqo_email'];
                }else{
                    $email = '';
                }
                if(isset($this->session->data['pdqo_phone'])) {
                    $phone = $this->session->data['pdqo_phone'];
                }else{
                    $phone = '';
                }
                if(isset($this->session->data['pdqo_comment'])) {
                    $comment = $this->session->data['pdqo_comment'];
                }else{
                    $comment = '';
                }
                
                $data['fields']['name']['value'] = $name;
                $data['fields']['email']['value'] = $email;
                $data['fields']['phone']['value'] = $phone;
                $data['fields']['comment']['value'] = $comment;
            }
            
            $data['js'] = $this->parse_js($data);
            
            $tpl = $this->load->view('extension/module/pdqo/default', $data);
            
            $this->response->setOutput($tpl);
        }
    }
    public function pdqo() {
        $this->language->load('checkout/cart');
        $this->load->model('catalog/product');
        $this->load->model('setting/setting');
        
        $json = array();
        
        $settings = $this->model_setting_setting->getSetting('pdqo');
        
        if(!count($settings)) {
            $settings = false;
        }else{
            $settings = $settings['pdqo_module']['settings'];
        }
        
        $json['settings'] = $settings;
        
        if($settings) {
            
            if (isset($this->request->post['product_id'])) {
                $product_id = $this->request->post['product_id'];
            } else {
                $product_id = 0;
            }

            $product_info = $this->model_catalog_product->getProduct($product_id);
            $product_info['href'] = $this->url->link('product/product', 'product_id=' . $product_id);

            $json['product'] = array_merge($json, $product_info);
            
            $options = array();
            
            if ($product_info) {
                if (isset($this->request->post['option'])) {
                    $option = array_filter($this->request->post['option']);
                } else {
                    $option = array();  
                }
                
                $product_options = $this->model_catalog_product->getProductOptions($product_id);

                if(!count($product_options)) {
                    $json['option'] = false;
                }else{
                    $json['option'] = $product_options;
                }
                
                if(isset($option)) {
                    foreach($option as $key => $value) {
                        if(strpos($value['name'], 'option') !== false) {
                            $option_id = explode('option[', $value['name']);
                            $option_id = explode(']', $option_id[1]);
                            $options[$option_id[0]] = $value['value'];
                        }
                    }

                    foreach ($product_options as $product_option) {
                        if ($product_option['required'] && empty($options[$product_option['product_option_id']])) {
                            $json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
                        }
                    }
                }
            }
        }
        $this->response->setOutput(json_encode($json));
    }
    public function update_cart() {
        $key = $this->request->post['key'];
        $qty = $this->request->post['qty'];
        $this->cart->update($key, $qty);
        $total_data = $this->get_cart_totals();
        $cart_total = $total_data['total'];
        $total_data = $total_data;
        $this->response->setOutput(json_encode(array('cart_total' => $cart_total, 'total_data' => $total_data)));
    }
    public function remove_from_cart() {
        $key = $this->request->post['key'];
        $this->cart->remove($key);
        $count_products = $this->cart->countProducts();
        $total_data = $this->get_cart_totals();
        $cart_total = $total_data['total'];
        $total_data = $total_data;
        $this->response->setOutput(json_encode(array('count_products' => $count_products, 'cart_total' => $cart_total, 'total_data' => $total_data)));
    }
    public function get_cart_totals() {
        $order_data = array();

        $order_data['totals'] = array();    // $total_data
        $total = 0;                         // $order_total
        $taxes = $this->cart->getTaxes();

        $this->load->model('extension/extension');

        $sort_order = array();

        $results = $this->model_extension_extension->getExtensions('total');

        foreach ($results as $key => $value) {
            $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
        }

        array_multisort($sort_order, SORT_ASC, $results);

        foreach ($results as $result) {
            if ($this->config->get($result['code'] . '_status')) {
                $this->load->model('extension/total/' . $result['code']);

                $this->{'model_extension_total_' . $result['code']}->getTotal(array('totals' => &$order_data['totals'], 'total' => &$total, 'taxes' => &$taxes));
            }
        }

        $sort_order = array();

        foreach ($order_data['totals'] as $key => $value) {
            $sort_order[$key] = $value['sort_order'];
        }

        array_multisort($sort_order, SORT_ASC, $order_data['totals']);
        
        $totals = array();
        
        foreach ($order_data['totals'] as $result) {
            $totals['totals'][] = array(
                'title' => $result['title'],
                'text'  => $this->currency->format($result['value'], $this->session->data['currency']),
            );
        }
        
        return array('total_data' => $order_data['totals'], 'total' => $total, 'totals' => $totals['totals']);
    }
    public function get_cart() {
        $this->load->model('catalog/product');
        
        $json = array();
        $cart = $this->cart->getProducts();
        
        foreach($cart as $product) {
            if(isset($this->request->post['key']) && $this->request->post['key'] != $product['cart_id']) continue;
            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
            } else {
                $price = false;
            }
            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $product['total'] = $this->currency->format(($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']), $this->session->data['currency']);
            } else {
                $product['total'] = false;
            }
            $product_info = $this->model_catalog_product->getProduct($product['product_id']);
            $product['maximum'] = $product_info['quantity'];
            $product['price'] = $price;
            $json['products'][] = $product;
        }
        $get_totals = $this->get_cart_totals();
        $json['total_data'] = $get_totals;
        
        $this->response->setOutput(json_encode($json));
    }
    public function order() {
        $this->load->model('setting/setting');
        $this->language->load('checkout/checkout');
        $settings = $this->model_setting_setting->getSetting('pdqo');
        $settings = $settings['pdqo_module']['settings'];
        $json = array();
        if(isset($this->request->post['customer']) && count($this->request->post['customer'])) {
            $data = array();
            
            if(isset($this->request->post['customer']['comment'])) {
                $data['comment'] = $this->request->post['customer']['comment'];
            }else{
                $data['comment'] = '';
            }
            
            if($this->customer->isLogged()) {
                $this->load->model('account/customer');
                $customer_data = $this->model_account_customer->getCustomer($this->customer->getId());
                $this->load->model('account/address');
                $payment_address = $this->model_account_address->getAddress($customer_data['address_id']);
                $shipping_address = $this->model_account_address->getAddress($customer_data['address_id']);
                $payment = array(
                    'customer_id' => $customer_data['customer_id'],
                    'firstname' => $customer_data['firstname'],
                    'lastname' => $customer_data['lastname'],
                    'customer_group_id' => $customer_data['customer_group_id'],
                    'email' => $customer_data['email'],
                    'address_id' => $customer_data['address_id'],
                    'store_id' => $customer_data['store_id'],
                    'telephone' => $customer_data['telephone'],
                    'payment_firstname' => $payment_address['firstname'],
                    'payment_lastname' => $payment_address['lastname'],
                    'payment_company' => $payment_address['company'],
                    'payment_address_1' => $payment_address['address_1'],
                    'payment_address_2' => $payment_address['address_2'],
                    'payment_city' => $payment_address['city'],
                    'payment_postcode' => $payment_address['postcode'],
                    'payment_zone' => $payment_address['zone'],
                    'payment_zone_id' => $payment_address['zone_id'],
                    'payment_country' => $payment_address['country'],
                    'payment_country_id' => $payment_address['country_id'],
                    'payment_address_format' => $payment_address['address_format']
                );
                if ($this->cart->hasShipping()) {
                    $shipping = array(
                        'shipping_firstname' => $shipping_address['firstname'],
                        'shipping_lastname' => $shipping_address['lastname'],
                        'shipping_company' => $shipping_address['company'],
                        'shipping_address_1' => $shipping_address['address_1'],
                        'shipping_address_2' => $shipping_address['address_2'],
                        'shipping_city' => $shipping_address['city'],
                        'shipping_postcode' => $shipping_address['postcode'],
                        'shipping_zone' => $shipping_address['zone'],
                        'shipping_zone_id' => $shipping_address['zone_id'],
                        'shipping_country' => $shipping_address['country'],
                        'shipping_country_id' => $shipping_address['country_id'],
                        'shipping_address_format' => $shipping_address['address_format']
                    );
                }
                $data = array_merge($data, $shipping, $payment);
            }else{
                $customer_data = $this->request->post['customer'];
                if(isset($customer_data['name'])) {
                    $this->session->data['pdqo_name'] = $customer_data['name'];
                }
                if(isset($customer_data['phone'])) {
                    $this->session->data['pdqo_phone'] = $customer_data['phone'];
                }
                if(isset($customer_data['email'])) {
                    $this->session->data['pdqo_email'] = $customer_data['email'];
                }
                if(isset($customer_data['comment'])) {
                    $this->session->data['pdqo_comment'] = $customer_data['comment'];
                }
                if(isset($customer_data['email']) && $customer_data['email'] != '') {
                    $email = $customer_data['email'];
                }else{
                    $email = ' ';
                }
                $payment = array(
                    'customer_id' => 0,
                    'customer_group_id' => 0,
                    'firstname' => $customer_data['name'],
                    'lastname' => '',
                    'email' => $email,
                    'telephone' => $customer_data['phone'],
                    'address_id' => 0,
                    'store_id' => 0,
                    'payment_firstname' => '',
                    'payment_lastname' => '',
                    'payment_company' => '',
                    'payment_company_id' => '',
                    'payment_tax_id' => '',
                    'payment_address_1' => '',
                    'payment_address_2' => '',
                    'payment_city' => '',
                    'payment_postcode' => '',
                    'payment_zone' => '',
                    'payment_zone_id' => '',
                    'payment_country' => '',
                    'payment_country_id' => '',
                    'payment_address_format' => ''
                );
                if ($this->cart->hasShipping()) {
                    $shipping = array(
                        'shipping_firstname' => '',
                        'shipping_lastname' => '',
                        'shipping_company' => '',
                        'shipping_company_id' => '',
                        'shipping_tax_id' => '',
                        'shipping_address_1' => '',
                        'shipping_address_2' => '',
                        'shipping_city' => '',
                        'shipping_postcode' => '',
                        'shipping_zone' => '',
                        'shipping_zone_id' => '',
                        'shipping_country' => '',
                        'shipping_country_id' => '',
                        'shipping_address_format' => ''
                    );
                }
                $data = array_merge($data, $shipping, $payment);
            }
            
            $get_totals = $this->get_cart_totals();
            
            $data['fax'] = '';
            
            $data['order_status_id'] = $this->config->get('config_order_status_id');
            $data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
            $data['store_id'] = $this->config->get('config_store_id');
            
            $data['store_name'] = $this->config->get('config_name');
            if ($data['store_id']) {
                $data['store_url'] = $this->config->get('config_url');      
            } else {
                $data['store_url'] = HTTP_SERVER;   
            }
            
            $data['payment_method'] = '';
            $data['payment_code'] = '';
            $data['shipping_method'] = '';
            $data['shipping_code'] = '';
            
            $data['products'] = array();
            
            foreach ($this->cart->getProducts() as $product) {
                $option_data = array();

                foreach ($product['option'] as $option) {
                    $option_data[] = array(
                        'product_option_id'       => $option['product_option_id'],
                        'product_option_value_id' => $option['product_option_value_id'],
                        'option_id'               => $option['option_id'],
                        'option_value_id'         => $option['option_value_id'],
                        'name'                    => $option['name'],
                        'value'                   => $option['value'],
                        'type'                    => $option['type']
                    );
                }

                $data['products'][] = array(
                    'product_id' => $product['product_id'],
                    'name'       => $product['name'],
                    'model'      => $product['model'],
                    'option'     => $option_data,
                    'download'   => $product['download'],
                    'quantity'   => $product['quantity'],
                    'subtract'   => $product['subtract'],
                    'price'      => $product['price'],
                    'total'      => $product['total'],
                    'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
                    'reward'     => $product['reward']
                );
            }
            $data['vouchers'] = array();
            if (!empty($this->session->data['vouchers'])) {
                foreach ($this->session->data['vouchers'] as $voucher) {
                    $data['vouchers'][] = array(
                        'description'      => $voucher['description'],
                        'code'             => substr(md5(mt_rand()), 0, 10),
                        'to_name'          => $voucher['to_name'],
                        'to_email'         => $voucher['to_email'],
                        'from_name'        => $voucher['from_name'],
                        'from_email'       => $voucher['from_email'],
                        'voucher_theme_id' => $voucher['voucher_theme_id'],
                        'message'          => $voucher['message'],                      
                        'amount'           => $voucher['amount']
                    );
                }
            }
            
            $data['totals'] = $get_totals['total_data'];
            $data['total'] = $get_totals['total'];
            
            if (isset($this->request->cookie['tracking'])) {
                $data['tracking'] = $this->request->cookie['tracking'];

                $subtotal = $this->cart->getSubTotal();

                // Affiliate
                $this->load->model('affiliate/affiliate');

                $affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);

                if ($affiliate_info) {
                    $data['affiliate_id'] = $affiliate_info['affiliate_id'];
                    $data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
                } else {
                    $data['affiliate_id'] = 0;
                    $data['commission'] = 0;
                }

                // Marketing
                $this->load->model('checkout/marketing');

                $marketing_info = $this->model_checkout_marketing->getMarketingByCode($this->request->cookie['tracking']);

                if ($marketing_info) {
                    $data['marketing_id'] = $marketing_info['marketing_id'];
                } else {
                    $data['marketing_id'] = 0;
                }
            } else {
                $data['affiliate_id'] = 0;
                $data['commission'] = 0;
                $data['marketing_id'] = 0;
                $data['tracking'] = '';
            }
            
            $data['language_id'] = $this->config->get('config_language_id');
            //$data['currency_id'] = $this->currency->getId();
            // $data['currency_code'] = $this->currency->getCode();
            $data['currency_code'] = $this->session->data['currency'];
            $data['currency_id'] = $this->currency->getId($data['currency_code']);
            $data['currency_value'] = $this->currency->getValue($data['currency_code']);

            $data['ip'] = $this->request->server['REMOTE_ADDR'];
            if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
                $data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR']; 
            } elseif(!empty($this->request->server['HTTP_CLIENT_IP'])) {
                $data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];   
            } else {
                $data['forwarded_ip'] = '';
            }
            if (isset($this->request->server['HTTP_USER_AGENT'])) {
                $data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];    
            } else {
                $data['user_agent'] = '';
            }
            if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
                $data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];  
            } else {
                $data['accept_language'] = '';
            }
            $this->load->model('checkout/order');
            $json['order_id'] = $this->model_checkout_order->addOrder($data);
            $this->model_checkout_order->addOrderHistory($json['order_id'], $data['order_status_id'], $data['comment'], true);
            if($json['order_id']) { $this->cart->clear(); }
            $this->response->setOutput(json_encode($json));
        }
    }
    protected function parse_js($data) {
        $data = array_merge($data, $data);
        
        $patterns = array(
            '{{field_name_status}}',
            '{{field_name_required}}',
            '{{field_phone_status}}',
            '{{field_phone_mask}}',
            '{{field_phone_required}}',
            '{{field_email_status}}',
            '{{field_email_required}}',
            '{{field_comment_status}}',
            '{{field_comment_required}}',
            '{{t_product_title}}',
            '{{t_product_qty}}',
            '{{t_product_price}}',
            '{{t_product_cost}}',
            '{{t_remove}}',
            '{{t_from_cart}}',
            '{{t_order_num}}',
            '{{t_successful_sended}}',
            '{{t_thanks_for_order}}'
        );
        $replacements = array(
            $data['fields']['name']['status'],
            $data['fields']['name']['required'],
            $data['fields']['phone']['status'],
            $data['fields']['phone']['mask'],
            $data['fields']['phone']['required'],
            $data['fields']['email']['status'],
            $data['fields']['email']['required'],
            $data['fields']['comment']['status'],
            $data['fields']['comment']['required'],
            $data['t']['product_title'],
            $data['t']['product_qty'],
            $data['t']['product_price'],
            $data['t']['product_cost'],
            $data['t']['remove'],
            $data['t']['from_cart'],
            $data['t']['order_num'],
            $data['t']['successful_sended'],
            $data['t']['thanks_for_order']
        );
        
        $string = file_get_contents(DIR_APPLICATION . 'view/javascript/pdqo/jquery.pdqo-default.js');
        $replace = preg_replace($patterns, $replacements, $string);
        return '<script>' . $replace . '</script>';   
    }
}
?>