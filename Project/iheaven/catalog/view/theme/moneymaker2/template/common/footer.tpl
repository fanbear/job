<footer>
  <div class="container">
    <div class="row">
      <?php if (!$moneymaker2_footer_information_hide) { ?>
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <div class="h5 text-muted"><i class="fa fa-fw fa-book"></i> <?php echo $text_information; ?></div>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if (!$moneymaker2_footer_customer_hide) { ?>
      <div class="col-sm-3">
        <div class="h5 text-muted"><i class="fa fa-fw fa-wrench"></i> <?php echo $text_service; ?></div>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <?php } ?>
      <?php if (!$moneymaker2_footer_extras_hide) { ?>
      <div class="col-sm-3">
        <div class="h5 text-muted"><i class="fa fa-fw fa-tags"></i> <?php echo $text_extra; ?></div>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <?php } ?>
      <?php if (!$moneymaker2_footer_account_hide) { ?>
      <div class="col-sm-3">
        <div class="h5 text-muted"><i class="fa fa-fw fa-user"></i> <?php echo $text_account; ?></div>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
      <?php } ?>
      <?php if ($moneymaker2_footer_contacts_enabled) { ?>
        <?php if ($moneymaker2_footer_contacts) { ?>
          <div class="col-sm-3">
            <div class="h5 text-muted"><i class="fa fa-fw fa-<?php echo $moneymaker2_footer_contacts_icon; ?>"></i> <?php echo $moneymaker2_footer_contacts_title; ?></div>
            <ul class="list-unstyled">
              <?php foreach ($moneymaker2_footer_contacts as $key => $value) { ?>
                <?php if ($value['link']||$value['multilink']) { ?>
                  <li><a href="<?php echo $value['multilink'] ? $value['multilink'] : $value['link']; ?>"><?php echo $value['caption']; ?></a></li>
                <?php } else { ?>
                  <li><?php echo $value['caption']; ?></li>
                <?php } ?>
              <?php } ?>
            </ul>
          </div>
        <?php } ?>
      <?php } ?>
      <?php if ($moneymaker2_footer_links_enabled) { ?>
        <?php if ($moneymaker2_footer_links) { ?>
          <div class="col-sm-3">
            <div class="h5 text-muted"><i class="fa fa-fw fa-<?php echo $moneymaker2_footer_links_icon; ?>"></i> <?php echo $moneymaker2_footer_links_title; ?></div>
            <ul class="list-unstyled">
              <?php foreach ($moneymaker2_footer_links as $key => $value) { ?>
                <?php if ($value['link']||$value['multilink']) { ?>
                  <li><a href="<?php echo $value['multilink'] ? $value['multilink'] : $value['link']; ?>"><?php echo $value['caption']; ?></a></li>
                <?php } else { ?>
                  <li><?php echo $value['caption']; ?></li>
                <?php } ?>
              <?php } ?>
            </ul>
          </div>
        <?php } ?>
      <?php } ?>
      <?php if ($moneymaker2_footer_text1_enabled) { ?>
        <?php if ($moneymaker2_footer_text1) { ?>
          <div class="col-sm-3">
            <div class="h5 text-muted"><i class="fa fa-fw fa-<?php echo $moneymaker2_footer_text1_icon; ?>"></i> <?php echo $moneymaker2_footer_text1_title; ?></div>
            <ul class="list-unstyled">
              <li><?php echo $moneymaker2_footer_text1; ?></li>
            </ul>
          </div>
        <?php } ?>
      <?php } ?>
      <?php if ($moneymaker2_footer_text2_enabled) { ?>
        <?php if ($moneymaker2_footer_text2) { ?>
          <div class="col-sm-3">
            <div class="h5 text-muted"><i class="fa fa-fw fa-<?php echo $moneymaker2_footer_text2_icon; ?>"></i> <?php echo $moneymaker2_footer_text2_title; ?></div>
            <ul class="list-unstyled">
              <li><?php echo $moneymaker2_footer_text2; ?></li>
            </ul>
          </div>
        <?php } ?>
      <?php } ?>
      <?php if ($moneymaker2_modules_newsletter_enabled) { ?>
      <div class="col-sm-3">
        <div class="h5 text-muted"><i class="fa fa-fw fa-envelope-o"></i> <?php echo $moneymaker2_modules_newsletter_header; ?></div>
        <ul class="list-unstyled">
          <li><?php echo $moneymaker2_modules_newsletter_caption; ?></li>
          <li>
            <div class="input-group input-group-sm">
              <input type="text" id="newsletteremail" autocomplete="email" value="<?php echo $moneymaker2_customer_email; ?>" placeholder="<?php echo $text_quickorder_email; ?>" class="form-control">
          <span class="input-group-btn">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#orderModal" data-order-mode="newsletter" <?php if ($moneymaker2_modules_newsletter_image) { ?>data-order-img-src="<?php echo $moneymaker2_modules_newsletter_image; ?>"<?php } ?> data-order-title="<?php echo $moneymaker2_modules_newsletter_header; ?>"><i class="fa fa-fw fa-angle-right"></i></button>
          </span>
            </div>
          </li>
        </ul>
      </div>
      <?php } ?>
    </div>
  </div>
  <div class="bottom">
    <div class="container">
      <div class="row">
        <div class="col-sm-9">
          <?php if ($moneymaker2_footer_socials_enabled) { ?>
            <?php if ($moneymaker2_footer_socials) { ?>
              <?php foreach ($moneymaker2_footer_socials as $key => $value) { ?>
                <a <?php if ($moneymaker2_footer_socials_target_blank) { ?>target="_blank" rel="noopener" <?php } ?>href="<?php echo $value['multilink'] ? $value['multilink'] : $value['link']; ?>"><span data-toggle="tooltip" title="<?php echo $value['caption']; ?>" class="fa-stack bg-<?php echo $value['icon']; ?> fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-<?php echo $value['icon']; ?> fa-stack-1x fa-inverse"></i></span></a>
              <?php } ?>
            <?php } ?>
          <?php } ?>
        </div>
        <?php if (!$moneymaker2_footer_copyrights_hide) { ?>
        <div class="col-sm-3">
          <?php if (!$moneymaker2_footer_powered_hide) { ?>
            <?php echo $powered; ?><br />
          <?php } ?>
          <?php if ($moneymaker2_footer_powered_custom_enabled) { ?>
            <?php if ($moneymaker2_footer_powered_custom_text) { ?>
              <?php echo $moneymaker2_footer_powered_custom_text; ?><br />
            <?php } ?>
            <?php echo $moneymaker2_footer_powered_custom_title; ?> &copy; <?php if ($moneymaker2_footer_powered_custom_year) { ?><?php echo $moneymaker2_footer_powered_custom_year; ?> &ndash; <?php } ?><?php echo date("Y"); ?>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
    </div>
  </div>
</footer>
<div class="modal fade" id="infoModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <p class="modal-title h4 text-center"></p>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-link" data-dismiss="modal"><?php echo $button_back; ?></button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="popupModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close hidden" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <p class="modal-title h4 text-center"></p>
        <div class="hidden" data-compare-title="<?php echo $text_compare; ?>" data-compare-link="<?php echo $compare; ?>" data-wishlist-title="<?php echo $text_wishlist; ?>" data-wishlist-link="<?php echo $wishlist; ?>"></div>
      </div>
      <div class="modal-body"></div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-link btn-shopping hidden" data-dismiss="modal"><?php echo $button_shopping; ?></button>
        <button type="button" class="btn btn-sm btn-link btn-back" data-dismiss="modal"><?php echo $button_back; ?></button>
      </div>
    </div>
  </div>
</div>

<?php if ($moneymaker2_modules_quickorder_enabled||$moneymaker2_modules_callback_enabled||$moneymaker2_modules_newsletter_enabled) { ?>
<div class="modal fade" id="orderModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <input type="hidden" name="product_id" value="0" />
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <p class="modal-title h4 text-center"></p>
      </div>
      <div class="modal-body">
        <input type="hidden" name="quantity" value="1">
        <div class="row">
          <div class="col-sm-12">
            <img class="img-responsive center-block" src="image/no_image.png" title="" alt="" />
            <div class="hidden"></div>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12">
            <p class="text-center h3"></p>
          </div>
        </div>
        <div class="form-horizontal">
          <div class="form-group required">
            <label for="quickorderemail" class="col-sm-3 control-label"><?php echo $text_quickorder_email; ?></label>
            <div class="col-sm-8">
              <input type="email" class="form-control" id="quickorderemail" name="quickorderemail" placeholder="<?php echo $text_quickorder_email_help; ?>" value="<?php echo $moneymaker2_customer_email; ?>">
              <span class="quickorderemail form-control-feedback hidden"><i class="fa fa-check"></i></span>
            </div>
          </div>
          <div class="form-group required">
            <label for="quickorderphone" class="col-sm-3 control-label"><?php echo $text_quickorder_phone; ?></label>
            <div class="col-sm-8">
              <input type="tel" pattern="[0-9]*" class="form-control" id="quickorderphone" name="quickorderphone">
              <span class="quickorderphone form-control-feedback hidden"><i class="fa fa-check"></i></span>
            </div>
          </div>
          <div class="form-group optional">
            <label for="quickordername" class="col-sm-3 control-label"><?php echo $text_optional; ?></label>
            <div class="col-sm-3">
              <input type="text" class="form-control" id="quickordername" name="quickordername" placeholder="<?php echo $text_quickorder_name; ?>" value="<?php echo $moneymaker2_customer_name; ?>">
              <span class="quickordername form-control-feedback hidden"><i class="fa fa-check"></i></span>
            </div>
            <div class="col-sm-5">
              <input type="text" class="form-control" id="quickordercomment" name="quickordercomment" placeholder="<?php echo $text_quickorder_comment; ?>">
              <span class="quickordercomment form-control-feedback hidden"><i class="fa fa-check"></i></span>
            </div>
          </div>
          <div class="form-group">
            <div class="panel panel-info"><div class="panel-heading text-center"><small><?php echo $text_quickorder_help; ?></small></div></div>
          </div>
          <?php if ($text_agree) { ?>
          <div class="form-group">
            <div class="col-sm-10 col-sm-offset-1 text-center">
              <div class="checkbox">
                <label>
                  <input type="checkbox" id="quickorderagree"  name="quickorderagree" value="1" /> <?php echo $text_agree; ?>
                </label>
              </div>
            </div>
          </div>
          <?php } ?>
        </div>
        <div class="buttons">
          <p class="text-center">
            <button type="button" class="btn btn-primary"><i class="fa fa-fw fa-flip-horizontal fa-reply-all"></i> <?php echo $button_submit; ?></button>
          </p>
          <p class="text-center">
            <button type="button" class="btn btn-sm btn-default" data-dismiss="modal"><?php echo $button_shopping; ?></button>
          </p>
        </div>
      </div>
      <div class="modal-body2"></div>
    </div>
  </div>
</div>
<?php } ?>

<?php if ($moneymaker2_common_scrolltop) { ?>
<script><!--
  $('body').append('<div class="toggle-scroll-top btn btn-default hidden-xs"><i class="fa fa-fw fa-angle-up"></i><?php echo $moneymaker2_common_scrolltop_text; ?></div>');
  //--></script>
<?php } ?>
<?php if ($moneymaker2_common_sidebars_responsive) { ?>
<script><!--
  if ( $('#column-left').length ) {
    $('body').append('<div class="toggle-column-left hidden-xs hidden-sm hidden-lg hidden-md"><div class="btn btn-sm btn-default"><i class="fa fa-angle-down"></i>&nbsp; <?php echo $button_left_panel; ?></div></div>');
  }
  if ( $('#column-right').length ) {
    $('body').append('<div class="toggle-column-right hidden-xs hidden-sm hidden-lg hidden-md"><div class="btn btn-sm btn-default"><i class="fa fa-angle-up"></i>&nbsp; <?php echo $button_right_panel; ?></div></div>');
  }
  //--></script>
<?php } ?>

<script><!--
  $(document).ready(function() {
    $(window).load(function(){
      var oldSSB = $.fn.modal.Constructor.prototype.setScrollbar;
      $.fn.modal.Constructor.prototype.setScrollbar = function () {
        oldSSB.apply(this);
        if(this.bodyIsOverflowing && this.scrollbarWidth) {
          $('.navbar-fixed-top, .navbar-fixed-bottom').css('padding-right', this.scrollbarWidth);
        }
      }
      var oldRSB = $.fn.modal.Constructor.prototype.resetScrollbar;
      $.fn.modal.Constructor.prototype.resetScrollbar = function () {
        oldRSB.apply(this);
        $('.navbar-fixed-top, .navbar-fixed-bottom').css('padding-right', '');
      }
    });

    $('.navbar-cart-toggle').click(function(e) {
      e.stopPropagation();
      if ( !$('#top .navbar-collapse').hasClass('in')&&$('#top .navbar-toggle').length ) {
        $('#top').addClass('cart-opened');
        $('.navbar-toggle').click();
        $('#top').on('shown.bs.collapse', function () {
          if ( !$('#cart').hasClass('open')&&$('#top').hasClass('cart-opened') ) {
            $('#cart > .dropdown-toggle').click();
            $("#cart > .dropdown-toggle").velocity("scroll", { duration: 1000 });
          }
        })
      } else if (($('#top .navbar-collapse').hasClass('in')&&!$('#cart').hasClass('open'))||(!$('#top .navbar-toggle').length&&!$('#cart').hasClass('open'))) {
        $('#cart > .dropdown-toggle').click();
        $("#cart > .dropdown-toggle").velocity("scroll", { duration: 1000 });
      } else if ($('#cart').hasClass('open')) {
        $('#cart > .dropdown-toggle').click();
      }
      $('.dropdown').on('hide.bs.dropdown', function () {
        $('#top').removeClass('cart-opened');
      })
    });
    $('.navbar-search-toggle').click(function(e) {
      e.stopPropagation();
      if ( !$('#top .navbar-collapse').hasClass('in')&&$('#top .navbar-toggle').length ) {
        $('#top').addClass('search-opened');
        $('.navbar-toggle').click();
        $('#top').on('shown.bs.collapse', function () {
          if ( !$('#search').hasClass('open')&&$('#top').hasClass('search-opened') ) {
            $('#search > .dropdown-toggle').click();
            $("#search").velocity("scroll", { duration: 1000 });
          }
        })
      } else if (($('#top .navbar-collapse').hasClass('in')&&!$('#search').hasClass('open'))||(!$('#top .navbar-toggle').length&&!$('#search').hasClass('open'))) {
        $('#search > .dropdown-toggle').click();
        setTimeout(' $("#search > .dropdown-toggle").velocity("scroll", { duration: 1000 }); ', 300);
      } else if ($('#search').hasClass('open')) {
        $('#search > .dropdown-toggle').click();
      }
      $('.dropdown').on('hide.bs.dropdown', function () {
        $('#top').removeClass('search-opened');
      })
    });
    $('.navbar-language-toggle').click(function(e) {
      e.stopPropagation();
      if ( !$('#top .navbar-collapse').hasClass('in')&&$('#top .navbar-toggle').length ) {
        $('#top').addClass('language-opened');
        $('.navbar-toggle').click();
        $('#top').on('shown.bs.collapse', function () {
          if ( !$('#language-dropdown').hasClass('open')&&$('#top').hasClass('language-opened') ) {
            $('#language-dropdown > .dropdown-toggle').click();
            $("#language-dropdown > .dropdown-toggle").velocity("scroll", { duration: 1000 });
          }
        })
      } else if (($('#top .navbar-collapse').hasClass('in')&&!$('#language-dropdown').hasClass('open'))||(!$('#top .navbar-toggle').length&&!$('#language-dropdown').hasClass('open'))) {
        $('#language-dropdown > .dropdown-toggle').click();
        setTimeout(' $("#language-dropdown > .dropdown-toggle").velocity("scroll", { duration: 1000 }); ', 300);
      } else if ($('#language-dropdown').hasClass('open')) {
        $('#language-dropdown > .dropdown-toggle').click();
      }
      $('.dropdown').on('hide.bs.dropdown', function () {
        $('#top').removeClass('language-opened');
      })
    });

    $(document).on('show.bs.modal', '.modal', function (event) {
      var zIndex = 1040 + (10 * $('.modal:visible').length);
      $(this).css('z-index', zIndex);
      setTimeout(function() {
        $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
      }, 0);
    });
    $(document).on('hidden.bs.modal', '.modal', function () {
      $('.modal:visible').length && $(document.body).addClass('modal-open');
    });


    $('#search a.dropdown-toggle').click(function() { setTimeout('$("#search > ul > li > div > input").focus()', 300); });
    <?php if ($moneymaker2_common_dropdown_hover) { ?>
    if ($('.hidden-xs').is(":visible")) {
      $('.dropdown-toggle').dropdownHover({delay: 100, hoverDelay: 100});
    }
    <?php } ?>

    <?php if ($moneymaker2_modules_quickorder_enabled||$moneymaker2_modules_callback_enabled||$moneymaker2_modules_newsletter_enabled) { ?>
    $('#orderModal').on('hidden.bs.modal', function (event) {
      if (($("#popupModal").data('bs.modal') || {}).isShown) $('#popupModal').modal('hide');
      <?php if (isset($moneymaker2_modules_quickorder_checkout_page)&&$moneymaker2_modules_quickorder_checkout_page) { ?>
      if ( ($("#orderModal .panel").hasClass('panel-success')) ) window.location = 'index.php?route=checkout/success';
      <?php } ?>
      $('#orderModal .panel-default').remove();
    })
    $('#popupModal').on('hidden.bs.modal', function (event) {
      $('#popupModal').css('opacity', '1');
    })

    $('#orderModal').on('show.bs.modal', function (event) {
      if (($("#popupModal").data('bs.modal') || {}).isShown) $('#popupModal').css('opacity', '0');
      var target = $(event.relatedTarget);
      var mode = target.data('order-mode');
      var product_id = target.data('order-product-id');
      var title = target.data('order-title');
      var img_src = target.data('order-img-src');
      var price = target.data('order-price') && target.data('order-price').toString().replace(":", " ");
      var modal = $(this);
      modal.find('.modal-body2').html('');
      modal.find('.modal-header input').val(product_id);
      if (mode=="cart") {
        $('#orderModal').find('.modal-body2').load('index.php?route=common/cart/info ul', function() {
          $('#orderModal .modal-body2 > ul').removeClass('dropdown-menu keep-open');
          $('#orderModal .modal-body2 > ul').addClass('list-unstyled');
          $('#orderModal .modal-body2 > ul > li > div.text-center').remove();
          $('#orderModal .modal-body2 > ul > li > table > tbody').prepend('<tr><td colspan="5"><hr></td></tr>');
          $('#orderModal .modal-body2 > ul > li table td.text-center > a.text-muted').remove();
        });
      }
      if (mode=="product") {
          modal.find('.modal-body input[type=\'hidden\']').val($("#input-quantity").val());
          if ($(".autocalc-product-price")[0]&&!$(".autocalc-product-special")[0]) {
              price = $(".autocalc-product-price").first().text();
          } else if ($(".autocalc-product-special")[0]) {
              price = $(".autocalc-product-special").first().text();
          } else {
              if ($("#input-quantity").val() > 1) price = price + ' x ' + $("#input-quantity").val();
          }
      }
      modal.find('.modal-title.h4').text(title);
      modal.find('.img-responsive').addClass("hidden");
      modal.find('.img-responsive').parent().find('div').addClass("hidden");
      $('#quickorderemail').attr("placeholder", "<?php echo $text_quickorder_email_help; ?>");
      if (img_src!==0&&typeof img_src!=='undefined') {
        modal.find('.img-responsive').removeClass("hidden");
        modal.find('.img-responsive').attr("src",img_src);
      }
      if (mode=="product" || mode=="catalog" || mode=="cart") {
        modal.find('.modal-dialog .form-group.required:first-child').removeClass('hidden');
        modal.find('.modal-dialog .form-group.required:nth-child(2)').removeClass('hidden');
        modal.find('.modal-dialog .form-group.optional').removeClass('hidden');
        <?php if ($moneymaker2_modules_quickorder_hide_email) { ?>
          modal.find('.modal-dialog .form-group.required:first-child').addClass('hidden');
          modal.find('.modal-dialog #quickorderemail').val('<?php echo $moneymaker2_modules_quickorder_recipient; ?>');
          $("#quickorderemail").addClass('valid');
        <?php } ?>
        modal.find('.modal-dialog').removeClass('modal-dialog-callback');
        modal.find('.modal-dialog').removeClass('modal-dialog-newsletter');
        modal.find('.modal-dialog').addClass('modal-dialog-order');
        modal.find('.modal-title.h4').append(" <small>(" + price + ")</small>");
        modal.find('.btn-primary').html('<i class="fa fa-fw fa-flip-horizontal fa-reply-all"></i> <?php echo $text_quickorder_submit; ?>');
        modal.find('.panel small').html('<?php echo $text_quickorder_help; ?>');
      } else if (mode=="callback") {
        modal.find('.modal-dialog .form-group.required:nth-child(2)').removeClass('hidden');
        modal.find('.modal-dialog .form-group.optional').removeClass('hidden');
        modal.find('.modal-dialog .form-group.required:first-child').addClass('hidden');
        modal.find('.modal-dialog').removeClass('modal-dialog-order');
        modal.find('.modal-dialog').removeClass('modal-dialog-newsletter');
        modal.find('.modal-dialog').addClass('modal-dialog-callback');
        modal.find('.btn-primary').html('<i class="fa fa-fw fa-flip-horizontal fa-reply-all"></i> <?php echo $text_callback_submit; ?>');
        modal.find('.panel small').html('<?php echo $text_callback_help; ?>');
      } else {
        modal.find('.modal-dialog .form-group.required:first-child').removeClass('hidden');
        modal.find('.modal-dialog .form-group.required:nth-child(2)').addClass('hidden');
        modal.find('.modal-dialog .form-group.optional').addClass('hidden');
        <?php if ($moneymaker2_modules_quickorder_hide_email) { ?>
          modal.find('.modal-dialog #quickorderemail').val('');
        <?php } ?>
        modal.find('.modal-dialog').removeClass('modal-dialog-order');
        modal.find('.modal-dialog').removeClass('modal-dialog-callback');
        modal.find('.modal-dialog').addClass('modal-dialog-newsletter');
        $('#quickorderemail').attr("placeholder", "");
        modal.find('.img-responsive').parent().find('div.hidden').html("<?php echo addslashes($moneymaker2_modules_newsletter_caption); ?>");
        modal.find('.img-responsive').parent().find('div.hidden').removeClass("hidden");
        if ( $('#newsletteremail').val()||$('input[type="text"].newsletteremail').val() ) {
          if ( $('input[type="text"].newsletteremail').val() ) {
            modal.find('.modal-dialog #quickorderemail').val($('input[type="text"].newsletteremail').val());
          } else {
            modal.find('.modal-dialog #quickorderemail').val($('#newsletteremail').val());
          }
          $('#orderModal').one('shown.bs.modal', function (event) {
            if (emailValidation( $("#quickorderemail").val() )) {
              $('#quickorderemail').parent().parent().removeClass('has-error');
              $("#quickorderemail").addClass('valid');
              $("#quickorderemail").parent().parent().addClass('has-success has-feedback');
              $(".quickorderemail.form-control-feedback").removeClass('hidden');
            } else {
              $("#quickorderemail").removeClass('valid');
              $("#quickorderemail").parent().parent().removeClass('has-success has-feedback');
              $(".quickorderemail.form-control-feedback").addClass('hidden');
            }
            $('#orderModal .btn-primary').click();
          })
        }
        modal.find('.btn-primary').html('<i class="fa fa-fw fa-flip-horizontal fa-reply-all"></i> <?php echo $text_newsletter_submit; ?>');
        modal.find('.panel small').html('<?php echo $text_newsletter_help; ?>');
      }
      modal.find('.panel').removeClass('panel-danger');
      modal.find('.panel').removeClass('panel-success');
      modal.find('.panel').addClass('panel-info');
      modal.find('.btn-primary').removeClass('btn-success');
      modal.find('.btn-primary').removeAttr('disabled');
      if ( ((mode=="product")&&($('#cart > ul > li > table').length>0)) || ((mode=="catalog")&&($('#cart > ul > li > table').length>0)) ) {
        $('<div class="panel panel-default"><div class="panel-heading text-center"><small><?php echo $text_quickorder_cart_items_help; ?>' + $('#cart-total').text() + '</small></div></div>').insertAfter($('#orderModal .panel'));
      }
    })
    $('#orderModal .btn-primary').bind('click', function(e){
      initialValidation();
    });
    <?php if ($moneymaker2_modules_quickorder_phone_mask_enabled) { ?>
      $("#quickorderphone").mmr2mask(
        '<?php echo $moneymaker2_modules_quickorder_phone_mask; ?>', {
          placeholder: "<?php echo str_replace("0", "_", $moneymaker2_modules_quickorder_phone_mask); ?>",
          onChange: function(){
            $("#quickorderphone").removeClass('valid');
            $("#quickorderphone").parent().parent().removeClass('has-success has-feedback');
            $(".quickorderphone.form-control-feedback").addClass('hidden');
          },
          onComplete: function() {
            $('#quickorderphone').parent().parent().removeClass('has-error');
            $("#quickorderphone").addClass('valid');
            $("#quickorderphone").parent().parent().addClass('has-success has-feedback');
            $(".quickorderphone.form-control-feedback").removeClass('hidden');
          },
        }
      );
    <?php } ?>
    function emailValidation(email) {
      var regexp = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      return regexp.test(email);
    }
    if (emailValidation( $("#quickorderemail").val() )) {
      $('#quickorderemail').parent().parent().removeClass('has-error');
      $("#quickorderemail").addClass('valid');
      $("#quickorderemail").parent().parent().addClass('has-success has-feedback');
      $(".quickorderemail.form-control-feedback").removeClass('hidden');
    }
    $('#quickorderemail').on('input',function(e) {
        if (emailValidation( $("#quickorderemail").val())) {
          $('#quickorderemail').parent().parent().removeClass('has-error');
          $("#quickorderemail").addClass('valid');
          $("#quickorderemail").parent().parent().addClass('has-success has-feedback');
          $(".quickorderemail.form-control-feedback").removeClass('hidden');
        } else {
          $("#quickorderemail").removeClass('valid');
          $("#quickorderemail").parent().parent().removeClass('has-success has-feedback');
          $(".quickorderemail.form-control-feedback").addClass('hidden');
        }
      });
      function initialValidation() {
        $('#orderModal .panel-default').remove();
        <?php if (!$moneymaker2_modules_quickorder_phone_mask_enabled) { ?>
          if ($("#quickorderphone").val()) {
            $('#quickorderphone').parent().parent().removeClass('has-error');
            $("#quickorderphone").addClass('valid');
            $("#quickorderphone").parent().parent().addClass('has-success has-feedback');
            $(".quickorderphone.form-control-feedback").removeClass('hidden');
          }
        <?php } ?>
        if ((($( "#orderModal .modal-dialog-order" ).length && $("#quickorderemail").hasClass('valid') && $("#quickorderphone").hasClass('valid')) || ($( "#orderModal .modal-dialog-callback" ).length && $("#quickorderphone").hasClass('valid')) || ($( "#orderModal .modal-dialog-newsletter" ).length && $("#quickorderemail").hasClass('valid'))) <?php if ($text_agree) { ?>&&$("#quickorderagree").is(':checked')<?php } ?> ) {
          $("#orderModal .panel").removeClass('panel-danger');
          $('#quickorderagree').parent().parent().removeClass('text-danger');
          $("#orderModal .panel").addClass('panel-info');
          $("#quickordercomment").parent().parent().addClass('has-success has-feedback');
          $(".quickordercomment.form-control-feedback").removeClass('hidden');
          $("#quickordername").parent().parent().addClass('has-success has-feedback');
          $(".quickordername.form-control-feedback").removeClass('hidden');
          $("#orderModal .panel small").html('<i class="fa fa-spinner fa-spin"></i> <?php echo $text_loading; ?>');
          $('#orderModal .btn-primary').attr('disabled','disabled');
          if ( $( "#orderModal .modal-dialog-callback" ).length ) {
            addCallback();
          }
          if ( $( "#orderModal .modal-dialog-newsletter" ).length ) {
            addSubscriber();
          }
          if ( $( "#orderModal .modal-dialog-order" ).length ) {
            addQuickOrder();
          }
        } else {
          $("#orderModal .panel").removeClass('panel-info');
          $("#orderModal .panel").addClass('panel-danger');
          $("#orderModal .panel small").html('');
        }
        if (($( "#orderModal .modal-dialog-order" ).length && !$("#quickorderemail").hasClass('valid'))||($( "#orderModal .modal-dialog-newsletter" ).length && !$("#quickorderemail").hasClass('valid'))) {
          $('#quickorderemail').parent().parent().addClass('has-error');
          $("#orderModal .panel small").html('<?php echo $error_quickorder_email; ?><br />');
        }
        if (!$("#orderModal .modal-dialog-newsletter").length && !$("#quickorderphone").hasClass('valid')) {
          $('#quickorderphone').parent().parent().addClass('has-error');
          $("#orderModal .panel small").html( $("#orderModal .panel small").html() + '<?php echo $error_quickorder_phone; ?><br />');
        }
        <?php if ($text_agree) { ?>
        if (!$("#quickorderagree").is(':checked')) {
          $('#quickorderagree').parent().parent().addClass('text-danger');
          $("#orderModal .panel small").html( $("#orderModal .panel small").html() + '<?php echo $error_agree; ?>');
        }
        <?php } ?>
      };
      <?php if ($moneymaker2_modules_quickorder_enabled) { ?>
      function addQuickOrder() {
        $.ajax({
          url: 'index.php?route=common/footer/addquickorder',
          type: 'post',
          data: $('#orderModal input[type=\'text\'], #orderModal input[type=\'checkbox\']:checked, #orderModal input[type=\'tel\'], #orderModal input[type=\'email\'], #orderModal input[type=\'hidden\'], #product input[type=\'number\'], #product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
          dataType: 'json',
          success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');
            if (json['error']) {

              if (json['error']['option']) {
                $('.options .collapse').show();
                if ($('.options > div').hasClass("collapse")) {
                  $('.options > div:first-child').hide();
                }
                for (i in json['error']['option']) {
                  var element = $('#input-option' + i.replace('_', '-'));
                  if (element.parent().hasClass('input-group')) {
                    element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                  } else {
                    element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                  }
                }
              }
              if (json['error']['recurring']) {
                $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
              }

              if (json['error']['validation']) {
                $("#orderModal .panel").removeClass('panel-info');
                $("#orderModal .panel").addClass('panel-danger');
                $("#orderModal .panel small").html(json['error']['validation']);
                $('#orderModal .btn-primary').removeAttr('disabled');
              }
              $('.text-danger').parent().addClass('has-error');
            }
            if (json['success']) {
              $("#orderModal .panel").removeClass('panel-danger');
              $("#orderModal .panel").removeClass('panel-info');
              $("#orderModal .panel").addClass('panel-success');
              $("#orderModal .panel small").html(json['success']);
              $('#orderModal .btn-primary').addClass('btn-success');
              $('#orderModal .btn-primary').html('<i class="fa fa-check"></i> <?php echo $button_quickorder_success_message; ?>');
              <?php if ($moneymaker2_modules_quickorder_goal_google) { ?>
                ga('send', 'event', 'button', 'click', 'quickorder');
              <?php } ?>
              <?php if ($moneymaker2_modules_quickorder_goal_google_gtag) { ?>
                gtag('event', 'click', {'event_category': 'button', 'event_label': 'quickorder'});
              <?php } ?>
              <?php if ($moneymaker2_modules_quickorder_goal_yandex&&$moneymaker2_modules_quickorder_goal_yandex_counter) { ?>
                ym(<?php echo $moneymaker2_modules_quickorder_goal_yandex_counter; ?>, 'reachGoal', 'quickorder');
              <?php } ?>
              var moneymaker2_total_count = json['moneymaker2_total_count'];
              var moneymaker2_total_sum = json['moneymaker2_total_sum'];
              $('#cart > .dropdown-toggle #cart-total').html(moneymaker2_total_sum);
              $('#cart > .dropdown-toggle .fa-stack .fa-stack-1x, .navbar-cart-toggle .fa-stack .fa-stack-1x').html(moneymaker2_total_count);

              $('#cart > ul').load('index.php?route=common/cart/info ul li');
            }
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
      };
      <?php } ?>
      <?php if ($moneymaker2_modules_callback_enabled) { ?>
      function addCallback() {
        $.ajax({
          url: 'index.php?route=common/footer/addCallback',
          type: 'post',
          data: $('#orderModal input[type=\'text\'], #orderModal input[type=\'tel\']'),
          dataType: 'json',
          success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');
            if (json['error']) {

              if (json['error']['option']) {
                $('.options .collapse').show();
                if ($('.options > div').hasClass("collapse")) {
                  $('.options > div:first-child').hide();
                }
                for (i in json['error']['option']) {
                  var element = $('#input-option' + i.replace('_', '-'));
                  if (element.parent().hasClass('input-group')) {
                    element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                  } else {
                    element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                  }
                }
              }
              if (json['error']['recurring']) {
                $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
              }

              if (json['error']['validation']) {
                $("#orderModal .panel").removeClass('panel-info');
                $("#orderModal .panel").addClass('panel-danger');
                $("#orderModal .panel small").html(json['error']['validation']);
                $('#orderModal .btn-primary').removeAttr('disabled');
              }
              $('.text-danger').parent().addClass('has-error');
            }
            if (json['success']) {
              $("#orderModal .panel").removeClass('panel-danger');
              $("#orderModal .panel").removeClass('panel-info');
              $("#orderModal .panel").addClass('panel-success');
              $("#orderModal .panel small").html(json['success']);
              $('#orderModal .btn-primary').addClass('btn-success');
              $('#orderModal .btn-primary').html('<i class="fa fa-check"></i> <?php echo $button_callback_success_message; ?>');
              <?php if ($moneymaker2_modules_callback_goal_google) { ?>
                ga('send', 'event', 'button', 'click', 'callback');
              <?php } ?>
              <?php if ($moneymaker2_modules_callback_goal_google_gtag) { ?>
                    gtag('event', 'callback_request', {'event_category': 'callback_button', 'event_label': 'callback'});
              <?php } ?>
              <?php if ($moneymaker2_modules_callback_goal_yandex&&$moneymaker2_modules_callback_goal_yandex_counter) { ?>
                ym(<?php echo $moneymaker2_modules_callback_goal_yandex_counter; ?>, 'reachGoal', 'callback');
              <?php } ?>
            }
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
      };
      <?php } ?>
      <?php if ($moneymaker2_modules_newsletter_enabled) { ?>
      function addSubscriber() {
        $.ajax({
          url: 'index.php?route=common/footer/addSubscriber',
          type: 'post',
          data: $('#orderModal input[type=\'email\'], #orderModal input[type=\'text\']'),
          dataType: 'json',
          success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');
            if (json['error']) {
              if (json['error']['validation']) {
                $("#orderModal .panel").removeClass('panel-info');
                $("#orderModal .panel").addClass('panel-danger');
                $("#orderModal .panel small").html(json['error']['validation']);
                $('#orderModal .btn-primary').removeAttr('disabled');
              }
              $('.text-danger').parent().addClass('has-error');
            }
            if (json['success']) {
              $("#orderModal .panel").removeClass('panel-danger');
              $("#orderModal .panel").removeClass('panel-info');
              $("#orderModal .panel").addClass('panel-success');
              $("#orderModal .panel small").html(json['success']);
              $('#orderModal .btn-primary').addClass('btn-success');
              $('#orderModal .btn-primary').html('<i class="fa fa-check"></i> <?php echo $button_newsletter_success_message; ?>');
            }
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
      };
      <?php } ?>
    <?php } ?>
    <?php if (($moneymaker2_modules_popup&&$moneymaker2_modules_popup_link)||($moneymaker2_header_alert&&$moneymaker2_header_alert_text)) { ?>
    var mmr2cookies = Cookies.noConflict();
    <?php } ?>
    <?php if ($moneymaker2_modules_popup&&$moneymaker2_modules_popup_link) { ?>
    if (!mmr2cookies.get('mmr2_popup')) {
      setTimeout(function(){
        if (!$(document.body).hasClass('modal-open')){
        <?php if ($moneymaker2_modules_popup_link=='newsletter') { ?>
          $('#newsletteremail').val('');
          $('footer ul > li > .input-group-sm > span.input-group-btn .btn-primary').click();
          $('footer ul > li > .input-group-sm > span.input-group-btn .btn-primary').hide();
          $('#orderModal').one('hidden.bs.modal', function(){
            setTimeout(" $('footer ul > li > .input-group-sm > span.input-group-btn .btn-primary').show(); ", 100);
          });
        <?php } else { ?>
          $('#infoModal').find('.modal-title.h4').text('<?php echo $moneymaker2_modules_popup_title; ?>');
          $('#infoModal').find('.modal-body').load('index.php?route=information/information/agree&information_id=<?php echo $moneymaker2_modules_popup_link; ?>', function () {
            $('#infoModal').modal({show: true},'show');
          });
        <?php } ?>
        mmr2cookies.set('mmr2_popup', 'valid', { expires: <?php echo $moneymaker2_modules_popup_limit; ?> });
        }
      }, <?php echo $moneymaker2_modules_popup_delay; ?>);
    }
    <?php } ?>
    <?php if ($moneymaker2_header_alert&&$moneymaker2_header_alert_text) { ?>
    if (!mmr2cookies.get('mmr2_alert')) {
      $("header").before( '<div class="header-alert collapse"><div class="pull-right text-primary" data-toggle="collapse" data-target="body > .collapse"><i class="fa fa-close"></i></div><div class="container"><div class="text-center"><?php echo addslashes($moneymaker2_header_alert_text); ?></div></div></div>' );
      $(".header-alert").collapse();
      $('.header-alert').on('hide.bs.collapse', function () {
        mmr2cookies.set('mmr2_alert', 'valid', { expires: 365 });
      })
    }
    <?php } ?>
    if ($(".owl-moneymaker2-slideshow .owl-controls").length > 0) {
      BackgroundCheck.init({
        targets: '.owl-moneymaker2-slideshow .owl-prev .arrow-left, .owl-moneymaker2-slideshow .owl-next .arrow-right, .owl-moneymaker2-slideshow .owl-pagination',
        images: '.owl-moneymaker2-slideshow .img-responsive'
      });
    }
  });


//--></script>
</body></html>