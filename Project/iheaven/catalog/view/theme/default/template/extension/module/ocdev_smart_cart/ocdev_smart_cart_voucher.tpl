<input type="text" name="smca_voucher" value="<?php echo $voucher; ?>" placeholder="<?php echo $entry_voucher; ?>" id="smca-input-voucher" />
<input type="submit" value="<?php echo $button_voucher; ?>" id="smca-button-voucher" data-loading-text="<?php echo $text_loading; ?>" class="next-step-button" />
<script type="text/javascript"><!--
$('#smca-button-voucher').on('click', function() {
  maskElement('#check-data', true);
  $.ajax({
    url: 'index.php?route=extension/module/ocdev_smart_cart/voucher',
    type: 'post',
    data: 'smca_voucher=' + encodeURIComponent($('input[name=\'smca_voucher\']').val()),
    dataType: 'json',
    beforeSend: function() {
      $('#smca-button-voucher').button('loading');
    },
    complete: function() {
      $('#smca-button-voucher').button('reset');
    },
    success: function(json) {
      $('.field-error').remove();
      if (json['error']) {
        maskElement('#check-data', false);
        $('input[name=\'smca_voucher\']').addClass('error-style').after('<span class="error-text field-error">' + json['error'] + '</span>');
      } else {
        maskElement('#check-data', false);
        $('input[name=\'smca_voucher\']').removeClass('error-style').after('<span id="smca-voucher-success">' + json['success'] + '</span>').fadeIn();
        $('#smca-voucher-success').delay(3000).fadeOut();
      }
    }
  });
});
//-->
</script>