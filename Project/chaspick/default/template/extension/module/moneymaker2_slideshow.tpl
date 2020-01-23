<div class="row">
  <div id="moneymaker2_slideshow<?php echo $module; ?>" class="<?php if ($hidden_xs) { ?>hidden-xs <?php } ?>owl-carousel owl-moneymaker2 owl-moneymaker2-slideshow<?php if ($tilt3d) { ?> tilt3d<?php } ?><?php if ($background_style) { ?> owl-moneymaker2-slideshow-<?php echo $background_style; ?><?php } ?><?php if ($transparency_hover) { ?> owl-moneymaker2-slideshow-trans-hover<?php } ?> owl-moneymaker2-slideshow-border-<?php echo $border_style; ?>">
      <?php foreach ($banners_settings as $key => $banners_setting) { ?>
      <div class="item"<?php if ($tilt3d) { ?> data-tilt data-tilt-scale="1.05" data-tilt-perspective="2000" data-tilt-speed="800" data-tilt-max="10"<?php } ?>>
        <div class="item-text <?php echo $banners_setting['position']; ?> <?php echo $banners_setting['text_style']; ?> /*col-sm-12*/ col-md-<?php echo $banners_setting['text_width']; ?> text-center">
          <?php if ($banners_setting['title']) { ?><div<?php if ($banners_setting['title_spacing']) { ?> class="spacing"<?php } ?>><?php echo $banners_setting['title']; ?></div><?php } ?><span class="hidden-xs"></span>
          <?php if ($banners_setting['text']) { ?><p class="<?php if ($tilt3d) { ?>hidden-xxs<?php } else { ?>hidden-xs<?php } ?><?php if ($banners_setting['text_spacing']) { ?> spacing<?php } ?>"><?php echo $banners_setting['text']; ?></p><?php } ?>
          <?php if ($banners_setting['link']||$banners_setting['multilink']) { ?><p><a href="<?php echo $banners_setting['multilink'] ? $banners_setting['multilink'] : $banners_setting['link']; ?>" title="<?php echo $banners_setting['title']; ?>" class="btn <?php if (!$banners_setting['minimize']) { ?>btn-lg<?php } ?> btn-<?php echo $banners_setting['btn_style']; ?>"><?php echo $banners_setting['btn_title']; ?></a></p><?php } ?>
        </div>
        <img src="<?php echo $banners_setting['image']; ?>" alt="<?php echo $banners_setting['title']; ?>" class="img-responsive" />
      </div>
      <?php } ?>
  </div>
