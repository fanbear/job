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
            <i class="fa fa-trademark fa-stack-1x fa-inverse"></i>
          </span>
        </div>
      </div>
      <?php if ($categories) { ?>
      <div class="row catalog-descr">
        <div class="col-sm-12 text-center">
          <div>
            <p><?php echo $text_index; ?></p>
          </div>
        </div>
      </div>
      <div class="row catalog-sub">
        <div class="col-sm-12">
          <div class="text-center">
            <?php foreach ($categories as $category) { ?><a class="btn btn-sm btn-link" href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a><?php } ?>
          </div>
        </div>
      </div>
      <hr class="catalog-hr">
      <?php foreach ($categories as $category) { ?>
      <h2 id="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></h2>
      <?php if ($category['manufacturer']) { ?>
      <?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>
      <div class="row">
        <?php foreach ($manufacturers as $manufacturer) { ?>
        <div class="col-sm-3"><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php } ?>
      <?php } else { ?>
      <hr class="catalog-hr">
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
<?php echo $footer; ?>