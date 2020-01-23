<li class="dropdown" id="cart">
  <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-fw fa-shopping-cart"></i><small class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><span class="fa-stack-1x"><?php echo $text_items_count; ?></span></small> <span class="<?php echo $moneymaker2_header_strip_cart_class; ?>"><span id="cart-total"><?php echo $text_items; ?></span> <i class="fa fa-angle-down"></i></span></a>
  <ul class="dropdown-menu keep-open">
    <?php if ($products || $vouchers) { ?>
    <li>
      <table class="table">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></td>
          <td class="text-right">x&nbsp;<?php echo $product['quantity']; ?></td>
          <td class="text-right text-nowrap"><?php echo $product['total']; ?></td>
          <td class="text-center"><a href="javascript:void(0);" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="text-muted"><i class="fa fa-lg fa-times-circle"></i></a></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right text-nowrap"><?php echo $voucher['amount']; ?></td>
          <td class="text-center"><a href="javascript:void(0);" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="text-muted"><i class="fa fa-lg fa-times-circle"></i></a></td>
        </tr>
        <?php } ?>
        <tr><td colspan="5"><hr></td></tr>
        <?php foreach ($totals as $total) { ?>
        <tr>
          <td></td>
          <td class="text-left"><?php echo $total['title']; ?></td>
          <td></td>
          <td class="text-right text-nowrap"><?php echo $total['text']; ?></td>
          <td></td>
        </tr>
        <?php } ?>
        <tr><td colspan="5"><hr></td></tr>
      </table>
    </li>
    <li>
      <div class="text-center">
        <p><a class="btn btn-primary" href="<?php echo $checkout; ?>"><i class="fa fa-share"></i> <?php echo $text_checkout; ?></a><?php if ($moneymaker2_modules_quickorder_enabled&&$moneymaker2_modules_quickorder_display_popupcart) { ?><a class="btn btn-link" data-toggle="modal" data-target="#orderModal" data-order-mode="cart" data-order-product-id="0" data-order-title="<?php echo $moneymaker2_modules_quickorder_button_title; ?>" data-order-img-src="0" data-order-price="<?php if (isset($totals)) echo $totals[count($totals)-1]['text']; ?>"><i class="fa fa-send"></i> <?php echo $moneymaker2_modules_quickorder_button_title; ?></a><?php } ?></p>
        <p><a class="btn btn-sm btn-default" href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a></p>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <?php if ($moneymaker2_header_cart_custom) { ?>
        <?php if ($moneymaker2_header_cart_image) { ?>
          <p class="text-center"><img src="<?php echo $moneymaker2_header_cart_image; ?>" alt="<?php echo $text_items; ?>" /></p>
        <?php } ?>
        <?php if ($moneymaker2_header_cart_link_enabled&&$moneymaker2_header_cart_link) { ?>
          <p class="text-center">
            <a href="<?php echo $moneymaker2_header_cart_link; ?>" class="btn btn-default"><i class="fa fa-<?php echo $moneymaker2_header_cart_link_icon; ?>"></i> <?php echo $moneymaker2_header_cart_link_title; ?></a>
          </p>
        <?php } ?>
        <p class="text-center"><?php echo $moneymaker2_header_cart_text; ?></p>
      <?php } else { ?>
        <p class="text-center"><?php echo $text_empty; ?></p>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
</li>
