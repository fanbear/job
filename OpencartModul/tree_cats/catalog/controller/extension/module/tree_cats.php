<?php
class ControllerExtensionModuleTreeCats extends Controller {

    protected function debug($data){
        echo '<pre>' . print_r($data, 1) . '</pre>';
    }

	public function index() {
		$this->load->language('extension/module/tree_cats');
		$data['heading_title'] = $this->language->get('heading_title');

		$this->document->addScript('catalog/view/javascript/dcaccordion/jquery.cookie.js');
		$this->document->addScript('catalog/view/javascript/dcaccordion/jquery.accordion.js');

        if (isset($this->request->get['path'])) {
            $parts = explode('_', (string)$this->request->get['path']);
        } else {
            $parts = array();
        }

        if(!empty($parts)){
            $data['active'] = end($parts);
        }else{
            $data['active'] = 0;
        }

        $this->load->model('catalog/tree_cats');

        $data['categories'] = array();

        $categories = $this->model_catalog_tree_cats->getTreeCats();
        foreach($categories as $id => $category){
            $categories[$id]['href'] = $this->url->link('product/category', 'path=' . $category['category_id']);
        }

        $data['categories_tree'] = $this->model_catalog_tree_cats->getMapTree($categories);

        return $this->load->view('extension/module/tree_cats', $data);
	}
}