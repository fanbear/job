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
      <h1 class="h2 text-center content-title"><?php echo $text_address_book; ?></h1>
      <div class="row catalog-thumb">
        <div class="col-sm-12 text-center">
          <span class="fa-stack fa-2x img-thumbnail">
            <i class="fa fa-circle fa-stack-2x"></i>
            <i class="fa fa-map-marker fa-stack-1x fa-inverse"></i>
          </span>
        </div>
      </div>
      <?php if ($addresses) { ?>
      <br />
      <div class="table-responsive">
      <table class="table">
        <?php foreach ($addresses as $result) { ?>
        <tr>
          <td class="text-left"><?php echo $result['address']; ?></td>
          <td class="text-right"><a href="<?php echo $result['update']; ?>" class="text-nowrap"><i class="fa fa-edit"></i> <?php echo $button_edit; ?></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="text-nowrap text-special"><i class="fa fa-times"></i> <?php echo $button_delete; ?></a></td>
        </tr>
        <?php } ?>
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
      <p class="text-center">
        <a href="<?php echo $add; ?>" class="btn btn-primary"><?php echo $button_new_address; ?></a>
        <br />
        <a href="<?php echo $back; ?>" class="btn btn-link"><?php echo $button_back; ?></a>
      </p>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
  $(document).ready(function() {
    <?php if ($error_warning) { ?>
      $('#popupModal .modal-header .close').removeClass('hidden');
      $('#popupModal .modal-title').text('<?php echo $heading_title; ?>');
      $('#popupModal .modal-body').prepend('<div class="panel panel-danger"><div class="panel-heading text-center"><small><?php echo $error_warning; ?></small></div></div>');
      $('#popupModal').modal();
    <?php } ?>
    <?php if ($success) { ?>
      $('#popupModal .modal-header .close').removeClass('hidden');
      $('#popupModal .modal-title').text('');
      $('#popupModal .modal-body').prepend('<div class="panel panel-info"><div class="panel-heading text-center"><small><?php echo $success; ?></small></div></div>');
      $('#popupModal').modal();
    <?php } ?>
  });
  //--></script>
<?php echo $footer; ?>