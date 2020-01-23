<?php if (count($languages) > 1) { ?>
<?php if (!isset($moneymaker2_header_strip_language)) $moneymaker2_header_strip_language = 3; ?>
<?php if (!isset($moneymaker2_header_strip_language_class)) $moneymaker2_header_strip_language_class = "hidden-lg hidden-md hidden-sm visible-xlg"; ?>
<?php if ($moneymaker2_header_strip_language>1) { ?>
<li class="dropdown" id="language-dropdown">
  <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-globe"></i> <span class="<?php echo $moneymaker2_header_strip_language_class; ?>"><?php echo $text_language; ?> <i class="fa fa-angle-down"></i></span></a>
  <ul class="dropdown-menu keep-open">
    <li class="hidden">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">
        <input type="hidden" name="code" value="" />
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
      </form>
    </li>
    <?php foreach ($languages as $language) { ?>
    <li <?php if ($language['code'] == $code) { ?>class="active"<?php } ?>><a href="javascript:void(0);" class="language-select" onclick="$('input[name=\'code\']').val('<?php echo $language['code']; ?>'); $('#form-language').submit();"><span><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>"></span>&nbsp; <?php echo $language['name']; ?></a></li>
    <?php } ?>
  </ul>
</li>
<?php } else { ?>
<li>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">
    <ul class="dropdown-menu">
      <li class="dropdown-header"><?php echo $text_language; ?></li>
      <li class="hidden">
        <input type="hidden" name="code" value="" />
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
      </li>
      <?php foreach ($languages as $language) { ?>
      <li <?php if ($language['code'] == $code) { ?>class="active"<?php } ?>><a href="javascript:void(0);" class="language-select" onclick="$('input[name=\'code\']').val('<?php echo $language['code']; ?>'); $('#form-language').submit();"><span><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>"></span>&nbsp; <?php echo $language['name']; ?></a></li>
      <?php } ?>
    </ul>
  </form>
</li>
<li role="separator" class="divider clearfix"></li>
<?php } ?>
<?php } ?>
