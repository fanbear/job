<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <ul class="breadcrumb text-center" itemscope itemtype="https://schema.org/BreadcrumbList">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
        <?php if($i+1<count($breadcrumbs)) { ?>
        <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><a itemprop="item" href="<?php echo $breadcrumb['href']; ?>"><span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a><meta itemprop="position" content="<?php echo $i+1; ?>" /></li><?php } else { ?><li class="active"><?php echo $breadcrumb['text']; ?></li><?php } ?>
        <?php } ?>
      </ul>
      <?php echo $content_top; ?>
      <h1 class="h2 text-center content-title"><?php echo $heading_title; ?></h1>
      <div class="hr"></div>
      <?php if ((!$moneymaker2_catalog_categories_images_hide&&$thumb)||($moneymaker2_common_categories_icons_enabled&&$category_icon)) { ?>
      <div class="row catalog-thumb">
        <div class="col-sm-12 text-center">
          <?php if ($moneymaker2_catalog_categories_advantages_enabled&&$moneymaker2_categories_advantages_l) { ?>
          <div class="catalog-advantage text-right <?php echo $moneymaker2_categories_advantages_l['style']; ?>" data-toggle="modal" data-target="#infoModal" data-info-title="<?php echo $moneymaker2_categories_advantages_l['name']; ?>" data-info-description="<?php echo $moneymaker2_categories_advantages_l['link']; ?>">
            <span class="text-right"><?php echo $moneymaker2_categories_advantages_l['name']; ?></span>
            <span class="advantage-caret-right"></span>
            <span class="fa-stack fa-lg img-thumbnail">
              <i class="fa fa-circle fa-stack-2x"></i>
              <i class="fa fa-<?php echo $moneymaker2_categories_advantages_l['icon']; ?> fa-stack-1x fa-inverse"></i>
            </span>
          </div>
          <?php } ?>
          <?php if (!$moneymaker2_catalog_categories_images_hide&&$thumb) { ?>
          <img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail<?php if ($moneymaker2_catalog_categories_images_round) { ?> img-circle<?php } ?>" />
          <?php } ?>
          <?php if ($moneymaker2_common_categories_icons_enabled&&$category_icon) { ?>
            <span class="fa-stack fa-2x img-thumbnail">
              <i class="fa fa-circle fa-stack-2x"></i>
              <i class="fa fa-<?php echo $category_icon; ?> fa-stack-1x fa-inverse"></i>
            </span>
          <?php } ?>
          <?php if ($moneymaker2_catalog_categories_advantages_enabled&&$moneymaker2_categories_advantages_r) { ?>
          <div class="catalog-advantage text-left <?php echo $moneymaker2_categories_advantages_r['style']; ?>" data-toggle="modal" data-target="#infoModal" data-info-title="<?php echo $moneymaker2_categories_advantages_r['name']; ?>" data-info-description="<?php echo $moneymaker2_categories_advantages_r['link']; ?>">
            <span class="fa-stack fa-lg img-thumbnail">
              <i class="fa fa-circle fa-stack-2x"></i>
              <i class="fa fa-<?php echo $moneymaker2_categories_advantages_r['icon']; ?> fa-stack-1x fa-inverse"></i>
            </span>
            <span class="advantage-caret-left"></span>
            <span class="text-left"><?php echo $moneymaker2_categories_advantages_r['name']; ?></span>
          </div>
          <?php } else if ($moneymaker2_catalog_categories_advantages_enabled&&$moneymaker2_categories_advantages_l&&!$moneymaker2_categories_advantages_r) { ?>
          <div class="catalog-advantage"></div>
          <?php } ?>
        </div>
      </div>
      <?php } ?>
      <?php if ($description) { ?>
      <div class="row catalog-descr<?php if ($moneymaker2_catalog_categories_move_description) { ?> collapse<?php } ?>">
        <div class="col-sm-12">
          <div>
            <?php echo $description; ?>
          </div>
        </div>
      </div>
      <?php } ?>
      <?php if ($categories) { ?>
      <div class="row catalog-sub">
        <div class="col-sm-12">
          <div class="text-center">
            <?php foreach ($categories as $category) { ?><?php if ($category['thumb']) { ?><div><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive center-block" /><div class="btn btn-sm btn-link"><?php if (isset($category['icon'])&&$category['icon']) { ?><i class="fa fa-fw fa-<?php echo $category['icon']; ?>"></i> <?php } ?><?php echo $category['name']; ?></div></a></div><?php } else { ?><a class="btn btn-sm btn-link" href="<?php echo $category['href']; ?>"><?php if (isset($category['icon'])&&$category['icon']) { ?><i class="fa fa-fw fa-<?php echo $category['icon']; ?>"></i> <?php } ?><?php echo $category['name']; ?></a><?php } ?><?php } ?>
          </div>
        </div>
      </div>
      <?php } ?>
      <?php if (((!$moneymaker2_catalog_categories_images_hide&&$thumb)||($moneymaker2_common_categories_icons_enabled&&$category_icon))||($description&&!$moneymaker2_catalog_categories_move_description)||$categories) { ?>
      <hr class="catalog-hr">
      <?php } ?>
      <?php if ($products) { ?>
      <div class="row limits">
        <div class="col-xs-12 text-center">
          <div class="btn-group text-left">
            <div class="btn-group btn-group-sm dropdown">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <?php echo str_replace(":","",$text_sort); ?><i class="fa fa-fw fa-angle-down"></i>
              </button>
              <ul class="dropdown-menu" id="input-sort">
                <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                <li class="active"><a href="<?php echo $sorts['href']; ?>" rel="nofollow"><?php echo $sorts['text']; ?></a></li>
                <?php } else { ?>
                <li><a href="<?php echo $sorts['href']; ?>" rel="nofollow"><?php echo $sorts['text']; ?></a></li>
                <?php } ?>
                <?php } ?>
              </ul>
            </div>
            <?php if (!$moneymaker2_catalog_layout_switcher_hide) { ?>
            <button type="button" id="list-view" class="btn btn-default btn-sm <?php if ($moneymaker2_catalog_default_view) { ?>active<?php } ?> hidden-xxs" data-toggle="tooltip" data-trigger="hover" data-placement="bottom" title="<?php echo $button_list; ?>"><i class="fa fa-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default btn-sm <?php if (!$moneymaker2_catalog_default_view) { ?>active<?php } ?> hidden-xxs" data-toggle="tooltip" data-trigger="hover" data-placement="bottom" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
            <?php } ?>
            <div class="btn-group btn-group-sm limit-btn-group dropdown">
              <ul class="dropdown-menu pull-right" id="input-limit">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <li class="active"><a href="<?php echo $limits['href']; ?>" rel="nofollow"><small><?php echo $limits['text']; ?></small></a></li>
                <?php $mmr_limit_active = $limits['text']; ?>
                <?php } else { ?>
                <li><a href="<?php echo $limits['href']; ?>" rel="nofollow"><small><?php echo $limits['text']; ?></small></a></li>
                <?php } ?>
                <?php } ?>
              </ul>
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-arrows-v hidden-md hidden-lg"></i> <span class="hidden-xs hidden-sm"><?php echo $text_limit; ?> </span><span><?php echo isset($mmr_limit_active) ? $mmr_limit_active : $limits['text']; ?></span><i class="fa fa-fw fa-angle-down"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
      <div class="row products">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout <?php if ($moneymaker2_catalog_default_view) { ?>product-list<?php } else { ?>product-grid<?php } ?>">
          <div class="product-thumb">
            <div class="image">
              <?php if ($product['stickers']) { ?>
              <div class="stickers">
                <?php foreach ($product['stickers'] as $sticker) { ?>
                  <div class="sticker text-left sticker-<?php echo $sticker['type']; ?>">
                    <span class="fa-stack fa-<?php echo $moneymaker2_stickers_size_catalog; ?>" <?php if (!$moneymaker2_stickers_mode) { ?>data-toggle="tooltip" data-placement="right" title="<?php echo strip_tags($sticker['caption']); ?>"<?php } ?>>
                      <i class="fa fa-circle fa-stack-2x"></i>
                      <i class="fa fa-<?php echo $sticker['icon']; ?> fa-stack-1x fa-inverse"></i>
                    </span><?php if ($moneymaker2_stickers_mode) { ?><div class="tooltip right in"><div class="tooltip-arrow"></div><div class="tooltip-inner"><?php echo $sticker['caption']; ?></div></div><?php } ?>
                  </div>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 5; $i >= 1; $i--) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <i class="fa fa-star"></i>
                <?php } else { ?>
                <i class="fa fa-star active"></i>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
            </div>
            <div>
              <div class="caption">
                <a href="<?php echo $product['href']; ?>"<?php if ($product['special']) { ?> class="text-special"<?php } ?>><?php echo $product['name']; ?></a>
              </div>
              <?php if ($moneymaker2_common_price_detached) { ?>
              <div class="price-detached"><small><?php if ($product['price']) { ?><span class="price text-muted"><?php if (!$product['special']) { ?><?php echo $product['price']; ?><?php } else { ?><span class="price-new"><b><?php echo $product['special']; ?></b></span> <span class="price-old"><?php echo $product['price']; ?></span><?php } ?></span><?php } ?><?php if ($product['tax']) { ?><br /><span class="price-tax text-muted"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span><?php } ?></small></div>
              <?php } ?>
              <div class="btn-group btn-group-sm">
                <?php if (!$moneymaker2_common_buy_hide) { ?>
                <button type="button" data-toggle="tooltip" data-html="true" data-placement="bottom" title="<?php echo $product['addtocart_tooltip']; ?>" class="<?php echo $product['addtocart_class']; ?>" <?php if (!$product['sold']) { ?>onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"<?php } ?>><i class="fa fa-fw fa-shopping-cart"></i> <?php if (!$moneymaker2_common_price_detached&&$product['price']) { ?><span class="price"><?php if (!$product['special']) { ?><?php echo $product['price']; ?><?php } else { ?><span class="price-new"><?php echo $product['special']; ?></span><?php } ?></span><?php } else { ?><?php echo $button_cart; ?><?php } ?></button>
                <?php } ?>
                <?php if ($moneymaker2_modules_quickorder_enabled&&$moneymaker2_modules_quickorder_display_catalog) { ?>
                <div class="<?php echo $product['quickorder_class']; ?>" <?php if (!$product['sold']) { ?>data-toggle="modal" data-target="#orderModal" data-order-mode="catalog" data-order-product-id="<?php echo $product['product_id']; ?>" data-order-title="<?php echo $product['name']; ?>" data-order-img-src="<?php echo $product['thumb']; ?>" data-order-price="<?php if (!$product['special']) { ?><?php echo $product['price']; ?><?php } else { ?><?php echo $product['special']; ?><?php } ?>"<?php } ?>><span data-toggle="tooltip" data-html="true" data-placement="bottom" title="<?php echo $product['quickorder_tooltip']; ?>"><i class="fa fa-fw fa-send"></i></span></div>
                <?php } ?>
                <?php if (!$moneymaker2_common_wishlist_hide) { ?><button type="button" class="btn btn-default" <?php if (!$moneymaker2_common_wishlist_caption) { ?>data-toggle="tooltip" data-placement="bottom" <?php } ?>title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-heart"></i><?php if ($moneymaker2_common_wishlist_caption) { ?> <?php echo $button_wishlist; ?><?php } ?></button><?php } ?>
                <?php if (!$moneymaker2_common_compare_hide) { ?><button type="button" class="btn btn-default" <?php if (!$moneymaker2_common_compare_caption) { ?>data-toggle="tooltip" data-placement="bottom" <?php } ?>title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-area-chart"></i><?php if ($moneymaker2_common_compare_caption) { ?> <?php echo $button_compare; ?><?php } ?></button><?php } ?>
              </div>
              <?php if (!$moneymaker2_common_price_detached&&$product['price']&&$product['tax']) { ?><div class="price-tax"><small class="text-muted"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></small></div><?php } ?>
              <div class="additional"><?php echo $product['stock']; ?> <?php echo $product['code']; ?></div>
              <div class="description"><?php echo $product['description']; ?></div>
            </div>
          </div>
        </div>
        <?php if ($moneymaker2_modules_promo_enabled&&$moneymaker2_modules_promos) { ?>
          <?php foreach ($moneymaker2_modules_promos as $moneymaker2_modules_promo) { ?>
            <?php if ($moneymaker2_modules_promo['sort_order']==$product['sort_order']) { ?>
            <div class="product-layout <?php if ($moneymaker2_catalog_default_view) { ?>product-list<?php } else { ?>product-grid<?php } ?>">
              <div class="product-thumb promo promo-<?php echo $moneymaker2_modules_promo_style; ?>">
                <div class="image">
                  <?php if ($moneymaker2_modules_stickers_promo_enabled) { ?>
                  <div class="stickers">
                    <div class="sticker text-left">
                      <span class="fa-stack fa-<?php echo $moneymaker2_stickers_size_catalog; ?>" <?php if (!$moneymaker2_stickers_mode) { ?>data-toggle="tooltip" data-placement="right" title="<?php echo strip_tags($moneymaker2_modules_stickers_promo_caption); ?>"<?php } ?>>
                      <i class="fa fa-circle fa-stack-2x"></i>
                      <i class="fa fa-<?php echo $moneymaker2_modules_stickers_promo_icon; ?> fa-stack-1x fa-inverse"></i>
                      </span><?php if ($moneymaker2_stickers_mode) { ?><div class="tooltip right in"><div class="tooltip-arrow"></div><div class="tooltip-inner"><?php echo $moneymaker2_modules_stickers_promo_caption; ?></div></div><?php } ?>
                    </div>
                  </div>
                  <?php } ?>
                  <img src="<?php echo $moneymaker2_modules_promo['image']; ?>" alt="<?php echo $moneymaker2_modules_promo['text']; ?>" title="<?php echo $moneymaker2_modules_promo['text']; ?>" class="img-responsive" />
                </div>
                <div>
                  <div class="caption text-<?php echo $moneymaker2_modules_promo_text_style; ?>">
                    <span><?php echo $moneymaker2_modules_promo['text']; ?></span>
                  </div>
                  <?php if ($moneymaker2_common_price_detached) { ?>
                  <div class="price-detached"><small><span class="text-muted"><?php echo $moneymaker2_modules_stickers_promo_caption; ?></span></small></div>
                  <?php } ?>
                  <?php if ($moneymaker2_modules_promo['link']) { ?>
                  <button type="button" class="btn btn-sm btn-<?php echo $moneymaker2_modules_promo_style; ?>" title="<?php echo $moneymaker2_modules_promo['title']; ?>" data-toggle="modal" data-target="#infoModal" data-info-title="<?php echo $moneymaker2_modules_promo['info_title']; ?>" data-info-description="<?php echo $moneymaker2_modules_promo['link']; ?>"><i class="fa fa-fw fa-external-link"></i> <?php echo $moneymaker2_modules_promo['title']; ?></button>
                  <?php } ?>
                  <div class="additional"></div>
                  <div class="description"><?php echo $moneymaker2_modules_promo['description']; ?></div>
                </div>
              </div>
            </div>
            <?php } ?>
          <?php } ?>
        <?php } ?>
        <?php } ?>
      </div>
      <div class="row paginator">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <div class="row">
        <div class="col-sm-12 text-center">
          <p class="h4"><?php echo $text_empty; ?></p>
        </div>
      </div>
      <div class="buttons">
        <div class="text-center"><a href="<?php echo $continue; ?>" class="btn btn-default"><i class="fa fa-fw fa-angle-right"></i><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php if ($moneymaker2_catalog_categories_move_description) { ?>
<script><!--
    $(document).ready(function() {
        $('.catalog-descr').appendTo($('#content'));
        $('.catalog-descr').show();
    });
    //--></script>
<?php } ?>
<?php echo $footer; ?>
