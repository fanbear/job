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
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php if ($moneymaker2_catalog_home_advantages_enabled) { ?>
        <?php if ($moneymaker2_catalog_home_advantages_header) { ?>
          <h1 class="h2 text-center content-title"><?php echo $moneymaker2_catalog_home_advantages_header; ?></h1>
          <div class="hr"></div>
        <?php } ?>
        <?php if ($moneymaker2_catalog_home_advantages_icon) { ?>
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
              <span class="fa-stack fa-2x img-thumbnail">
                <i class="fa fa-circle fa-stack-2x"></i>
                <i class="fa fa-<?php echo $moneymaker2_catalog_home_advantages_icon; ?> fa-stack-1x fa-inverse"></i>
              </span>
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
        <?php if ($moneymaker2_catalog_home_advantages_text) { ?>
        <div class="row catalog-descr">
          <div class="col-sm-12">
            <div><?php echo $moneymaker2_catalog_home_advantages_text; ?></div>
          </div>
        </div>
        <?php } ?>
        <?php if ($moneymaker2_categories_advantageslinks) { ?>
        <div class="row catalog-sub">
          <div class="col-sm-12">
            <div class="text-center">
              <?php foreach ($moneymaker2_categories_advantageslinks as $value) { ?><a class="btn btn-link" href="<?php echo $value['multilink'] ? $value['multilink'] : $value['link']; ?>"><i class="fa fa-fw fa-<?php echo $value['icon']; ?>"></i> <?php echo $value['caption']; ?></a><?php } ?>
            </div>
          </div>
        </div>
        <p><br></p>
        <?php } ?>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>