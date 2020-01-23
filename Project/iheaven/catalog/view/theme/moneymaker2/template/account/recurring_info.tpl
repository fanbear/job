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
      <h1 class="h2 text-center content-title"><?php echo $heading_title; ?></h1>
      <div class="row catalog-thumb">
        <div class="col-sm-12 text-center">
            <span class="fa-stack fa-2x img-thumbnail">
              <i class="fa fa-circle fa-stack-2x"></i>
              <i class="fa fa-refresh fa-stack-1x fa-inverse"></i>
            </span>
        </div>
      </div>
      <div class="row catalog-descr">
        <div class="col-sm-12 text-center">
          <div>
            <p><?php echo $text_recurring_detail; ?></p>
          </div>
        </div>
      </div>
      <hr class="catalog-hr">
      <br />
      <table class="table">
        <tbody>
        <tr>
          <th class="text-left" style="width: 50%;">
            <p><b><?php echo $text_order_recurring_id; ?></b> #<?php echo $order_recurring_id; ?></p>
            <p><b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></p>
            <p><b><?php echo $text_status; ?></b> <?php echo $status; ?></p>
            <p><b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?></p>
          </th>
          <th class="left" style="width: 50%;">
            <p><b><?php echo $text_order_id; ?></b><a href="<?php echo $order; ?>">#<?php echo $order_id; ?></a></p>
            <p><b><?php echo $text_product; ?></b><a href="<?php echo $product; ?>"><?php echo $product_name; ?></a></p>
            <p><b><?php echo $text_quantity; ?></b> <?php echo $product_quantity; ?></p>
          </th>
        </tr>
        </tbody>
      </table>
      <table class="table">
        <thead>
        <tr>
          <td class="text-left"><?php echo $text_description; ?></td>
          <td class="text-left"><?php echo $text_reference; ?></td>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td class="text-left" style="width: 50%;"><?php echo $recurring_description; ?></td>
          <td class="text-left" style="width: 50%;"><?php echo $reference; ?></td>
        </tr>
        </tbody>
      </table>
      <h3 class="text-center"><?php echo $text_transaction; ?></h3>
      <table class="table table-bordered table-hover">
        <thead>
        <tr>
          <td class="text-left"><?php echo $column_date_added; ?></td>
          <td class="text-left"><?php echo $column_type; ?></td>
          <td class="text-right"><?php echo $column_amount; ?></td>
        </tr>
        </thead>
        <tbody>
        <?php if ($transactions) { ?>
        <?php foreach ($transactions as $transaction) { ?>
        <tr>
          <td class="text-left"><?php echo $transaction['date_added']; ?></td>
          <td class="text-left"><?php echo $transaction['type']; ?></td>
          <td class="text-right"><?php echo $transaction['amount']; ?></td>
        </tr>
        <?php } ?>
        <?php } else { ?>
        <tr>
          <td colspan="3" class="text-center"><?php echo $text_no_results; ?></td>
        </tr>
        <?php } ?>
        </tbody>
      </table>
      <?php echo $recurring; ?>
      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<?php echo $footer; ?>
