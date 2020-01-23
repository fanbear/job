<?php

class ModelExtensionModuleGoogleAllFeedTrovaprezziIt extends ModelExtensionModuleGoogleAllFeed
{
    public function process_elements($feed_configuration, $elements, $element_ids)
    {
        $tags = array(
            'Name' => 'name',
            'Brand' => 'manufacturer',
            'Description' => function ($product) {
                return $this->format_xml_description($product['description'], 5000);
            },
            'Price' => 'price_formatted',
            'Code' => 'product_identificator',
            'Link' => 'product_link',
            'Stock' => 'quantity',
            'Categories' => 'last_category_tree',
            'Image' => 'image_link',
            'PartNumber' => function ($product) {
                return ($product['sku'] != '') ? $this->format_xml_value($product['sku']) : null;
            },
            'EanCode' => function ($product) {
                return ($product['ean'] != '') ? $this->format_xml_value($product['ean']) : null;
            },
            'Image2' => function ($product) {
                $imgs = $product['additional_images_link'];
                return (count($imgs) > 0) ? $imgs[0] : null;
            },
            'Image3' => function ($product) {
                $imgs = $product['additional_images_link'];
                return (count($imgs) > 0) ? $imgs[0] : null;
            }
        );

//        die(var_dump($this->feed));
        $feed_elements = $this->elementsToFeed($elements, $tags);
        //special tags
        $feed_elements = array_map(function ($item) {
            $value = $this->feed['profile']['google_all_feed_config_exclusive_trovapretzzi_shipping_cost_default'];
            $item['ShippingCost'] = $value == '' ? 0 : $value;
            return $item;
        }, $feed_elements);

        $header = '<?xml version="1.0" encoding="UTF-8" ?>' . "\n";
        $header .= '<Products>' . "\n";

        $footer = '</Products>' . "\n";

        return array(
            'header' => $header,
            'elements' => $feed_elements,
            'footer' => $footer,
            'node' => 'Offer'
        );
    }
}

?>