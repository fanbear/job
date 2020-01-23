<div class="block_with_feedback" style="padding: 15px; margin-bottom:20px; border: 1px solid #ddd; background-color: #f5f5f5; border-radius: 3px;">
  <?php if($heading_title) { ?>
  <h3 style="margin-top: 0"><?php echo $heading_title; ?></h3>
  <?php } ?>
  <?php if($text_main) { ?>
  <p><?php echo $text_main; ?></p>
  <?php } ?>
  <button type="button"  id="button_feedback" class="btn btn-primary" data-toggle="modal" data-target="#modalFeedback"><?php echo $text_button; ?></button>
</div>
<div class="modal fade" id="modalFeedback" tabindex="-1" role="dialog" aria-labelledby="modalFeedbackLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <div style="display:inline-block; width: 100%; text-align:right;">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form class="form-horizontal" id="form-feedback">
          <div class="form-group required">
            <div class="col-sm-12">
              <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
            </div>
            <div class="col-sm-12">
              <label class="control-label" for="input-phone"><?php echo $entry_phone; ?></label>
              <input type="text" name="phone" value="<?php echo $phone; ?>" id="input-phone" class="form-control" />
            </div>
            <?php if($email_active == 1) { ?>
            <div class="col-sm-12">
              <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
            </div>
            <?php } ?>
            <div class="col-sm-12">
              <label class="control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
              <textarea name="enquiry" rows="5" id="input-enquiry" class="form-control"></textarea>
            </div>
          </div>
          <?php echo $captcha; ?>
        </form>
        <button type="button" id="button_send_feedback" data-loading-text="<?php echo $text_loading; ?>"  class="btn btn-primary"><?php echo $text_send; ?></button>
      </div>
    </div>
  </div>
</div>
<script>
  $('#button_send_feedback').on('click', function () {
    $.ajax({
      url: 'index.php?route=extension/module/feedback/write',
      type: 'post',
      dataType: 'json',
      data: $("#form-feedback").serialize(),
      beforeSend: function () {
        $('#button_send_feedback').button('loading');
      },
      complete: function () {
        $('#button_send_feedback').button('reset');
      },
      success: function (json) {
        $('.alert-success, .alert-danger').remove();

        if (json['error']) {
          $('#form-feedback').after('<div class="alert alert-danger" style="margin:20px 0;"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
        }
        if (json['success']) {
          $('#form-feedback').after('<div class="alert alert-success" style="margin:20px 0;"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
          
          $('input[name=\'name\']').val('');
          $('input[name=\'phone\']').val('');
          $('input[name=\'email\']').val('');
          $('textarea[name=\'enquiry\']').val('');
        }
      }
    });
  });
</script>