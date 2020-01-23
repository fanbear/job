<?php
class ModelExtensionModuleGoogleAllFeedGoogleReviews extends ModelExtensionModuleGoogleAllFeed {
    public function process_elements($feed_configuration, $elements, $element_ids) {
        $tags = array(
            'review_id' => 'review_id',
            'content' => 'text',
        );

        //<editor-fold desc="Exclusive code to this feed type">
            $special_tags = array(
                'reviewer',
                'review_timestamp',
                'review_url',
                'ratings',
                'products',
                'is_spam',
            );
        //</editor-fold>

        $feed_elmements = array();

        foreach ($elements as $key => $product) {
            $reviews = $this->db->query("SELECT * FROM ".$this->escape_database_table_name('review')." WHERE ".$this->escape_database_field('product_id')." = ".$this->escape_database_value($product['product_id']));

            if(!empty($reviews->rows)) {
                foreach ($reviews->rows as $review) {
                    foreach ($tags as $tag_name => $index) {
                        if(is_numeric($review[$index]) || !empty($review[$index]))
                            $temp[$tag_name] = $this->format_xml_value($review[$index]);
                    }

                    //<editor-fold desc="Exclusive code to this feed type">
                        foreach ($special_tags as $tag_name) {
                            if($tag_name == 'reviewer') {
                                $value = '<name>'.$review['author'].'</name>';
                                if($review['customer_id'])
                                    $value .= '<reviewer_id>'.$review['review_id'].'</reviewer_id>';

                                $temp[$tag_name] = $value;
                                continue;
                            }

                            if($tag_name == 'review_timestamp') {
                                $temp[$tag_name] = date('Y-m-d\TH:i:s\Z', strtotime($review['date_added']));
                                continue;
                            }

                            if($tag_name == 'review_url') {
                                $temp[$tag_name] = $product['product_link'];
                                continue;
                            }

                            if($tag_name == 'ratings') {
                                $temp[$tag_name] = '<overall min="1" max="5">'.$review['rating'].'</overall>';
                                continue;
                            }

                            if($tag_name == 'products') {
                                $value = '<product>';
                                    $value .= '<product_ids>';
                                        if(!empty($product['mpn'])) {
                                            $value .= '<mpns>';
                                                $value .= '<mpn>'.$product['mpn'].'</mpn>';
                                            $value .= '</mpns>';
                                        }
                                        if(!empty($product['sku'])) {
                                            $value .= '<skus>';
                                                $value .= '<sku>'.$product['sku'].'</sku>';
                                            $value .= '</skus>';
                                        }
                                        if(!empty($product['manufacturer'])) {
                                            $value .= '<brands>';
                                                $value .= '<brand>'.$product['manufacturer'].'</brand>';
                                            $value .= '</brands>';
                                        }
                                    $value .= '</product_ids>';
                                    $value .= '<product_name>'.$product['name'].'</product_name>';
                                    $value .= '<product_url>'.$product['product_link'].'</product_url>';
                                $value .= '</product>';
                                $temp[$tag_name] = $value;
                                continue;
                            }

                            if($tag_name == 'is_spam') {
                                $temp[$tag_name] = 'false';
                                continue;
                            }
                        }
                    //</editor-fold>

                    $feed_elmements[] = $temp;
                }
            }
        }

        $header  = '<?xml version="1.0" encoding="UTF-8" ?>'."\n";
        $header .= '<feed xmlns:vc="http://www.w3.org/2007/XMLSchema-versioning" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:noNamespaceSchemaLocation=
 "http://www.google.com/shopping/reviews/schema/product/2.2/product_reviews.xsd">'."\n";
        $header  .= '<version>2.2</version>'."\n";
        $header .= '<aggregator>';
            $header .= '<name>'.$this->config->get('config_name').'</name>';
        $header .= '</aggregator>'."\n";
        $header .= '<publisher>';
            $header .= '<name>'.$this->config->get('config_name').'</name>';
            $header .= '<favicon>'.$this->config->get('config_image').'</favicon>';
        $header .= '</publisher>'."\n";
        $header .= '<reviews>';
        $footer = '</reviews>'."\n";
        $footer .= '</feed>';

        return array(
            'header' => $header,
            'elements' => $feed_elmements,
            'footer' => $footer,
            'node' => 'review'
        );
    }
}
?>