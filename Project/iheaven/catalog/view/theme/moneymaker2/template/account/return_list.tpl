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
            <i class="fa fa-archive fa-stack-1x fa-inverse"></i>
          </span>
        </div>
      </div>
      <hr class="catalog-hr">
      <?php if ($returns) { ?>
      <br />
      <div class="table-responsive">
      <table class="table">
        <thead>
          <tr>
            <td class="text-right"><?php echo $column_return_id; ?></td>
            <td class="text-left"><?php echo $column_status; ?></td>
            <td class="text-left"><?php echo $column_date_added; ?></td>
            <td class="text-right"><?php echo $column_order_id; ?></td>
            <td class="text-left"><?php echo $column_customer; ?></td>
            <td></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($returns as $return) { ?>
          <tr>
            <td class="text-right">#<?php echo $return['return_id']; ?></td>
            <td class="text-left"><?php echo $return['status']; ?></td>
            <td class="text-left"><?php echo $return['date_added']; ?></td>
            <td class="text-right"><?php echo $return['order_id']; ?></td>
            <td class="text-left"><?php echo $return['name']; ?></td>
            <td class="text-right"><a href="<?php echo $return['href']; ?>" title="<?php echo $button_view; ?>" class="text-nowrap"><i class="fa fa-file-text"></i> <?php echo $button_view; ?></a></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      </div>
      <div class="text-center"><?php echo $pagination; ?><p><small><?php echo $results; ?></small></p></div>
      <?php } else { ?>
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
<?php echo $footer; ?>
