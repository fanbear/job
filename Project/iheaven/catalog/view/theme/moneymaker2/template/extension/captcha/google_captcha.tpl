<script src="//www.google.com/recaptcha/api.js?hl=<?php echo $lang; ?>"></script>
<div class="form-group required">
  <?php if (substr($route, 0, 9) == 'checkout/') { ?>
  <label class="control-label" for="input-payment-captcha"><?php echo $entry_captcha; ?></label>
  <div id="input-payment-captcha" class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
  <?php if ($error_captcha) { ?>
  <div class="text-danger"><?php echo $error_captcha; ?></div>
  <?php } ?>
  <?php } else { ?>
  <div class="col-sm-offset-2 col-sm-10">
    <div id="input-payment-captcha" class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
    <?php if ($error_captcha) { ?>
    <div class="text-danger"><?php echo $error_captcha; ?></div>
    <?php } ?>
  </div>
  <?php } ?>
</div>
