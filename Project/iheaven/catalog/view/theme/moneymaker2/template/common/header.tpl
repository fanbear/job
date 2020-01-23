<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<!-- mmr2 2.6.4 ocs2.3 -->
<style>@font-face{font-display:swap;font-family:'Open Sans';font-style:normal;font-weight:300;src: url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-300.eot');src: local('Open Sans Light'), local('OpenSans-Light'),url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-300.eot?#iefix') format('embedded-opentype'),url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-300.woff2') format('woff2'),url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-300.woff') format('woff'),url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-300.ttf') format('truetype'),url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-300.svg#OpenSans') format('svg')}@font-face{font-display:swap;font-family:'Open Sans';font-style:normal;font-weight:400;src: url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-regular.eot');src: local('Open Sans'), local('OpenSans'),url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-regular.eot?#iefix') format('embedded-opentype'),url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-regular.woff2') format('woff2'),url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-regular.woff') format('woff'),url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-regular.ttf') format('truetype'),url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-regular.svg#OpenSans') format('svg')}@font-face{font-display:swap;font-family:'Open Sans';font-style:normal;font-weight:700;src: url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-700.eot');src: local('Open Sans Bold'), local('OpenSans-Bold'),url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-700.eot?#iefix') format('embedded-opentype'),url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-700.woff2') format('woff2'),url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-700.woff') format('woff'),url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-700.ttf') format('truetype'),url('catalog/view/theme/moneymaker2/fonts/open-sans-v13-latin-ext_latin_cyrillic-700.svg#OpenSans') format('svg')}@font-face{font-display:swap;font-family:'FontAwesome';font-weight:normal;font-style:normal;src: url('../fonts/fontawesome-webfont.eot?v=4.7.0');src: url('catalog/view/javascript/font-awesome/fonts/fontawesome-webfont.eot?#iefix&v=4.7.0') format('embedded-opentype'),url('catalog/view/javascript/font-awesome/fonts/fontawesome-webfont.woff2?v=4.7.0') format('woff2'),url('catalog/view/javascript/font-awesome/fonts/fontawesome-webfont.woff?v=4.7.0') format('woff'),url('catalog/view/javascript/font-awesome/fonts/fonts/fontawesome-webfont.ttf?v=4.7.0') format('truetype'),url('catalog/view/javascript/font-awesome/fonts/fonts/fontawesome-webfont.svg?v=4.7.0#fontawesomeregular') format('svg')}</style>
<?php if ($moneymaker2_common_minify) { ?>
  <?php foreach ($moneymaker2_minify['ext_css'] as $value) { ?>
  <link href="<?php echo $value['href']; ?>" type="text/css" rel="<?php echo $value['rel']; ?>" media="<?php echo $value['media']; ?>" />
  <?php } ?>
  <link href="min/?g=moneymaker2_css<?php echo $moneymaker2_minify['int_css'] ? "&f=".implode(',', $moneymaker2_minify['int_css']) : ''; ?>&v=264" rel="preload" as="style">
  <link href="min/?g=moneymaker2_css<?php echo $moneymaker2_minify['int_css'] ? "&f=".implode(',', $moneymaker2_minify['int_css']) : ''; ?>&v=264" rel="stylesheet">
  <?php foreach ($links as $link) { ?>
  <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
  <?php } ?>
  <?php foreach ($moneymaker2_minify['ext_js'] as $value) { ?>
  <script src="<?php echo $value; ?>"></script>
  <?php } ?>
  <link href="min/?g=moneymaker2_js<?php echo $moneymaker2_minify['int_js'] ? "&f=".implode(',', $moneymaker2_minify['int_js']) : ''; ?>&v=264" rel="preload" as="script">
  <script src="min/?g=moneymaker2_js<?php echo $moneymaker2_minify['int_js'] ? "&f=".implode(',', $moneymaker2_minify['int_js']) : ''; ?>&v=264"></script>
<?php } else { ?>
  <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js"></script>
  <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
  <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
  <script src="catalog/view/javascript/jquery/moneymaker2/velocity.min.js"></script>
  <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css?v=264" rel="stylesheet" type="text/css" />
  <link href="catalog/view/theme/moneymaker2/stylesheet/fonts.css" rel="stylesheet">
  <link rel="stylesheet" href="catalog/view/theme/moneymaker2/stylesheet/custom.min.css">
  <script src="catalog/view/javascript/common.moneymaker2.js?v=264"></script>
  <?php foreach ($styles as $style) { ?>
  <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
  <?php } ?>
  <?php foreach ($links as $link) { ?>
  <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
  <?php } ?>
  <?php foreach ($scripts as $script) { ?>
  <script src="<?php echo $script; ?>"></script>
  <?php } ?>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
<header>
  <nav id="top" class="navbar navbar-default navbar-full<?php if ($moneymaker2_header_strip_fixed) { ?> navbar-fixed-top<?php } ?>">
    <div class="container">
      <div class="navbar-header">
        <?php if (!$moneymaker2_header_strip_expanded) { ?>
        <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-top-collapse, .navbar-menu-collapse"><i class="fa fa-fw fa-bars"></i></a>
        <?php if ($moneymaker2_header_strip_toggle_language&&$language) { ?>
        <a href="javascript:void(0);" class="navbar-language-toggle visible-xs"><i class="fa fa-fw fa-globe" ></i></a>
        <?php } ?>
        <?php if ($moneymaker2_header_strip_toggle_search) { ?>
        <a href="javascript:void(0);" class="navbar-search-toggle visible-xs"><i class="fa fa-fw fa-search" ></i></a>
        <?php } ?>
        <?php if ($moneymaker2_header_strip_toggle_cart) { ?>
        <a href="javascript:void(0);" class="navbar-cart-toggle visible-xs"><i class="fa fa-fw fa-shopping-cart" ></i><small class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><span class="fa-stack-1x"><?php echo $moneymaker2_header_cart_items; ?></span></small></a>
        <?php } ?>
        <?php } ?>
        <div id="logo">
          <?php if ($moneymaker2_header_logo_custom) { ?>
            <?php if ($home == $moneymaker2_header_url) { ?>
              <span class="fa-stack fa-lg"><i class="fa fa-circle fa-inverse fa-stack-2x"></i><i class="fa fa-<?php echo $moneymaker2_header_logo_custom_icon; ?> fa-stack-1x"></i></span>
              <span class="text-primary"><?php echo $moneymaker2_header_logo_custom_header; ?></span>
              <small><?php echo $moneymaker2_header_logo_custom_caption; ?></small>
            <?php } else { ?>
              <a href="<?php echo $home; ?>">
                <span class="fa-stack fa-lg"><i class="fa fa-circle fa-inverse fa-stack-2x"></i><i class="fa fa-<?php echo $moneymaker2_header_logo_custom_icon; ?> fa-stack-1x"></i></span>
                <span class="text-primary"><?php echo $moneymaker2_header_logo_custom_header; ?></span>
                <small><?php echo $moneymaker2_header_logo_custom_caption; ?></small>
              </a>
            <?php } ?>
          <?php } else { ?>
            <?php if ($logo) { ?>
              <?php if ($home == $moneymaker2_header_url) { ?>
              <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
              <?php } else { ?>
              <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
              <?php } ?>
            <?php } else { ?>
            <h2><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h2>
            <?php } ?>
          <?php } ?>
        </div>
      </div>
      <div class="hidden-xs"></div>
      <div class="collapse navbar-collapse navbar-top-collapse">
        <ul class="nav navbar-nav">
          <li class="dropdown" id="contacts">
            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-<?php echo $moneymaker2_header_contacts_icon ? $moneymaker2_header_contacts_icon : 'mobile'; ?>"></i> <span class="phone"><?php echo $moneymaker2_header_contacts_phone ? $moneymaker2_header_contacts_phone : $telephone; ?></span> <?php if ($moneymaker2_header_contacts||$moneymaker2_modules_callback_enabled) { ?><span class="hidden-sm"><?php echo $moneymaker2_header_contacts_title; ?> </span><i class="fa fa-angle-down"></i><?php } ?></a>
            <?php if ($moneymaker2_header_contacts||$moneymaker2_modules_callback_enabled) { ?>
            <ul class="dropdown-menu">
              <?php if ($moneymaker2_modules_callback_enabled) { ?>
              <li class="dropdown-header keep-open"><?php echo $moneymaker2_modules_callback_header; ?></li>
              <li><button type="button" data-toggle="modal" data-target="#orderModal" <?php if ($moneymaker2_modules_callback_image) { ?>data-order-img-src="<?php echo $moneymaker2_modules_callback_image; ?>"<?php } ?> data-order-mode="callback" data-order-title="<?php echo $moneymaker2_modules_callback_header; ?>"><i class="fa fa-lg fa-fw fa-volume-control-phone"></i> <?php echo $moneymaker2_modules_callback_caption; ?></button></li>
              <li class="divider"></li>
              <?php } ?>
              <?php foreach ($moneymaker2_header_contacts as $key => $value) { ?>
              <?php if ($value['mode']) { ?>
              <?php if ($value['mode']==1) { ?>
              <li class="dropdown-header keep-open"><?php echo $value['text']; ?></li>
              <?php } else if ($value['mode']==2) { ?>
              <?php if ($value['link']||$value['multilink']) { ?>
              <li class="keep-open"><a href="<?php echo $value['multilink'] ? $value['multilink'] : $value['link']; ?>"><?php if ($value['image']) { ?><span class="fa fa-fw fa-lg"><img src="<?php echo $value['image']; ?>" alt="<?php echo $value['text']; ?>" /></span><?php } ?> <?php echo $value['text']; ?></a></li>
              <?php } else { ?>
              <li class="keep-open"><span class="text-muted"><?php if ($value['image']) { ?><span class="fa fa-fw fa-lg"><img src="<?php echo $value['image']; ?>" alt="<?php echo $value['text']; ?>" /></span><?php } ?> <?php echo $value['text']; ?></span></li>
              <?php } ?>
              <?php } else if ($value['mode']==3) { ?>
              <?php if ($value['link']||$value['multilink']) { ?>
              <li class="keep-open"><a href="<?php echo $value['multilink'] ? $value['multilink'] : $value['link']; ?>"><i class="fa fa-lg fa-fw fa-<?php echo $value['icon']; ?>"></i> <?php echo $value['text']; ?></a></li>
              <?php } else { ?>
              <li class="keep-open"><span class="text-muted"><i class="fa fa-lg fa-fw fa-<?php echo $value['icon']; ?>"></i> <?php echo $value['text']; ?></span></li>
              <?php } ?>
              <?php } else if ($value['mode']==4) { ?>
              <li class="divider"></li>
              <?php } ?>
              <?php } ?>
              <?php } ?>
            </ul>
            <?php } ?>
          </li>
          <?php if (!$moneymaker2_header_categories_menu_hide) { ?>
          <li class="dropdown<?php if ($moneymaker2_header_categories_menu_mod) { ?> navbar-full-fw<?php } ?> categories-menu">
            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-th-large"></i> <?php echo $moneymaker2_header_categories_menu_caption ? $moneymaker2_header_categories_menu_caption : $text_category; ?> <i class="fa fa-angle-down"></i></a>
            <?php if ($categories||$moneymaker2_header_banners) { ?>
            <?php if (!$moneymaker2_header_categories_menu_mod) { ?>
            <ul class="dropdown-menu keep-open">
              <?php foreach ($categories as $key => $category) { ?>
              <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
              <?php if (!$moneymaker2_header_categories_menu_hidechilds) { ?>
              <?php if ($category['children']) { ?>
              <?php foreach ($category['children'] as $children) { ?>
              <li><a href="<?php echo $children['href']; ?>"><small>- <?php echo $children['name']; ?></small></a></li>
              <?php } ?>
              <?php } ?>
              <?php } ?>
              <?php if (!$moneymaker2_header_categories_menu_hidechilds) { ?>
              <?php if ($key+1 < count($categories)) { ?>
              <li role="separator" class="divider"></li>
              <?php } ?>
              <?php } ?>
              <?php } ?>
            </ul>
            <?php } else { ?>
            <ul class="dropdown-menu keep-open">
              <li>
                <div>
                  <div class="row">
                    <?php foreach ($header_categories as $key => $category) { ?>
                    <ul class="col-sm-<?php echo $moneymaker2_header_categories_menu_columns['sm'][0]; ?> col-md-<?php echo $moneymaker2_header_categories_menu_columns['md'][0]; ?> col-lg-<?php echo $moneymaker2_header_categories_menu_columns['lg'][0]; ?> list-unstyled">
                      <?php if ($category['href']) { ?><li class="text-center"><a href="<?php echo $category['href']; ?>"><?php if (!$moneymaker2_header_categories_menu_hidethumbs&&$category['image']) { ?><div class="hidden-xs"><img class="img-thumbnail" src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>" /></div><?php } ?><div class="btn btn-<?php if(isset($category['style'])&&$category['style']) { ?><?php echo $category['style']; ?><?php } else { ?>default<?php } ?> btn-block"><?php if ($moneymaker2_common_categories_icons_enabled&&$category['icon']&&$moneymaker2_header_categories_menu_icons) { ?><i class="fa fa-fw fa-<?php echo $category['icon']; ?>"></i><?php } ?> <?php echo $category['name']; ?></div></a></li><?php } ?>
                      <?php if (!$moneymaker2_header_categories_menu_hidechilds) { ?>
                      <?php if ($category['children']) { ?>
                      <?php foreach ($category['children'] as $children) { ?>
                      <li><a class="text-muted" href="<?php echo $children['href']; ?>"><small>&ndash; <?php echo $children['name']; ?></small></a></li>
                      <?php } ?>
                      <?php } ?>
                      <?php } ?>
                      <?php if(isset($category['text'])&&$category['text']) { ?>
                      <li><?php echo $category['text']; ?></li>
                      <?php } ?>
                    </ul>
                    <?php if (($key+1)%$moneymaker2_header_categories_menu_columns['sm'][1]==0) { ?><div class="clearfix visible-sm"></div><?php } ?>
                    <?php if (($key+1)%$moneymaker2_header_categories_menu_columns['md'][1]==0) { ?><div class="clearfix visible-md"></div><?php } ?>
                    <?php if (($key+1)%$moneymaker2_header_categories_menu_columns['lg'][1]==0) { ?><div class="clearfix visible-lg"></div><?php } ?>
                    <?php } ?>
                  </div>
                </div>
              </li>
            </ul>
            <?php } ?>
            <?php } ?>
          </li>
          <?php } ?>
          <?php if ($moneymaker2_header_menu_links_top_enabled&&$moneymaker2_header_links) { ?>
          <?php foreach ($moneymaker2_header_links as $value) { ?>
            <?php if (strpos($value['caption'], '::')) { ?>
              <?php $subvalue['title'] = substr($value['caption'], 0, strpos($value['caption'], '::')); ?>
              <?php $subvalue['caption'] = explode(', ', substr($value['caption'], strpos($value['caption'], '::')+3, strlen($value['caption']))); ?>
              <?php $subvalue['link'] = $value['multilink'] ? explode(', ', $value['multilink']) : explode(', ', $value['link']); ?>
              <?php if (count($subvalue['caption'])==count($subvalue['link'])) { ?>
                <li class="dropdown">
                  <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-<?php echo $value['icon']; ?>"></i> <?php echo $subvalue['title']; ?> <i class="fa fa-angle-down"></i></a>
                  <ul class="dropdown-menu">
                    <?php for ($i = 0; $i < count($subvalue['caption']); $i++) { ?>
                      <li><a href="<?php echo $subvalue['link'][$i]; ?>"><?php echo $subvalue['caption'][$i]; ?></a></li>
                    <?php } ?>
                  </ul>
                </li>
              <?php } ?>
            <?php } else { ?>
              <li><a href="<?php echo $value['multilink'] ? $value['multilink'] : $value['link']; ?>"><i class="fa fa-fw fa-<?php echo $value['icon']; ?>"></i> <?php echo $value['caption']; ?></a></li>
            <?php } ?>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php if ($moneymaker2_header_search_moved) { ?>
        <div id="search" class="navbar-form navbar-left">
          <div class="form-group">
            <ul class="keep-open list-unstyled">
              <li>
                <div class="input-group collapse">
                  <input type="text" name="search" value="" placeholder="<?php echo $text_search; ?>" class="form-control"><span class="input-group-btn"><button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button></span>
                </div>
              </li>
            </ul>
          </div>
        </div>
        <?php } ?>
        <ul class="nav navbar-nav navbar-right">
          <?php if (!$moneymaker2_common_buy_hide) { ?>
          <?php echo $cart; ?>
          <?php } ?>
          <?php if (!$moneymaker2_header_search_moved) { ?>
          <?php echo $search; ?>
          <?php } ?>
          <?php if ($moneymaker2_header_strip_language>1) { ?>
          <?php echo $language; ?>
          <?php } ?>
          <?php if ($moneymaker2_header_strip_currency>1) { ?>
          <?php echo $currency; ?>
          <?php } ?>
          <li class="dropdown" id="top-links">
            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-bars"></i> <span class="<?php echo $moneymaker2_header_strip_menu_class; ?>"><?php echo $text_menu; ?> <i class="fa fa-angle-down"></i></span></a>
            <ul class="dropdown-menu keep-open">
              <?php if ($moneymaker2_header_menu_links_enabled&&$moneymaker2_header_links) { ?>
              <li class="dropdown-header"><?php echo $moneymaker2_header_menu_links_caption; ?></li>
              <?php foreach ($moneymaker2_header_links as $value) { ?>
              <li><a href="<?php echo $value['multilink'] ? $value['multilink'] : $value['link']; ?>"><i class="fa fa-fw fa-<?php echo $value['icon']; ?>"></i> <?php echo $value['caption']; ?></a></li>
              <?php } ?>
              <li class="divider"></li>
              <?php } ?>
              <?php if ($moneymaker2_header_strip_language==1) { ?>
              <?php echo $language; ?>
              <?php } ?>
              <?php if ($moneymaker2_header_strip_currency==1) { ?>
              <?php echo $currency; ?>
              <?php } ?>
              <?php if (!$logged) { ?>
              <li class="dropdown-header"><?php echo $text_account; ?></li>
              <li><a href="<?php echo $login; ?>" rel="nofollow"><i class="fa fa-fw fa-sign-in"></i> <?php echo $text_login; ?> / <?php echo $text_register; ?></a></li>
              <?php } else { ?>
              <li class="dropdown-header"><?php echo $moneymaker2_text_customer_name; ?></li>
              <li><a href="<?php echo $account; ?>" rel="nofollow"><i class="fa fa-fw fa-user"></i> <?php echo $text_account; ?></a></li>
              <?php } ?>
              <?php if (!$moneymaker2_common_wishlist_hide) { ?>
              <li><a href="<?php echo $wishlist; ?>" rel="nofollow"><i class="fa fa-fw fa-heart"></i> <span id="wishlist-total"><span><?php echo $text_wishlist; ?></span></span></a></li>
              <?php } ?>
              <?php if (!$moneymaker2_common_compare_hide) { ?>
              <li><a href="<?php echo $compare; ?>" rel="nofollow"><i class="fa fa-fw fa-area-chart"></i> <span id="compare-total"><?php echo $text_compare; ?></span></a></li>
              <?php } ?>
              <?php if ($logged) { ?>
              <li class="divider"></li>
              <li><a href="<?php echo $logout; ?>" rel="nofollow"><i class="fa fa-fw fa-sign-out"></i> <?php echo $text_logout; ?></a></li>
              <?php } ?>
            </ul>
          </li>
          <?php if ($moneymaker2_header_categories_panel&&$moneymaker2_header_strip_expanded&&!$moneymaker2_header_categories_panel_expanded) { ?>
          <li class="dropdown visible-xs">
            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="collapse" data-target=".navbar-menu-collapse"><i class="fa fa-fw fa-th-large"></i> <?php echo $moneymaker2_header_categories_menu_caption ? $moneymaker2_header_categories_menu_caption : $text_category; ?> <i class="fa fa-angle-down"></i></a>
          </li>
          <?php } ?>
        </ul>
      </div>
    </div>
  </nav>
  <?php if ($moneymaker2_header_categories_panel) { ?>
  <nav class="navbar navbar-default navbar-full categories-menu<?php if ($moneymaker2_header_categories_panel_fixed&&$moneymaker2_header_strip_fixed) { ?> navbar-fixed-top<?php } ?>" id="menu">
    <div class="container">
      <div class="collapse navbar-collapse navbar-menu-collapse">
        <ul class="nav navbar-nav">
          <?php if (!$moneymaker2_header_categories_panel_mod&&!$moneymaker2_header_categories_panel_hideparents) { ?>
            <?php foreach ($categories as $key => $category) { ?>
            <li class="dropdown">
              <?php if ($category['children']) { ?>
              <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"><?php if ($moneymaker2_common_categories_icons_enabled&&$category['icon']&&$moneymaker2_header_categories_panel_icons) { ?><i class="fa fa-fw fa-<?php echo $category['icon']; ?>"></i> <?php } ?><?php echo $category['name']; ?> <i class="fa fa-angle-down"></i></a>
              <ul class="dropdown-menu keep-open">
                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                <?php foreach ($category['children'] as $children) { ?>
                <li><a class="text-muted" href="<?php echo $children['href']; ?>"><small>&ndash; <?php echo $children['name']; ?></small></a></li>
                <?php } ?>
              </ul>
              <?php } else { ?>
              <a href="<?php echo $category['href']; ?>"><?php if ($moneymaker2_common_categories_icons_enabled&&$category['icon']&&$moneymaker2_header_categories_panel_icons) { ?><i class="fa fa-fw fa-<?php echo $category['icon']; ?>"></i> <?php } ?><?php echo $category['name']; ?></a>
              <?php } ?>
            </li>
            <?php } ?>
          <?php } else if (!$moneymaker2_header_categories_panel_hideparents) { ?>
            <?php foreach ($categories as $key => $category) { ?>
            <li class="dropdown navbar-full-fw">
              <?php if ($category['children']) { ?>
              <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"><?php if ($moneymaker2_common_categories_icons_enabled&&$category['icon']&&$moneymaker2_header_categories_panel_icons) { ?><i class="fa fa-fw fa-<?php echo $category['icon']; ?>"></i> <?php } ?><?php echo $category['name']; ?> <i class="fa fa-angle-down"></i></a>
              <ul class="dropdown-menu keep-open">
                <li>
                  <div>
                    <div class="row">
                      <ul class="col-parent-category col-sm-<?php echo $moneymaker2_header_categories_panel_columns['sm'][0]; ?> col-md-<?php echo $moneymaker2_header_categories_panel_columns['md'][0]; ?> col-lg-<?php echo $moneymaker2_header_categories_panel_columns['lg'][0]; ?> list-unstyled">
                        <li class="text-center"><a href="<?php echo $category['href']; ?>"><?php if (!$moneymaker2_header_categories_panel_hidethumbs&&$category['image']) { ?><div class="hidden-xs"><img class="img-thumbnail" src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>" /></div><?php } ?><div class="btn btn-link btn-block"><?php if ($moneymaker2_common_categories_icons_enabled&&$category['icon']&&$moneymaker2_header_categories_panel_child_icons) { ?><i class="fa fa-fw fa-<?php echo $category['icon']; ?>"></i><?php } ?> <?php echo $category['name']; ?></div></a></li>
                        <?php if ($category['description']) { ?>
                        <li><p><small><?php echo $category['description']; ?></small></p></li>
                        <?php } ?>
                      </ul>
                      <?php foreach ($category['children'] as $key => $children) { ?>
                      <ul class="col-sm-<?php echo $moneymaker2_header_categories_panel_columns['sm'][0]; ?> col-md-<?php echo $moneymaker2_header_categories_panel_columns['md'][0]; ?> col-lg-<?php echo $moneymaker2_header_categories_panel_columns['lg'][0]; ?> list-unstyled">
                        <?php if ($children['href']) { ?><li class="text-center"><a href="<?php echo $children['href']; ?>"><?php if (!$moneymaker2_header_categories_panel_hidethumbs&&$children['child_image']) { ?><div class="hidden-xs"><img class="img-thumbnail" src="<?php echo $children['child_image']; ?>" alt="<?php echo $children['name']; ?>" /></div><?php } ?><div class="btn btn-<?php if(isset($children['style'])&&$children['style']) { ?><?php echo $children['style']; ?><?php } else { ?>default<?php } ?> btn-block"><?php if ($moneymaker2_common_categories_icons_enabled&&$children['icon']&&$moneymaker2_header_categories_panel_child_icons) { ?><i class="fa fa-fw fa-<?php echo $children['icon']; ?>"></i><?php } ?> <?php echo $children['name']; ?></div></a></li><?php } ?>
                        <?php if (!$moneymaker2_header_categories_panel_hidechilds) { ?>
                        <?php if ($children['children']) { ?>
                        <?php foreach ($children['children'] as $child) { ?>
                        <li><a class="text-muted" href="<?php echo $child['href']; ?>"><small>&ndash; <?php echo $child['name']; ?></small></a></li>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                        <?php if(isset($children['text'])&&$children['text']) { ?>
                        <li><?php echo $children['text']; ?></li>
                        <?php } ?>
                      </ul>
                      <?php if (($key+2)%$moneymaker2_header_categories_panel_columns['sm'][1]==0) { ?><div class="clearfix visible-sm"></div><?php } ?>
                      <?php if (($key+2)%$moneymaker2_header_categories_panel_columns['md'][1]==0) { ?><div class="clearfix visible-md"></div><?php } ?>
                      <?php if (($key+2)%$moneymaker2_header_categories_panel_columns['lg'][1]==0) { ?><div class="clearfix visible-lg"></div><?php } ?>
                      <?php } ?>
                    </div>
                  </div>
                </li>
              </ul>
              <?php } else { ?>
              <a href="<?php echo $category['href']; ?>"><?php if ($moneymaker2_common_categories_icons_enabled&&$category['icon']&&$moneymaker2_header_categories_panel_icons) { ?><i class="fa fa-fw fa-<?php echo $category['icon']; ?>"></i> <?php } ?><?php echo $category['name']; ?></a>
              <?php } ?>
            </li>
            <?php } ?>
          <?php } ?>
          <?php foreach ($moneymaker2_header_panellinks as $value) { ?>
            <li><a href="<?php echo $value['multilink'] ? $value['multilink'] : $value['link']; ?>"><i class="fa fa-fw fa-<?php echo $value['icon']; ?>"></i> <?php echo $value['caption']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
    </div>
  </nav>
  <?php } ?>
</header>
