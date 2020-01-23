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
              <i class="fa fa-heart fa-stack-1x fa-inverse"></i>
            </span>
        </div>
      </div>
      <?php if ($products) { ?>
      <br />
      <div class="table-responsive">
      <table class="table">
        <thead>
          <tr>
            <td class="text-center"><?php echo $column_image; ?></td>
            <td class="text-left"><?php echo $column_name; ?></td>
            <td class="text-left"><?php echo $column_model; ?></td>
            <td class="text-right"><?php echo $column_stock; ?></td>
            <td class="text-right"><?php echo $column_price; ?></td>
            <td class="text-right"><?php echo $column_action; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($products as $product) { ?>
          <tr>
            <td class="text-center"><?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
              <?php } ?></td>
            <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
            <td class="text-left"><?php echo $product['model']; ?></td>
            <td class="text-right"><?php echo $product['stock']; ?></td>
            <td class="text-right"><?php if ($product['price']) { ?>
              <div class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <b><?php echo $product['special']; ?></b> <s><?php echo $product['price']; ?></s>
                <?php } ?>
              </div>
              <?php } ?></td>
            <td class="text-right"><a href="javascript:void(0);" onclick="cart.add('<?php echo $product['product_id']; ?>');" title="<?php echo $button_cart; ?>" class="text-nowrap"><i class="fa fa-fw fa-shopping-cart"></i> <?php echo $button_cart; ?></a>
              <a href="<?php echo $product['remove']; ?>" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="text-special"><i class="fa fa-fw fa-times"></i></a></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      </div>
      <?php } else { ?>
      <hr class="catalog-hr">
      <div class="row catalog-msg">
        <div class="col-sm-12 text-center">
          <p><?php echo $text_empty; ?></p>
        </div>
      </div>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="text-center"><a href="<?php echo $continue; ?>" class="btn btn-default"><i class="fa fa-fw fa-angle-right"></i><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
  $(document).ready(function() {
    <?php if ($success) { ?>
      $('#popupModal .modal-header .close').removeClass('hidden');
      $('#popupModal .modal-title').text('<?php echo $heading_title; ?>');
      $('#popupModal .modal-body').prepend('<div class="panel panel-info"><div class="panel-heading text-center"><small><?php echo $success; ?></small></div></div>');
      $('#popupModal').modal();
    <?php } ?>
  });
  //--></script>
<?php echo $footer; ?>