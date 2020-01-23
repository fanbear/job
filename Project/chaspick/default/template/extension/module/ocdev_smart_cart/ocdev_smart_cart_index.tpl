<div id="smca-modal-body">
  <script type="text/javascript" src="catalog/view/javascript/ocdev_smart_cart/ocdev_smart_cart.js"></script>
  <div class="modal-heading">
    <?php echo $heading_title; ?>
    <span class="modal-close" onclick="$.magnificPopup.close();"></span>
  </div>
  <div class="modal-body" id="check-data">
    <div id="smca-modal-data">
      <?php if ($products) { ?>
        <!-- CART PRODUCTS -->
        <?php if ($error_stock) { ?>
        <div class="alert alert-danger"><?php echo $error_stock; ?>
          <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>

        <div class="product-table-cart">
          <div class="product-table-heading">
            <div class="remove"><?php echo $column_remove; ?></div>
            <div class="name"><?php echo $column_name; ?></div>
            <div class="price"><?php echo $column_price; ?></div>
            <div class="quantity"><?php echo $column_quantity; ?></div>
            <div class="total"><?php echo $column_total; ?></div>
          </div>
          <div class="product-table-body" id="product-table-body">
            <?php foreach ($products as $product) { ?>
              <div class="product-table-body-row">
                <div class="remove">
                  <input type="button" onclick="update_cart(this, 'remove');" title="<?php echo $button_remove; ?>" />
                  <input name="product_key" value="<?php echo $product['key']; ?>" style="display: none;" hidden />
                  <input name="product_id_q" value="<?php echo $product['product_id']; ?>" style="display: none;" hidden />
                </div>
                <div class="name">
                  <?php if ($hide_main_img) { ?>
                  <div class="name-left">
                    <?php if ($product['thumb']) { ?>
                      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                    <?php } ?>
                  </div>
                  <?php } ?>
                  <div class="name-right<?php if (!$hide_main_img) { ?> fix<?php } ?>">
                    <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>" <?php echo !$product['stock'] ? 'class="error-stock"' : ''; ?> ><?php echo $product['name']; ?></a>
                    <?php if ($product['model'] && $hide_product_model) { ?><div class="model"><span><?php echo $text_model; ?></span><?php echo $product['model']; ?></div><?php } ?>
                    <?php if ($product['ean'] && $hide_product_ean) { ?><div class="ean"><span><?php echo $text_ean; ?></span><?php echo $product['ean']; ?></div><?php } ?>
                    <?php if ($product['jan'] && $hide_product_jan) { ?><div class="jan"><span><?php echo $text_jan; ?></span><?php echo $product['jan']; ?></div><?php } ?>
                    <?php if ($product['isbn'] && $hide_product_isbn) { ?><div class="isbn"><span><?php echo $text_isbn; ?></span><?php echo $product['isbn']; ?></div><?php } ?>
                    <?php if ($product['mpn'] && $hide_product_mpn) { ?><div class="mpn"><span><?php echo $text_mpn; ?></span><?php echo $product['mpn']; ?></div><?php } ?>
                    <?php if ($product['location'] && $hide_product_location) { ?><div class="location"><span><?php echo $text_location; ?></span><?php echo $product['location']; ?></div><?php } ?>
                    <?php if ($product['stock_text'] && $hide_product_stock) { ?><div class="stock-text"><span><?php echo $text_availability; ?></span><?php echo $product['stock_text']; ?></div><?php } ?>
                    <?php if ($product['reward'] && $hide_product_reward) { ?><div class="reward"><span><?php echo $text_points; ?></span><?php echo $product['reward']; ?></div><?php } ?>
                    <?php if ($product['option'] && $hide_product_option) { ?>
                      <div class="options">
                        <?php foreach ($product['option'] as $option) { ?>
                        <span><?php echo $option['name']; ?>: <?php echo $option['value']; ?></span><br />
                        <?php } ?>
                      </div>
                    <?php } ?>
                  </div>
                </div>
                <div class="price">
                  <div><?php echo $product['price']; ?></div>
                  <?php if ($product['tax'] && $hide_product_tax) { ?><span><?php echo $text_tax; ?><br/><?php echo $product['tax']; ?></span><?php } ?>
                </div>
                <div class="quantity">
                  <div class="inner">
                    <div>
                      <input name="product_id_q" value="<?php echo $product['product_id']; ?>" style="display: none;" hidden />
                      <input name="product_id" value="<?php echo $product['key']; ?>" style="display: none;" hidden />
                      <button onclick="$(this).next().val(~~$(this).next().val()+1); update_cart(this, 'update');" id="increase-quantity">+</button>
                      <input
                        type="text"
                        name="quantity"
                        value="<?php echo $product['quantity']; ?>"
                        onchange="update_cart(this, 'update'); return validate_input(this);"
                        onkeyup="update_cart(this, 'update'); return validate_input(this);"
                        class="input-quantity"
                      />
                      <button onclick="$(this).prev().val(~~$(this).prev().val()-1); update_cart(this, 'update');" id="decrease-quantity">&mdash;</button>
                    </div>
                  </div>
                </div>
                <div class="total">
                  <div><?php echo $product['total']; ?></div>
                  <?php if ($product['tax_total'] && $hide_product_tax) { ?><span><?php echo $text_tax; ?><br/><?php echo $product['tax_total']; ?></span><?php } ?>
                </div>
              </div>
            <?php } ?>
          </div>
        </div>

        <?php if ($hide_coupon || $hide_voucher || $hide_reward || $hide_shipping) { ?>
        <!-- GIFT -->
        <div class="cart-gifts">
          <div class="smca-gift-heading"><?php echo $text_help_heading; ?></div>
          <div class="panel-group" id="smca-gift-accordion">
            <?php if ($hide_coupon && $coupon) { ?>
            <div>
              <div class="heading"><a href="#smca-collapse-coupon" class="accordion-toggle" data-toggle="collapse" data-parent="#smca-gift-accordion"><?php echo $text_coupon_title; ?> <i class="fa fa-caret-down"></i></a></div>
              <div class="collapse" id="smca-collapse-coupon">
                <div class="section"><?php echo $coupon; ?></div>
              </div>
            </div>
            <?php } ?>
            <?php if ($hide_voucher && $voucher) { ?>
            <div>
              <div class="heading"><a href="#smca-collapse-voucher" class="accordion-toggle" data-toggle="collapse" data-parent="#smca-gift-accordion" ><?php echo $text_voucher_title; ?> <i class="fa fa-caret-down"></i></a></div>
              <div class="collapse" id="smca-collapse-voucher">
                <div class="section"><?php echo $voucher; ?></div>
              </div>
            </div>
            <?php } ?>
            <?php if ($hide_reward && $reward) { ?>
            <div>
              <div class="heading"><a href="#smca-collapse-reward" class="accordion-toggle" data-toggle="collapse" data-parent="#smca-gift-accordion"><?php echo $text_reward_title; ?> <i class="fa fa-caret-down"></i></a></div>
              <div class="collapse" id="smca-collapse-reward">
                <div class="section"><?php echo $reward; ?></div>
              </div>
            </div>
            <?php } ?>
            <?php if ($hide_shipping && $shipping) { ?>
            <div>
              <div class="heading"><a href="#smca-collapse-shipping" class="accordion-toggle" data-toggle="collapse" data-parent="#smca-gift-accordion"><?php echo $text_shipping_title; ?> <i class="fa fa-caret-down"></i></a></div>
              <div class="collapse" id="smca-collapse-shipping">
                <div class="section"><?php echo $shipping; ?></div>
              </div>
            </div>
            <?php } ?>
          </div>
        </div>
        <?php } ?>

        <!-- TOTALS -->
        <div class="totals">
          <div>
            <span><?php echo $text_total_bottom; ?></span>
            <div id="total-order"><?php echo $total; ?><?php echo ($hide_cart_weight) ? ';' : ''; ?></div>
            <?php if ($hide_cart_weight) { ?>
            <span><?php echo $text_cart_weight; ?></span>
            <div id="weight-order"><?php echo $cart_weight; ?></div>
            <?php } ?>
          </div>
        </div>
        <div id="save-cart-data">
          <div>
            <input type="button" onclick="$('#save-cart-data-for-email').slideToggle();"  value="<?php echo $buttom_save_cart_to_email; ?>" class="save-cart-data-button<?php echo !$customer_status ? ' fix' : ''; ?>" />
            <?php if ($customer_status) { ?>
              <input type="button" onclick="saveCart('wishlist');"  value="<?php echo $buttom_save_cart_to_wishlist; ?>" class="save-cart-data-button" />
            <?php } ?>
            <div id="save-cart-data-for-email">
              <input type="text" name="save_cart_email" value="<?php echo $save_cart_email; ?>" />
              <input type="button" onclick="saveCart('email');" value="<?php echo $button_send_cart; ?>" class="save-cart-data-for-email-button" />
            </div>
          </div>
          <div id="save-cart-data-result-error"></div>
          <div id="save-cart-data-result-success"></div>
        </div>
      <?php } else { ?>
        <div id="smca-modal-data-empty"><?php echo $text_empty; ?></div>
      <?php } ?>
    </div>

    <?php if (isset($check) && $check != 0 && $cross_sell_products) { ?>
    <!-- AJAX PRODUCTS -->
    <div id="smca-ajax-products">
      <div class="smca-ajax-products-arrow">
        <button id="ajax-products-arrow-prev"><?php echo $button_carousel_prev; ?></button>
        <input type="hidden" name="ajax_pagination" value="0" style="display:none;" />
        <input type="hidden" name="ajax_all_products" value="<?php echo $ajax_all_products; ?>" style="display:none;" />
        <button id="ajax-products-arrow-next"><?php echo $button_carousel_next; ?></button>
      </div>
      <div id="smca-ajax-products-list">
        <?php foreach ($cross_sell_products as $product) { ?>
          <div class="ajax-product">
            <?php if ($m_hide_sub_img) { ?>
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a></div>
            <?php } ?>
            <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            <?php if ($product['price'] && $m_hide_product_price) { ?>
            <div class="price">
              <?php if (!$product['special']) { ?>
              <span class="price-new"><?php echo $product['price']; ?></span>
              <?php } else { ?>
              <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
              <?php } ?>
            </div>
            <?php } ?>
            <?php if ($m_hide_product_addto_cart_button) { ?>
            <div class="cart"><a onclick="update_cart(<?php echo $product['product_id']; ?>, 'add');"><?php echo $button_cart; ?></a></div>
            <?php } ?>
          </div>
        <?php } ?>
      </div>
    </div>
    <?php } ?>
  </div>
  <!-- BUTTONS -->
  <div class="modal-footer">
    <input type="button" onclick="$.magnificPopup.close();" value="<?php echo $button_go_back; ?>" class="close-button-bottom" />
    <?php if ($products) { ?>
      <?php if ($hide_save_cart_button) { ?>
      <input type="button" onclick="$('#save-cart-data').slideToggle();" value="<?php echo $button_save_cart; ?>" class="save-button-bottom" />
      <?php } ?>
      <input type="button" onclick="location.href='<?php echo $checkout_link; ?>';" value="<?php echo $button_go_to_checkout; ?>" class="go-button-bottom" />
    <?php } ?>
  </div>

  <script type="text/javascript">
  function update_cart(target, status) {
    maskElement('#check-data', true);
    var input_val    = $(target).parent().children('input[name=quantity]').val(),
        quantity     = parseInt(input_val),
        product_id   = $(target).parent().children('input[name=product_id]').val(),
        product_id_q = $(target).parent().children('input[name=product_id_q]').val(),
        product_key  = $(target).next().val(),
        urls         = null;

    if (quantity == 0) {
      quantity = $(target).parent().children('input[name=quantity]').val(1);
      maskElement('#check-data', false);
      return;
    }

    if (status == 'update') {
      urls = 'index.php?route=extension/module/ocdev_smart_cart&update=' + product_id + '&quantity=' + quantity;
    } else if (status == 'add') {
      urls = 'index.php?route=extension/module/ocdev_smart_cart&add=' + target + '&quantity=1';
    } else {
      urls = 'index.php?route=extension/module/ocdev_smart_cart&remove=' + product_key;
    }

    $.ajax({
      url: urls,
      type: 'get',
      dataType: 'html',
      success: function(data) {
        $('#smca-modal-data').html($(data).find('#smca-modal-data').children());
        $('#smca-ajax-products').html($(data).find('#smca-ajax-products > *'));
        maskElement('#check-data', false);
        buttonManipulate();
        $('[onclick="getOCwizardModal_smca(\'' +  parseInt(product_id_q) + '\',\'' + 'load' + '\');"]')
        .html('<span class="product-btn noselect"><?php echo $button_cart; ?></span>')
        .attr('onclick', 'getOCwizardModal_smca(\'' + parseInt(product_id_q) + '\',\'' + 'add' + '\');');

        $('[onclick="getOCwizardModal_smca(\'' + parseInt(product_id_q) + '\',\'' + 'load_option' + '\');"]')
        .html('<?php echo $button_cart; ?>')
        .attr('onclick', 'getOCwizardModal_smca(\'' + parseInt(product_id_q) + '\',\'' + 'add_option' + '\');');

        $('[onclick="getOCwizardModal_smca(\'' + parseInt(product_id_q) + '\',\'' + 'add_option' + '\');"]')
        .html('<?php echo $button_cart; ?>')
        .attr('onclick', 'getOCwizardModal_smca(\'' + parseInt(product_id_q) + '\',\'' + 'add_option' + '\');');
      }
    });
  }

  $(document).on('click', '#ajax-products-arrow-prev', function() {
    maskElement('#smca-ajax-products-list > .ajax-product', true);
    $(this).next().val(~~$(this).next().val() - 3);
    ajaxProducts(this);
  });

  $(document).on('click', '#ajax-products-arrow-next', function() {
    maskElement('#smca-ajax-products-list > .ajax-product', true);
    var count_div = $('#smca-ajax-products-list > .ajax-product').length,
        current_part = parseInt($('#smca-ajax-products input[name=ajax_pagination]').val()),
        all_products = parseInt($('#smca-ajax-products input[name=ajax_all_products]').val());

    if (count_div < 3) {
      $(this).css({ 'opacity': 0.5, 'cursor' : 'default' }).unbind('onclick');
      maskElement('#smca-ajax-products-list > .ajax-product', false);
      return;
    } else if (current_part+3 >= all_products) {
      $(this).css({ 'opacity': 0.5, 'cursor' : 'default' }).unbind('onclick');
      maskElement('#smca-ajax-products-list > .ajax-product', false);
      return;
    } else {
      $(this).prev().prev().val(~~$(this).prev().prev().val() + 3);
    }

    ajaxProducts(this);
  });

  function ajaxProducts(target) {
    var input_val  = $(target).parent().children('input[name=ajax_pagination]').val(),
        quantity   = parseInt(input_val),
        count_ajax_products = $(target).parent().children('input[name=ajax_all_products]').val();

    $('.smca-ajax-products-arrow button').css({ 'opacity': 1, 'cursor' : 'pointer' });

    if (quantity <= -3) {
      $('#ajax-products-arrow-prev').css({ 'opacity': 0.5, 'cursor' : 'default' });
      quantity = $(target).parent().children('input[name=ajax_pagination]').val(0);
      maskElement('#smca-ajax-products-list > .ajax-product', false);
      return;
    }

    if (quantity >= $('#smca-ajax-products input[name=ajax_all_products]').val()) {
      $('#ajax-products-arrow-next').css({ 'opacity': 0.5, 'cursor' : 'default' });
      quantity = $(target).parent().children('input[name=ajax_pagination]').val($('#smca-ajax-products input[name=ajax_all_products]').val());
      maskElement('#smca-ajax-products-list > .ajax-product', false);
      return;
    }

    if (quantity > count_ajax_products) {
      $.ajax({
        url:  'index.php?route=extension/module/ocdev_smart_cart&start=0' + '&end=3',
        type: 'get',
        dataType: 'html',
        success: function(data) {
          $(target).parent().children('input[name=ajax_pagination]').val(0);
          $('#smca-ajax-products-list').html($(data).find('#smca-ajax-products-list > *'));
        }
      });
    } else {
      $.ajax({
        url:  'index.php?route=extension/module/ocdev_smart_cart&start=' + quantity + '&end=3',
        type: 'get',
        dataType: 'html',
        success: function(data) {
          $('#smca-ajax-products-list').html($(data).find('#smca-ajax-products-list > *'));
        }
      });
    }
  }
  // loadmask function
  function maskElement(element, status) {
    if (status == true) {
      $('<div/>')
      .attr('class', 'smca-modal-loadmask')
      .prependTo(element);
      $('<div class="smca-modal-loadmask-loading" />').insertAfter($('.smca-modal-loadmask'));
    } else {
      $('.smca-modal-loadmask').remove();
      $('.smca-modal-loadmask-loading').remove();
    }
  }

  function validate_input(input) {
    input.value = input.value.replace(/[^\d,]/g, '');
  }

  function saveCart(type) {
    maskElement('#check-data', true);
    $.ajax({
      type: 'post',
      url:  'index.php?route=extension/module/ocdev_smart_cart/saveCart&type=' + type,
      data: $('#save-cart-data input[type=\'text\']'),
      dataType: 'json',
      success: function(json) {
        if (json['error']) {
          maskElement('#check-data', false);
          $('#save-cart-data-result-error').fadeIn().html(json['error']).delay(2000).fadeOut();
        }
        if (json['success']) {
          maskElement('#check-data', false);
          $('#save-cart-data-result-success').fadeIn().html(json['success']).delay(2000).fadeOut();
          $('#wishlist-total').html(json['total']);
        }
      }
    });
  }
  </script>
</div>
