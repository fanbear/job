<?php
class ControllerExtensionModuleCallback extends Controller {
	public function index() {
			$this->load->language('extension/module/callback');
			$data['heading_title'] = $this->language->get('heading_title');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_phone'] = $this->language->get('entry_phone');
			$data['entry_submit'] = $this->language->get('entry_submit');
			$data['entry_error'] = $this->language->get('entry_error');
			$data['entry_ok'] = $this->language->get('entry_ok');

			return $this->load->view('extension/module/callback', $data);
			
	}
}