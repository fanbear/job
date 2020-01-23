<?php
class ModelExtensionModuleGoogleAllFeedCompariRo extends ModelExtensionModuleGoogleAllFeed {
    public function process_elements($feed_configuration, $elements, $element_ids) {
        $tags = array(
            'identifier' => 'product_identificator',
            'manufacturer' => 'manufacturer',
            'name' => 'name',
            'category' => 'last_category_tree',
            'product_url' => 'product_link',
            'price' => function($product){
                return $product['price_formatted'].' '.$product['currency_code'];
            },
            'image_url' => 'image_link',
            'image_url_2' => function($product){
                return array_slice($product['additional_images_link'], 0, 1);
            },
            'image_url_3' => function($product){
                return array_slice($product['additional_images_link'], 1, 1);
            },
            'description' => function($product){
                return $this->format_xml_description($product['description'], 5000);
            },
            'productid' => 'product_identificator',
//            'Delivery_Time',
//            'Delivery_Cost',
            'EAN_code' => 'ean',
//            'MaxCPCMultiplier',
//            'net_price',
//            'Color',
//            'Size',
//            'GroupId',

        );


        $header  = '<?xml version="1.0" encoding="UTF-8" ?>'."\n";
        $header .= '<products>'."\n";

        $footer = '</products>';

        return array(
            'header' => $header,
            'elements' => $this->elementsToFeed($elements, $tags),
            'footer' => $footer,
            'node' => 'product'
        );
    }
}
?>