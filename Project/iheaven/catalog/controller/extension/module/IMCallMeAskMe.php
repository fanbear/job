<?php
class ControllerExtensionModuleIMCallMeAskMe extends Controller {
	private $error = array(); 

	/////////////////////////////////////////
	// Основные экшены
	/////////////////////////////////////////

	// Получить настройки
	public function getPopup()
	{
		$this->load->model('extension/module/IMCallMeAskMe');
		
		$data['lang_settings'] = $this->model_extension_module_IMCallMeAskMe->getSettings();
		
		$this->load->model('localisation/language');
		$langs = $this->model_localisation_language->getLanguages();
		
		$data['language_id'] = $langs[$this->session->data['language']]['language_id'];

		$this->load->model('setting/setting');

		$template = 'extension/module/IMCallMeAskMe';
		$this->response->setOutput($this->load->view($template, $data));
	}

	// Отсылка почты, если необходимо
	protected function sendEmailAndSetStat($settings, $post, &$json, $lang_id)
	{
		try
		{
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

	        $mail->setTo($settings['admin_email']);
	        $mail->setFrom($this->config->get('config_email'));
	        $mail->setSender($this->config->get('config_name'));
	        $mail->setSubject(html_entity_decode(
	        	$this->config->get('config_name')
	        		. ' (' . $this->config->get('config_url') . ') '
	        		. ' - Заказ звонка ' ,
	        	ENT_QUOTES, 
	        	'UTF-8')
	        );
	        $sended_message = html_entity_decode(
	        	'Здравствуйте, ' 
	        		. '<br/><br/>'
	        		. 'С сайта "' . $this->config->get('config_name')
	        		. '" (' . $this->config->get('config_url') . ') '
	        		. ' поступила заявка.'
	        		. '<br/><br/>'
	        		. 'Имя: ' . strip_tags(empty($post['name']) ? '' : $post['name'])
	        		. '<br/><br/>'
	        		. 'Почта: ' . strip_tags(empty($post['email']) ? '' : $post['email'])
	        		. '<br/><br/>'
	        		. 'Телефон: ' . strip_tags(empty($post['tel']) ? '' : $post['tel'])
	        		. '<br/><br/>'
	        		. 'utm_source: ' . strip_tags(empty($post['utm_source']) ? '' : $post['utm_source'])
	        		. '<br/><br/>'
	        		. 'utm_medium: ' . strip_tags(empty($post['utm_medium']) ? '' : $post['utm_medium'])
	        		. '<br/><br/>'
	        		. 'utm_campaign: ' . strip_tags(empty($post['utm_campaign']) ? '' : $post['utm_campaign'])
	        		. '<br/><br/>'
	        		. 'utm_content: ' . strip_tags(empty($post['utm_content']) ? '' : $post['utm_content'])
	        		. '<br/><br/>'
	        		. 'utm_term: ' . strip_tags(empty($post['utm_term']) ? '' : $post['utm_term'])
	        		. '<br/><br/>'
	        		. 'Сообщение: ' 
	        			. '<br/>'
	        			. '------------------------------'
	        			. '<br/>'
			        		. strip_tags(empty($post['text']) ? '' : $post['text'])
	        			. '<br/>'
	        			. '------------------------------'
	        			. '<br/>'
	        		. '<br/>'
	        		. 'Url страницы: ' . urldecode(empty($post['url']) ? '' : $post['url'])
	        		. '<br/><br/>'
	        		. 'С уважением, <br/>Cайт ' . $this->config->get('config_name')
	        	, 
	        	ENT_QUOTES, 
	        	'UTF-8'
	        );
	        
	        $mail->setHtml($sended_message);
	        
	        // Сохраняем статистику
			$this->load->model('extension/module/IMCallMeAskMe');
			$this->model_extension_module_IMCallMeAskMe->insertStat($lang_id, $post, $sended_message);

			if (trim($settings['admin_email']) == '')
				return;

	        $mail->send();
		}
		catch(Exception $e)
		{
			$json['error'] = true;
			$json['email_send'] = $e->getMessage();
		}
	}

	// Получение значения из поста
	private function getPostValue($name, $default = '') {
		return (isset($this->request->post[$name]) ? $this->request->post[$name] : $default);
	}

	// Отправка сообщения
	public function sendMessage() 
	{
		$this->load->model('extension/module/IMCallMeAskMe');
		$this->load->model('localisation/language');
		$langs = $this->model_localisation_language->getLanguages();
		
		// Получаем текущий язык
		$lang_id = $langs[$this->session->data['language']]['language_id'];
		
		// Получаем эффективный набор настроек
		$settings = $this->model_extension_module_IMCallMeAskMe->getEffSettings($lang_id);

		$json = array(
			'error' => false,
			'messages' => array(),
			'complete' => $settings['complete_send']
		);
		
		// Проверяем данные из поста
		$post = array(
			'url' => $this->getPostValue('url'),
			'name' => $this->getPostValue('name'),
			'email' => $this->getPostValue('email'),
			'tel' => $this->getPostValue('tel'),
			'text' => $this->getPostValue('text'),
			'utm_source' => $this->getPostValue('utm_source'),
			'utm_medium' => $this->getPostValue('utm_medium'),
			'utm_campaign' => $this->getPostValue('utm_campaign'),
			'utm_content' => $this->getPostValue('utm_content'),
			'utm_term' => $this->getPostValue('utm_term')
		);
		
		// Требуется ввод имени
		if (('' . $settings['name_req']) == '1' && ('' . $settings['name_inc']) == '1') 
		{
			if (trim($post['name']) == '')
			{
				$json['error'] = true;
				$json['messages']['name'] = true;
			}
		}

		// Требуется ввод сообщения
		if (('' . $settings['text_req']) == '1' && ('' . $settings['text_inc']) == '1') 
		{
			if (trim($post['text']) == '')
			{
				$json['error'] = true;
				$json['messages']['text'] = true;
			}
		}

		// Требуется ввод почты
		if (('' . $settings['email_req']) == '1' && ('' . $settings['email_inc']) == '1') 
		{
			if (trim($post['email']) == '')
			{
				$json['error'] = true;
				$json['messages']['email'] = true;
			}
			else if (isset($post['email']) && !empty($post['email'])) 
			{
				if (!preg_match("/.+@.+\..+/i", $post['email'])) {
					$json['error'] = true;
					$json['messages']['email'] = true;
		        }
			}
		}

		// Требуется ввод телефона
		if (('' . $settings['tel_req']) == '1' && ('' . $settings['tel_inc']) == '1') 
		{
			if (trim($post['tel']) == '')
			{
				$json['error'] = true;
				$json['messages']['tel'] = true;
			}
			else if (isset($post['tel']) && !empty($post['tel'])) 
			{
				if (!preg_match("/^((8|\+7|\+38)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/", $post['tel'])) {
					$json['error'] = true;
					$json['messages']['tel'] = true;
		        }
			}
		}
		
		// Отсылка почты
		if (!$json['error']) {
			$this->sendEmailAndSetStat($settings, $post, $json, $lang_id);
		}
		
		$this->response->setOutput(json_encode($json));
	}
}
