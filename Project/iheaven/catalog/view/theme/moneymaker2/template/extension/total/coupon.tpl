<div class="panel panel-default">
  <div class="panel-heading">
    <h4 class="panel-title"><a href="#collapse-coupon" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $heading_title; ?> <i class="fa fa-caret-down"></i></a></h4>
  </div>
  <div id="collapse-coupon" class="panel-collapse collapse">
    <div class="panel-body">
      <label class="col-sm-2 control-label" for="input-coupon"><?php echo $entry_coupon; ?></label>
      <div class="input-group">
        <input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="<?php echo $entry_coupon; ?>" id="input-coupon" class="form-control" />
        <span class="input-group-btn">
        <input type="button" value="<?php echo $button_coupon; ?>" id="button-coupon" data-loading-text="<?php echo $text_loading; ?>"  class="btn btn-primary" />
        </span></div>
      <script type="text/javascript"><!--
$('#button-coupon').on('click', function() {
	$.ajax({
		url: 'index.php?route=extension/total/coupon/coupon',
		type: 'post',
		data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
		dataType: 'json',
		beforeSend: function() {
			$('#button-coupon').button('loading');
		},
		complete: function() {
			$('#button-coupon').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
        $('#popupModal .modal-header .close').removeClass('hidden');
        $('#popupModal .modal-title').text('<?php echo $heading_title; ?>');
        $('#popupModal .modal-body').prepend('<div class="panel panel-danger"><div class="panel-heading text-center"><small>' + json['error'] + '</small></div></div>');
        $('#popupModal').modal();
			}

			if (json['redirect']) {
				location = json['redirect'];
			}
		}
	});
});
//--></script>
    </div>
  </div>
</div>
