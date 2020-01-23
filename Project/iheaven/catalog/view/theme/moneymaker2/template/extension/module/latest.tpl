<p class="h2"><?php echo $heading_title; ?></p>
<div class="row">
  <?php if ($moneymaker2_modules_latest_carousel) { ?>
  <div class="owl-carousel owl-moneymaker2 owl-moneymaker2-products owl-moneymaker2-products-latest">
  <?php } ?>
  <?php foreach ($products as $product) { ?>
  <div class="product-layout product-grid">
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
          <button type="button" data-toggle="tooltip" data-html="true" data-placement="bottom" title="<?php echo $product['addtocart_tooltip']; ?>" class="<?php echo $product['addtocart_class']; ?>" <?php if (!$product['sold']) { ?>onclick="cart.add('<?php echo $product['product_id']; ?>');"<?php } ?>><i class="fa fa-fw fa-shopping-cart"></i> <?php if (!$moneymaker2_common_price_detached&&$product['price']) { ?><span class="price"><?php if (!$product['special']) { ?><?php echo $product['price']; ?><?php } else { ?><span class="price-new"><?php echo $product['special']; ?></span><?php } ?></span><?php } else { ?><?php echo $button_cart; ?><?php } ?></button>
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
  <?php } ?>
  <?php if ($moneymaker2_modules_latest_carousel) { ?>
  </div>
  <?php } ?>
</div>
<?php if ($moneymaker2_modules_latest_carousel) { ?>
<script><!--
  $(".col-sm-3 > div > .owl-moneymaker2-products-latest").each(function(){
    $(this).owlCarousel({
      itemsCustom : [[0, 1], [768, 1], [992, 1], [1200, 1]],
      navigation: true,
      navigationText: ['', ''],
      pagination: true,
    <?php if ($moneymaker2_modules_latest_carousel_autoplay) { ?>
      autoPlay: true,
      stopOnHover: true,
      autoPlay: 3500,
    <?php } ?>
    });
  });
  $(".col-sm-6 > div > .owl-moneymaker2-products-latest").each(function(){
    $(this).owlCarousel({
      itemsCustom : [[0, 1], [768, 1], [992, 2], [1200, 2], [1583, 3]],
      navigation: true,
      navigationText: ['', ''],
      pagination: true,
    <?php if ($moneymaker2_modules_latest_carousel_autoplay) { ?>
      autoPlay: true,
      stopOnHover: true,
      autoPlay: 3500,
    <?php } ?>
    });
  });
  $(".col-sm-9 > div > .owl-moneymaker2-products-latest").each(function(){
    $(this).owlCarousel({
      itemsCustom : [[0, 1], [561, 2], [992, 3], [1200, 3], [1583, 4]],
      navigation: true,
      navigationText: ['', ''],
      pagination: true,
    <?php if ($moneymaker2_modules_latest_carousel_autoplay) { ?>
      autoPlay: true,
      stopOnHover: true,
      autoPlay: 3500,
    <?php } ?>
    });
  });
  $(".col-sm-12 > div > .owl-moneymaker2-products-latest").each(function(){
    $(this).owlCarousel({
      itemsCustom : [[0, 1], [561, 2], [768, 3], [992, 4], [1200, 4], [1583, 5]],
      navigation: true,
      navigationText: ['', ''],
      pagination: true,
    <?php if ($moneymaker2_modules_latest_carousel_autoplay) { ?>
      autoPlay: true,
      stopOnHover: true,
      autoPlay: 3500,
    <?php } ?>
    });
  });
//--></script>
<?php } ?>