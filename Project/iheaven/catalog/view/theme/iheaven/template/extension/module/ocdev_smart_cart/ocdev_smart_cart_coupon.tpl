<input type="text" name="smca_coupon" value="<?php echo $coupon; ?>" placeholder="<?php echo $entry_coupon; ?>" id="smca-input-coupon" />
<input type="button" value="<?php echo $button_coupon; ?>" id="smca-button-coupon" data-loading-text="<?php echo $text_loading; ?>" class="next-step-button" />
<script type="text/javascript"><!--
	$('#smca-button-coupon').on('click', function() {
		maskElement('#check-data', true);
		$.ajax({
			url: 'index.php?route=extension/module/ocdev_smart_cart/coupon',
			type: 'post',
			data: 'smca_coupon=' + encodeURIComponent($('input[name=\'smca_coupon\']').val()),
			dataType: 'json',
			beforeSend: function() {
				$('#smca-button-coupon').button('loading');
			},
			complete: function() {
				$('#smca-button-coupon').button('reset');
			},
			success: function(json) {
				$('.field-error').remove();
				if (json['error']) {
					maskElement('#check-data', false);
					$('input[name=\'smca_coupon\']').addClass('error-style').after('<span class="error-text field-error">' + json['error'] + '</span>');
				} else {
					maskElement('#check-data', false);
					$('input[name=\'smca_coupon\']').removeClass('error-style').after('<span id="smca-coupon-success">' + json['success'] + '</span>').fadeIn();
					$('#smca-coupon-success').delay(3000).fadeOut();
				}
			}
		});
	});
//-->
</script>