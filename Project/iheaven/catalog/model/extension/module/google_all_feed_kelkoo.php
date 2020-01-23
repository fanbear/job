<?php

class ModelExtensionModuleGoogleAllFeedKelkoo extends ModelExtensionModuleGoogleAllFeed
{
    public function process_elements($feed_configuration, $elements, $element_ids)
    {
//        die(var_dump($elements));
        $tags = array(
            //mandatory fields
            'offer-id' => 'product_identificator',
            'title' => 'name',
            'product_url' => function ($product) {
                return $product['product_link'];
            },
            'landing-page-url' => function ($product) {
                $arrURL = explode('/', $product['product_link']);
                $arrURL = array_slice($arrURL, 0, 3);
                $url = implode('/', $arrURL);
                return $url;
            },
            'price' => 'price_formatted',
            'brand' => 'manufacturer',
            'description' => function ($product) {
                return $this->format_xml_description($product['description'], 5000);
            },
            'image-url' => 'image_link',
            'ean' => 'ean',
            'availability' => 'quantity',
            'delivery-cost' => function($product) use ($feed_configuration){
                $value = $this->feed['profile']['google_all_feed_config_exclusive_kelkoo_shipping_cost_default'];
                return $value == '' ? '0' : $value;
            },
            'mpn' => 'mpn',

            //not mandatory
            'merchant-category' => 'last_category_tree',
            'sku' => function ($product) {
                return ($product['sku'] != '') ? $this->format_xml_value($product['sku']) : null;
            },
            'currency' => 'currency_code',
            'image-url-2' => function ($product) {
                $imgs = $product['additional_images_link'];
                return (count($imgs) > 0) ? $imgs[0] : null;
            },
            'image-url-3' => function ($product) {
                $imgs = $product['additional_images_link'];
                return (count($imgs) > 1) ? $imgs[1] : null;
            },
            'image-url-4' => function ($product) {
                $imgs = $product['additional_images_link'];
                return (count($imgs) > 2) ? $imgs[2] : null;
            }

        );

//        die(var_dump($this->feed));
        $feed_elements = $this->elementsToFeed($elements, $tags);

        $header = '<?xml version="1.0" encoding="UTF-8" ?>' . "\n";
        $header .= '<products>' . "\n";

        $footer = '</products>' . "\n";

        return array(
            'header' => $header,
            'elements' => $feed_elements,
            'footer' => $footer,
            'node' => 'product'
        );
    }
}

?>