<?php echo $header; ?>
<div class="menu">
    <div class="container">
        <div class="row">
            <?php echo $content_top; ?>
        </div>
    </div>
</div>
<div class="container">
  <ul class="breadcrumb" itemscope itemtype="https://schema.org/BreadcrumbList">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
        <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
          <?php if($i+1 < count($breadcrumbs)) { ?>
            <a itemprop="item" href="<?php echo $breadcrumb['href']; ?>"><span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a>
            <meta itemprop="position" content="<?php echo $key+1; ?>" />
          <?php } else { ?>
            <a rel="nofollow" itemprop="item" href="<?php echo $breadcrumb['href']; ?>">
              <span itemprop="name"><?php echo $breadcrumb['text']; ?></span>
            </a>
            <meta itemprop="position" content="<?php echo $key+1; ?>" /> 
          <?php } ?>
        </li>
        <?php } ?>
    </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($categories) { ?>
      <p><strong><?php echo $text_index; ?></strong>
        <?php foreach ($categories as $category) { ?>
        &nbsp;&nbsp;&nbsp;<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
        <?php } ?>
      </p>
      <?php foreach ($categories as $category) { ?>
      <h2 id="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></h2>
      <?php if ($category['manufacturer']) { ?>
      <?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>
      <div class="row">
        <?php foreach ($manufacturers as $manufacturer) { ?>
        <div class="col-sm-2"><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php } ?>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>