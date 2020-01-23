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
      <ul class="breadcrumb text-center">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
        <?php if($i+1<count($breadcrumbs)) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li><?php } else { ?><li class="active"><?php echo $breadcrumb['text']; ?></li><?php } ?>
        <?php } ?>
      </ul>
      <?php echo $content_top; ?>
      <h1 class="h2 text-center content-title"><?php echo $heading_title; ?><?php if ($weight) { ?>&nbsp;(<?php echo $weight; ?>)<?php } ?></h1>
      <div class="row catalog-thumb">
        <div class="col-sm-12 text-center">
            <span class="fa-stack fa-2x img-thumbnail">
              <i class="fa fa-circle fa-stack-2x"></i>
              <i class="fa fa-shopping-cart fa-stack-1x fa-inverse"></i>
            </span>
        </div>
      </div>
      <hr class="catalog-hr">
      <br />
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <td class="text-center"><?php echo $column_image; ?></td>
                <td class="text-left"><?php echo $column_name; ?></td>
                <td class="text-left"><?php echo $column_model; ?></td>
                <td class="text-left"><?php echo $column_quantity; ?></td>
                <td class="text-right"><?php echo $column_price; ?></td>
                <td class="text-right"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="text-center"><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                  <?php } ?></td>
                <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  <?php if (!$product['stock']) { ?>
                  <span class="text-danger">***</span>
                  <?php } ?>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['reward']) { ?>
                  <br />
                  <small><?php echo $product['reward']; ?></small>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <br />
                  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                  <?php } ?></td>
                <td class="text-left"><?php echo $product['model']; ?></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                    <span class="input-group-btn">
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-link"><i class="fa fa-refresh"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-link text-special" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                <td class="text-right"><?php echo $product['price']; ?></td>
                <td class="text-right"><?php echo $product['total']; ?></td>
              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $voucher) { ?>
              <tr>
                <td></td>
                <td class="text-left"><?php echo $voucher['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-link text-special" onclick="voucher.remove('<?php echo $voucher['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                <td class="text-right"><?php echo $voucher['amount']; ?></td>
                <td class="text-right"><?php echo $voucher['amount']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>
      <?php if ($modules) { ?>
      <h3 class="text-center"><?php echo $text_next; ?></h3>
      <p><?php echo $text_next_choice; ?></p>
      <div class="panel-group" id="accordion">
        <?php foreach ($modules as $module) { ?>
        <?php echo $module; ?>
        <?php } ?>
      </div>
      <?php } ?>
      <br />
      <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
          <table class="table">
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
              <td class="text-right text-nowrap"><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
          </table>
        </div>
      </div>
      <p class="text-center">
        <a href="<?php echo $checkout; ?>" class="btn btn-lg btn-primary"><i class="fa fa-share"></i> <?php echo $button_checkout; ?></a><?php if ($moneymaker2_modules_quickorder_enabled&&$moneymaker2_modules_quickorder_display_checkoutcart) { ?><a class="btn btn-lg btn-link" data-toggle="modal" data-target="#orderModal" data-order-mode="cart" data-order-product-id="0" data-order-title="<?php echo $moneymaker2_modules_quickorder_button_title; ?>" data-order-img-src="0" data-order-price="<?php if (isset($totals)) echo $totals[count($totals)-1]['text']; ?>"><i class="fa fa-send"></i> <?php echo $moneymaker2_modules_quickorder_button_title; ?></a><?php } ?>
      </p>
      <p class="text-center">
        <a href="<?php echo $continue; ?>" class="btn btn-link"><?php echo $button_shopping; ?></a>
      </p>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
  $(document).ready(function() {
    <?php if ($attention) { ?>
      $('#popupModal .modal-header .close').removeClass('hidden');
      $('#popupModal .modal-title').text('<?php echo $heading_title; ?>');
      $('#popupModal .modal-body').prepend('<div class="panel panel-info"><div class="panel-heading text-center"><small><?php echo $attention; ?></small></div></div>');
      $('#popupModal').modal();
    <?php } ?>
    <?php if ($success) { ?>
      $('#popupModal .modal-header .close').removeClass('hidden');
      $('#popupModal .modal-title').text('<?php echo $heading_title; ?>');
      $('#popupModal .modal-body').prepend('<div class="panel panel-info"><div class="panel-heading text-center"><small><?php echo $success; ?></small></div></div>');
      $('#popupModal').modal();
    <?php } ?>
    <?php if ($error_warning) { ?>
      $('#popupModal .modal-header .close').removeClass('hidden');
      $('#popupModal .modal-title').text('<?php echo $heading_title; ?>');
      $('#popupModal .modal-body').prepend('<div class="panel panel-danger"><div class="panel-heading text-center"><small><?php echo $error_warning; ?></small></div></div>');
      $('#popupModal').modal();
    <?php } ?>
  });
  //--></script>
<?php echo $footer; ?>
