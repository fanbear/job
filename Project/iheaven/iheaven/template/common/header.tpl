<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title><?php echo $title;  ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<!-- <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script> -->
<script src="catalog/view/theme/iheaven/js/jquery-3.4.1.min.js"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/iheaven/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
<link rel="stylesheet" href="catalog/view/theme/iheaven/stylesheet/owl.carousel.css">
<link href="catalog/view/theme/iheaven/stylesheet/iheaven.min.css" rel="stylesheet">
<link rel="stylesheet" href="catalog/view/theme/iheaven/stylesheet/animate.min.css">
</head>
<body class="<?php echo $class; ?>">
  <!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MCMRVL8"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
<div class="container-fluid top_banner" style="padding: 0">
  <div class="sale-b"></div>
</div>
<nav id="top">
  
  <div class="container">
    
    <div class="row">
      <div class="col-sm-7 col-xs-12 top-menu">
        <a href="https://iheaven.com.ua/">Главная</a>
        <a href="/specials/">Акции</a>
        <a href="/delivery">Оплата и Доставка</a>
        <a href="/wishlist/">Избранное</a>
        <a href="<?php echo $shopping_cart; ?>" rel="nofollow">Корзина</a>
        <a href="/kontaktyshop">Контакты</a>
      </div>
      <div class="col-sm-5 col-xs-12 top-info">
        <div class="row">
            <div class="social col-sm-8 col-xs-12">
              <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
              <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
              <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
            </div>
            <div class="adress col-sm-4 col-xs-12">
              <p>Офис, город Киев</p>
              <p>улица, Герцена 6</p>
            </div>
        </div>
        
      </div>
    </div>
    <!-- <?php echo $currency; ?>
    <?php echo $language; ?>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>
        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
      </ul>
    </div> -->
  </div>
</nav>
<header>
  <div class="container">
    <div class="row head-middle">
      <div class="col-sm-3 col-xs-12">
        <div id="logo">
          <?php if ($logo) { ?>
            <?php if ($home == $og_url) { ?>
               <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
            <?php } else { ?>
              <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
            <?php } ?>
          <?php } else { ?>
            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-2 col-xs-12">
        <div class="phone" id="phone">
          <p><a href="tel:380635782890">+38 (063) 578-28-90</a><img id="addtional-open" src="/image/catalog/arrow-head.png" alt="arrow-head"></p>
          <p class="call-back"><a class="imcallask-click" href="#">Заказать звонок</a></p>
          <div class="additional">
            <p><a href="tel:380688645239">+38 (068) 864-52-39</a></p>
            <p><a href="tel:380445782890">+38 (044) 578-28-90</a></p>
          </div>
        </div>
      </div>
      <div class="col-sm-5 col-xs-12"><?php echo $search; ?>
      </div>

      <div class="col-sm-2 col-xs-12 cart-block">
          <div class="col-sm-4 col-xs-4">
               <div class="wishilis"><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i></a></div>
          </div>
          <div class="col-sm-4 col-xs-4">
                <div class="login">
                  <i class="fa fa-sign-in" aria-hidden="true"></i>
                  <div class="login-togle">
                      <p><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></p>
                      <p><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></p>
                  </div>
                </div>
          </div>
          <div class="col-sm-4 col-xs-4"><div class="cart"><?php echo $cart; ?> </div></div>
      </div>
    <!-- mobile -->
      <div class="col-xs-9 cart-block" id="cart-block-mobile">
       
          <div class="col-xs-3">
               <div class="wishilis"><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i></a></div>
          </div>
          <div class="col-xs-3">
                <div class="login">
                  <i class="fa fa-sign-in" aria-hidden="true"></i>
                  <div class="login-togle">
                      <p><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></p>
                      <p><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></p>
                  </div>
                </div>
          </div>
          
          <div class="col-xs-3">
            <div class="phone-open"><i class="fa fa-phone-square"></i></div>
            <div class="open-mob">
                <p><a href="tel:+38054562132">+38 (063)-333-33-22</a></p>
                <p><a href="tel:+38054562132">+38 (063)-333-33-22</a></p>
                <p><a href="tel:+38054562132">+38 (063)-333-33-22</a></p>
            </div>
          </div>
          <div class="col-xs-3"><div class="cart"><?php echo $cart; ?> </div></div>
      </div>
    </div>
  </div>
</header>
<?php if ($categories) { ?>
<!-- <div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div> -->
<?php } ?>
