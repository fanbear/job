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
            <i class="fa fa-users fa-stack-1x fa-inverse"></i>
          </span>
        </div>
      </div>
      <div class="row catalog-descr">
        <div class="col-sm-12 text-center">
          <div>
            <?php echo $text_description; ?>
          </div>
        </div>
      </div>
      <hr class="catalog-hr">
      <br />
      <div class="row">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="col-sm-12 form-horizontal" role="form">
          <fieldset>
            <legend><?php echo $text_returning_affiliate; ?></legend>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
              <div class="col-lg-8 col-sm-10">
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
              <div class="col-lg-8 col-sm-10">
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                <a href="<?php echo $forgotten; ?>"><small><?php echo $text_forgotten; ?></small></a>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-12 text-center">
                <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />
                <?php if ($redirect) { ?>
                <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                <?php } ?>
              </div>
            </div>
          </fieldset>
        </form>
      </div>
      <br />
      <div class="row">
        <fieldset class="col-sm-12 text-center">
          <legend><?php echo $text_new_affiliate; ?></legend>
          <?php echo $text_register_account; ?>
          <p><a class="btn btn-sm btn-default" href="<?php echo $register; ?>"><?php echo $button_continue; ?></a></p>
        </fieldset>
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
    <?php if ($error_warning) { ?>
      $('#popupModal .modal-header .close').removeClass('hidden');
      $('#popupModal .modal-title').text('<?php echo $heading_title; ?>');
      $('#popupModal .modal-body').prepend('<div class="panel panel-danger"><div class="panel-heading text-center"><small><?php echo $error_warning; ?></small></div></div>');
      $('#popupModal').modal();
    <?php } ?>
  });
  //--></script>
<?php echo $footer; ?>