</div>
<script type="text/javascript"><!--
  <?php if ($parallax) { ?>
    $('head').append('<style type="text/css"> #moneymaker2_slideshow<?php echo $module; ?> { overflow: hidden; } @media (min-width: 320px) { #moneymaker2_slideshow<?php echo $module; ?>, #moneymaker2_slideshow<?php echo $module; ?> .owl-item .item { height: <?php echo $parallax_heights["xxxsm"]; ?>px; } } @media (min-width: 450px) { #moneymaker2_slideshow<?php echo $module; ?>, #moneymaker2_slideshow<?php echo $module; ?> .owl-item .item { height: <?php echo $parallax_heights["xxsm"]; ?>px; } } @media (min-width: 560px) { #moneymaker2_slideshow<?php echo $module; ?>, #moneymaker2_slideshow<?php echo $module; ?> .owl-item .item { height: <?php echo $parallax_heights["xsm"]; ?>px; } } @media (min-width: 768px) { #moneymaker2_slideshow<?php echo $module; ?>, #moneymaker2_slideshow<?php echo $module; ?> .owl-item .item { height: <?php echo $parallax_heights["sm"]; ?>px; } } @media (min-width: 992px) { #moneymaker2_slideshow<?php echo $module; ?>, #moneymaker2_slideshow<?php echo $module; ?> .owl-item .item { height: <?php echo $parallax_heights["md"]; ?>px; } } @media (min-width: 1200px) { #moneymaker2_slideshow<?php echo $module; ?>, #moneymaker2_slideshow<?php echo $module; ?> .owl-item .item { height: <?php echo $parallax_heights["lg"]; ?>px; } } </style>');
  <?php } ?>
  <?php if ($fullwidth) { ?>
    $('#moneymaker2_slideshow<?php echo $module; ?>').unwrap();
    $('#moneymaker2_slideshow<?php echo $module; ?>').detach().insertAfter( $('body header') );
    $('#moneymaker2_slideshow<?php echo $module; ?>').addClass('owl-moneymaker2-top');
    positionSlideshow();
    var waitForFinalEvent = (function () {
      var timers = {};
      return function (callback, ms, uniqueId) {
        if (!uniqueId) {
          uniqueId = "uniqueId";
        }
        if (timers[uniqueId]) {
          clearTimeout (timers[uniqueId]);
        }
        timers[uniqueId] = setTimeout(callback, ms);
      };
    })();
    $(window).on("resize", function() {
      waitForFinalEvent(function(){
          positionSlideshow();
      }, 100, "positionSlideshow");
    });
    function positionSlideshow() {
      if ($('.hidden-xs').is(":visible")) {
      <?php if (isset($moneymaker2_header_strip_bg_transparency)&&$moneymaker2_header_strip_bg_transparency<100) { ?>
      $('head style[class^="moneymaker2_slideshow_style"]').remove();
      $('head').append('<style class="moneymaker2_slideshow_style<?php echo $module; ?>" type="text/css">@media (min-width: 768px) { body.owl-moneymaker2-fullscreen #moneymaker2_slideshow<?php echo $module; ?> { top: -' + ($('#top').height()+$('#menu').height()) + 'px; margin-bottom: -' + ($('#top').height()+$('#menu').height()) + 'px;} } </style>');
      <?php } ?>
      }
    <?php if ($navigation||$pagination) { ?>BackgroundCheck.refresh();<?php } ?>
    }
    $('body').addClass('owl-moneymaker2-fullscreen');
  <?php } ?>
  <?php if ($fullwidth_bottom) { ?>
    $('#moneymaker2_slideshow<?php echo $module; ?>').unwrap();
    $('#moneymaker2_slideshow<?php echo $module; ?>').detach().insertAfter( $('body > .container') );
    $('#moneymaker2_slideshow<?php echo $module; ?>').addClass('owl-moneymaker2-bottom');
    $('body').addClass('owl-moneymaker2-fullscreen-bottom');
  <?php } ?>

  $('#moneymaker2_slideshow<?php echo $module; ?>').owlCarousel({
  itemsCustom : [[0, 1], [320, <?php echo isset($items['xxxsm']) ? $items['xxxsm'] : 1; ?>], [450, <?php echo isset($items['xxsm']) ? $items['xxsm'] : 1; ?>], [560, <?php echo isset($items['xsm']) ? $items['xsm'] : 1; ?>], [768, <?php echo $items['sm']; ?>], [992, <?php echo $items['md']; ?>], [1200, <?php echo $items['lg']; ?>]],
  <?php if ($animation) { ?>
  transitionStyle : '<?php echo $animation_in; ?>',
  <?php } ?>
  <?php if ($navigation) { ?>
  navigation: true,
  <?php if (!$navigation_zone) { ?>
  navigationText: ['<span class="arrow-left"></span>', '<span class="arrow-right"></span>'],
  <?php } else { ?>
  navigationText: ['', ''],
  <?php } ?>
  <?php } else { ?>
  navigation: false,
  <?php } ?>
  <?php if ($pagination) { ?>
  pagination: true,
  <?php } else { ?>
  pagination: false,
  <?php } ?>
  <?php if ($navigation||$pagination) { ?>
  afterAction: function() {
    setTimeout(function () {
      BackgroundCheck.refresh();
    }, 720);
  },
  <?php } ?>
  <?php if ($autoplay) { ?>
  autoPlay: true,
  stopOnHover: true,
    <?php if ($autoplay_timeout&&$autoplay_timeout>0) { ?>
    autoPlay: <?php echo $autoplay_timeout*1000; ?>,
    <?php } ?>
  <?php } ?>
});
<?php if (($parallax&&$fullwidth)||($parallax&&$fullwidth_bottom)) { ?>
    $(window).scroll( $.throttle(100, parallaxSlideshow<?php echo $module; ?>));
    function parallaxSlideshow<?php echo $module; ?>() {
      if ($('.hidden-xs').is(":visible")) {
      <?php if ($fullwidth) { ?>
          var wScroll = $(this).scrollTop();
        <?php } else if ($fullwidth_bottom) { ?>
          var wScroll = $(this).scrollTop() + $(window).height() - ($('#moneymaker2_slideshow<?php echo $module; ?>').offset().top - $('header').offset().top);
        <?php } ?>
        wScroll = (wScroll * 0.1 * <?php echo $parallax_speed; ?>) - 1;
      <?php if (!$parallax_invert) { ?>
          if (wScroll<($("#moneymaker2_slideshow<?php echo $module; ?> .item img").height()-$( "#moneymaker2_slideshow<?php echo $module; ?>" ).height())) {
            $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-webkit-transform', 'translate(0px, -' + wScroll + 'px)');
            $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-moz-transform', 'translate(0px, -' + wScroll + 'px)');
            $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-ms-transform', 'translate(0px, -' + wScroll + 'px)');
            $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-o-transform', 'translate(0px, -' + wScroll + 'px)');
            $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('transform', 'translate(0px, -' + wScroll + 'px)');
          } else {
            $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-webkit-transform', 'translate(0px, -' + ($( "#moneymaker2_slideshow<?php echo $module; ?> .item img" ).height()-$( "#moneymaker2_slideshow<?php echo $module; ?>" ).height()-1) + 'px)');
            $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-moz-transform', 'translate(0px, -' + ($( "#moneymaker2_slideshow<?php echo $module; ?> .item img" ).height()-$( "#moneymaker2_slideshow<?php echo $module; ?>" ).height()-1) + 'px)');
            $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-ms-transform', 'translate(0px, -' + ($( "#moneymaker2_slideshow<?php echo $module; ?> .item img" ).height()-$( "#moneymaker2_slideshow<?php echo $module; ?>" ).height()-1) + 'px)');
            $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-o-transform', 'translate(0px, -' + ($( "#moneymaker2_slideshow<?php echo $module; ?> .item img" ).height()-$( "#moneymaker2_slideshow<?php echo $module; ?>" ).height()-1) + 'px)');
            $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('transform', 'translate(0px, -' + ($( "#moneymaker2_slideshow<?php echo $module; ?> .item img" ).height()-$( "#moneymaker2_slideshow<?php echo $module; ?>" ).height()-1) + 'px)');
          }
        <?php } else { ?>
          $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-webkit-transform', 'translate(0px, ' + wScroll + 'px)');
          $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-moz-transform', 'translate(0px, ' + wScroll + 'px)');
          $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-ms-transform', 'translate(0px, ' + wScroll + 'px)');
          $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-o-transform', 'translate(0px, ' + wScroll + 'px)');
          $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('transform', 'translate(0px, ' + wScroll + 'px)');
        <?php } ?>
      }
    }
<?php } ?>
//--></script>
<?php if ($tilt3d) { ?><script src="catalog/view/javascript/jquery/moneymaker2/vanilla-tilt.min.js" type="text/javascript"></script><?php } ?>
