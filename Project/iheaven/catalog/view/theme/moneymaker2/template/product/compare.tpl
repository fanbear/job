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
            <i class="fa fa-area-chart fa-stack-1x fa-inverse"></i>
          </span>
        </div>
      </div>
      <?php if ($products) { ?>
        <div class="row catalog-sub">
          <div class="col-sm-12">
            <div class="text-center">
              <?php foreach ($products as $product) { ?><a class="btn btn-sm btn-link" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a><?php } ?>
            </div>
          </div>
        </div>
        <hr class="catalog-hr">
        <?php if ($moneymaker2_catalog_compare_charts_enabled&&isset($moneymaker2_compare_dataset)&&$moneymaker2_compare_dataset) { ?>
          <div class="row text-center">
            <?php foreach ($moneymaker2_compare_dataset as $key => $value) { ?>
            <div class="col-sm-<?php echo $moneymaker2_catalog_compare_charts_columns['sm'][0]; ?> col-md-<?php echo $moneymaker2_catalog_compare_charts_columns['md'][0]; ?> col-lg-<?php echo $moneymaker2_catalog_compare_charts_columns['lg'][0]; ?> text-center col-centered">
              <h3><?php echo $value['title']; ?></h3>
              <div class="compare-chart">
                <canvas id="canvas<?php echo $key; ?>"></canvas>
              </div>
            </div>
            <?php } ?>
          </div>
        <?php } ?>
        <div class="table-responsive">
          <table class="table">
            <tbody>
              <tr>
                <th class="text-muted"><?php echo $text_name; ?></th>
                <?php foreach ($products as $product) { ?>
                <th class="name text-center"><a href="<?php echo $product['href']; ?>"<?php if ($product['special']) { ?> class="text-special"<?php } ?>><?php echo $product['name']; ?></a><?php if (isset($product['code'])&&$product['code']) { ?><br /><small class="text-muted"><?php echo $product['code']; ?></small><?php } ?></th>
                <?php } ?>
              </tr>
              <?php if (!$moneymaker2_catalog_compare_images_hide) { ?>
              <tr>
                <td class="text-muted"><?php echo $text_image; ?></td>
                <?php foreach ($products as $product) { ?>
                <td class="text-center col-sm-<?php switch (count($products)) {case 1:echo 10;break; case 2:echo 5;break; case 3:echo 4;break; case 4:echo 3;break;}?>"><?php if ($product['thumb']) { ?>
                  <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" />
                  <?php } ?></td>
                <?php } ?>
              </tr>
              <?php } ?>
              <?php if (!$moneymaker2_common_buy_hide) { ?>
              <tr>
                <td class="text-muted"><?php echo $text_price; ?></td>
                <?php foreach ($products as $product) { ?>
                <td class="text-center">
                  <?php if ($moneymaker2_common_price_detached) { ?>
                  <p><small><?php if ($product['price']) { ?><span class="price text-muted"><?php if (!$product['special']) { ?><?php echo $product['price']; ?><?php } else { ?><span class="price-new"><b><?php echo $product['special']; ?></b></span> <span class="price-old"><?php echo $product['price']; ?></span><?php } ?></span><?php } ?></small></p>
                  <?php } ?>

                  <button type="button" <?php if ($moneymaker2_common_cart_outofstock_disabled&&$product['quantity']<=0) { ?>disabled="disabled"<?php } ?> <?php if (!$moneymaker2_common_price_detached) { ?><?php if ($product['price']&&$product['special']) { ?>data-toggle="tooltip" data-html="true" data-placement="bottom" title="<?php if ($product['special']) { ?><span class='price-old'><?php echo $product['price']; ?></span><?php } ?>"<?php } ?><?php } ?> class="btn btn-sm <?php if (!$product['special']) { ?>btn-primary<?php } else { ?>btn-danger<?php } ?>" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-fw fa-shopping-cart"></i> <?php if (!$moneymaker2_common_price_detached) { ?><?php if ($product['price']) { ?><span class="price"><?php if (!$product['special']) { ?><?php echo $product['price']; ?><?php } else { ?><span class="price-new"><?php echo $product['special']; ?></span><?php } ?></span><?php } ?><?php } else { ?><?php echo $button_cart; ?><?php } ?></button>
                </td>
                <?php } ?>
              </tr>
              <?php } ?>
              <?php if (!$moneymaker2_catalog_compare_model_hide) { ?>
              <tr>
                <td class="text-muted"><?php echo $text_model; ?></td>
                <?php foreach ($products as $product) { ?>
                <td class="text-center"><?php echo $product['model']; ?></td>
                <?php } ?>
              </tr>
              <?php } ?>
              <?php if (!$moneymaker2_catalog_compare_brand_hide) { ?>
              <tr>
                <td class="text-muted"><?php echo $text_manufacturer; ?></td>
                <?php foreach ($products as $product) { ?>
                <td class="text-center"><?php echo $product['manufacturer']; ?></td>
                <?php } ?>
              </tr>
              <?php } ?>
              <?php if (!$moneymaker2_catalog_compare_availability_hide) { ?>
              <tr>
                <td class="text-muted"><?php echo $text_availability; ?></td>
                <?php foreach ($products as $product) { ?>
                <td class="text-center"><?php echo $product['availability']; ?></td>
                <?php } ?>
              </tr>
              <?php } ?>
              <?php if (!$moneymaker2_catalog_compare_rating_hide) { ?>
              <?php if ($review_status) { ?>
              <tr>
                <td class="text-muted"><?php echo $text_rating; ?></td>
                <?php foreach ($products as $product) { ?>
                <td class="rating text-center"><?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <i class="fa fa-star"></i>
                  <?php } else { ?>
                  <i class="fa fa-star active"></i>
                  <?php } ?>
                  <?php } ?>
                  <br />
                  <small><?php echo $product['reviews']; ?></small></td>
                <?php } ?>
              </tr>
              <?php } ?>
              <?php } ?>
              <?php if (!$moneymaker2_catalog_compare_description_hide) { ?>
              <tr>
                <td class="text-muted"><?php echo $text_summary; ?></td>
                <?php foreach ($products as $product) { ?>
                <td class="description"><small><?php echo $product['description']; ?></small></td>
                <?php } ?>
              </tr>
              <?php } ?>
              <?php if (!$moneymaker2_catalog_compare_weight_hide) { ?>
              <tr>
                <td class="text-muted"><?php echo $text_weight; ?></td>
                <?php foreach ($products as $product) { ?>
                <td class="text-center"><?php echo $product['weight']; ?></td>
                <?php } ?>
              </tr>
              <?php } ?>
              <?php if (!$moneymaker2_catalog_compare_dimensions_hide) { ?>
              <tr>
                <td class="text-muted"><?php echo $text_dimension; ?></td>
                <?php foreach ($products as $product) { ?>
                <td class="text-center"><?php echo $product['length']; ?> x <?php echo $product['width']; ?> x <?php echo $product['height']; ?></td>
                <?php } ?>
              </tr>
              <?php } ?>
            </tbody>
            <?php foreach ($attribute_groups as $attribute_group) { ?>
            <tbody>
              <tr>
                <td></td>
                <td colspan="<?php echo count($products); ?>" class="text-center"><strong><?php echo $attribute_group['name']; ?></strong></td>
              </tr>
            </tbody>
            <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
            <tbody>
              <tr>
                <td class="text-muted"><?php echo $attribute['name']; ?></td>
                <?php foreach ($products as $product) { ?>
                <?php if (isset($product['attribute'][$key])) { ?>
                <td class="attribute text-center"><?php echo $product['attribute'][$key]; ?></td>
                <?php } else { ?>
                <td></td>
                <?php } ?>
                <?php } ?>
              </tr>
            </tbody>
            <?php } ?>
            <?php } ?>
            <tr>
              <td></td>
              <?php foreach ($products as $product) { ?>
              <td class="text-center">
                <a href="<?php echo $product['remove']; ?>" class="btn btn-sm btn-default"><i class="fa fa-close"></i> <?php echo $button_remove; ?></a></td>
              <?php } ?>
            </tr>
          </table>
        </div>
      <?php } else { ?>
      <hr class="catalog-hr">
      <div class="row catalog-msg">
        <div class="col-sm-12 text-center">
          <p><?php echo $text_empty; ?></p>
        </div>
      </div>
      <div class="buttons text-center">
        <a href="<?php echo $continue; ?>" class="btn btn-default"><i class="fa fa-fw fa-angle-right"></i><?php echo $button_continue; ?></a>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<script><!--
  $(document).ready(function() {
    <?php if ($success) { ?>
      $('#popupModal .modal-header .close').removeClass('hidden');
      $('#popupModal .modal-title').text('<?php echo $heading_title; ?>');
      $('#popupModal .modal-body').prepend('<div class="panel panel-info"><div class="panel-heading text-center"><small><?php echo $success; ?></small></div></div>');
      $('#popupModal').modal();
    <?php } ?>
    <?php if ($products&&$moneymaker2_catalog_compare_charts_enabled&&isset($moneymaker2_compare_dataset)&&$moneymaker2_compare_dataset) { ?>
      <?php foreach ($moneymaker2_compare_dataset as $key => $value) { ?>
        var randomScalingFactor = function(){ return Math.round(Math.random()*255)};
        var lineChartData<?php echo $key; ?> = {
          labels : [<?php foreach ($products as $product) { ?>"<?php if ($product['code']) { ?><?php echo $product['code']; ?><?php } else { ?><?php echo $product['name']; ?><?php } ?>",<?php } ?>],
          datasets : [
          <?php if ($value['fns'] > 1) { ?>
            <?php for ($j=0; $j<$value['fns']; $j++) { ?>
              {
                label: "<?php echo $value['title'].$j; ?>",
                fillColor : "rgba(<?php echo $moneymaker2_compare_datasetcolors[$j]; ?>,0.15)",
                strokeColor : "rgba(<?php echo $moneymaker2_compare_datasetcolors[$j]; ?>,1)",
                pointColor : "rgba(<?php echo $moneymaker2_compare_datasetcolors[$j]; ?>,1)",
                highlightFill : "rgba(<?php echo $moneymaker2_compare_datasetcolors[$j]; ?>,0.25)",
                highlightStroke : "rgba(<?php echo $moneymaker2_compare_datasetcolors[$j]; ?>,1)",
                pointStrokeColor : "#fff",
                pointHighlightFill : "#fff",
                pointHighlightStroke : "rgba(<?php echo $moneymaker2_compare_datasetcolors[$j]; ?>,1)",
                data : [<?php foreach ($value['values'] as $value2) { ?><?php echo str_replace(',','.',$value2[$j]); ?>,<?php } ?>]
              },
            <?php } ?>
          <?php } else { ?>
            {
              label: "<?php echo $value['title']; ?>",
              fillColor : "rgba(<?php echo $moneymaker2_compare_datasetcolors[4]; ?>,0.15)",
              strokeColor : "rgba(<?php echo $moneymaker2_compare_datasetcolors[4]; ?>,1)",
              pointColor : "rgba(<?php echo $moneymaker2_compare_datasetcolors[4]; ?>,1)",
              highlightFill : "rgba(<?php echo $moneymaker2_compare_datasetcolors[4]; ?>,0.25)",
              highlightStroke : "rgba(<?php echo $moneymaker2_compare_datasetcolors[4]; ?>,1)",
              pointStrokeColor : "#fff",
              pointHighlightFill : "#fff",
              pointHighlightStroke : "rgba(<?php echo $moneymaker2_compare_datasetcolors[4]; ?>,1)",
              data : [<?php foreach ($value['values'] as $value2) { ?><?php echo str_replace(',','.',$value2); ?>,<?php } ?>]
            },
          <?php } ?>
          ]
        }
      <?php } ?>
      window.onload = function(){
        <?php foreach ($moneymaker2_compare_dataset as $key => $value) { ?>
          var ctx<?php echo $key; ?> = document.getElementById("canvas<?php echo $key; ?>").getContext("2d");
          window.myLine<?php echo $key; ?> = new Chart(ctx<?php echo $key; ?>).<?php echo $value['mode']; ?>(lineChartData<?php echo $key; ?>, {
            responsive: true,
            bezierCurve : true,
            bezierCurveTension : 0.2,
            tooltipTemplate: "<%if (label){%><%=label%>: <%}%><%= value %><?php echo $value['unit']; ?>",
            multiTooltipTemplate: "<%= value %><?php echo $value['unit']; ?>",
            scaleLabel: "<%=value%><?php echo $value['unit']; ?>",
            maintainAspectRatio: false,
            scaleFontSize: 10,
          });
        <?php } ?>
      }
    <?php } ?>
  });
  //--></script>
<?php echo $footer; ?>
