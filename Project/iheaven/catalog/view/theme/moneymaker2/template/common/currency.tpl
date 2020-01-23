<?php if (count($currencies) > 1) { ?>
<?php if ($moneymaker2_header_strip_currency>1) { ?>
<li class="dropdown" id="currency-dropdown">
  <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"><?php echo $moneymaker2_header_strip_currency_icon; ?> <span class="<?php echo $moneymaker2_header_strip_currency_class; ?>"><?php echo $text_currency; ?> <i class="fa fa-angle-down"></i></span></a>
  <ul class="dropdown-menu keep-open">
    <li class="hidden">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">
        <input type="hidden" name="code" value="" />
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
      </form>
    </li>
    <?php foreach ($currencies as $currency) { ?>
    <li <?php if ($currency['code'] == $code) { ?>class="active"<?php } ?>><a href="javascript:void(0);" onclick="$('input[name=\'code\']').val('<?php echo $currency['code']; ?>'); $('#form-currency').submit();">&nbsp;<span><?php if ($currency['symbol_left']) { echo $currency['symbol_left']; } else { echo $currency['symbol_right']; } ?></span>&nbsp;&nbsp; <?php echo $currency['title']; ?></a></li>
    <?php } ?>
  </ul>
</li>
<?php } else { ?>
<li>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">
    <ul class="dropdown-menu">
      <li class="dropdown-header"><?php echo $text_currency; ?></li>
      <li class="hidden">
        <input type="hidden" name="code" value="" />
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
      </li>
      <?php foreach ($currencies as $currency) { ?>
      <li <?php if ($currency['code'] == $code) { ?>class="active"<?php } ?>><a href="javascript:void(0);" onclick="$('input[name=\'code\']').val('<?php echo $currency['code']; ?>'); $('#form-currency').submit();">&nbsp;<span><?php if ($currency['symbol_left']) { echo $currency['symbol_left']; } else { echo $currency['symbol_right']; } ?></span>&nbsp;&nbsp; <?php echo $currency['title']; ?></a></li>
      <?php } ?>
    </ul>
  </form>
</li>
<li role="separator" class="divider clearfix"></li>
<?php } ?>
<?php } ?>
