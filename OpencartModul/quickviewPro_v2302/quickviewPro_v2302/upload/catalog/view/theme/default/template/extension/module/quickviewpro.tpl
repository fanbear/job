<div id="quickview-container">
<div id="popup-quickview">
<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen" />
	<div class="popup-center">
	<ul class="nav nav-tabs my-tabs">
			<li class="active">	<a href="#tab-general" data-toggle="tab"><?php echo $tab_general_quickview; ?></a></li>
			<?php if($on_off_quickview_tab_description =='1') { ?>
				<li><a href="#tab-description" data-toggle="tab"><i class="fa fa-file-text-o fa-fw"></i><?php echo $tab_description; ?></a></li>
            <?php } ?>
			<?php if($on_off_quickview_tab_specification =='1') { ?>
				<?php if ($attribute_groups) { ?>
				<li><a href="#tab-specification" data-toggle="tab"><i class="fa fa-list-alt fa-fw"></i><?php echo $tab_attribute; ?></a></li>                     
				<?php } ?>
			<?php } ?>
			<?php if($on_off_quickview_tab_review_quickview =='1') { ?>
				<li><a href="#tab-review-quickview" data-toggle="tab"><i class="fa fa-comments-o fa-fw"></i><?php echo $tab_review; ?></a></li>
			<?php } ?>
    </ul>
	<div class="tab-content">
		<div class="tab-pane active" id="tab-general">
				<div class="col-md-5 col-sm-5">
			<div class="product-img-box thumbnails_view">
<?php if($on_off_quickview_additional_image =='1'){?>
<script>
 $(function(){
 $(".product-img-box.thumbnails_view").each(function (indx, el){
  var image = $(".img", el),
  next = $(el).parent();
  var oldsrc;
  $(".hover", next).hover(function (){
   var newsrc = $(this).attr("rel");
   image.attr({src: newsrc});
  });
  $(".thumbnails_view").hover(function (){oldsrc = image.attr('src');},
  function(){
   image.attr({src: oldsrc}); 
  })
 });
});	
$('.gallery-image').owlCarousel({						
	items : 3,
	navigation: true,
	navigationText: ['<div class="btn-carousel featured-btn-next next-prod"><i class="fa fa-angle-left arrow"></i></div>', '<div class="btn-carousel featured-btn-prev prev-prod"><i class="fa fa-angle-right arrow"></i></div>'],
	pagination: false
}); 
</script>
<?php } ?>
			<div class="thumbnails-image">
					<img class="img img-responsive" src="<?php echo $popup;?>" alt="<?php echo $heading_title;?>" />
				</div>
			<?php if($on_off_quickview_additional_image =='1'){?>
				<div class="gallery-image owl-carousel text-center">
					<?php if ($images) { ?>					
						<?php foreach ($images as $image) { ?>
						<span class="item">
								<img style="cursor:pointer;" class="hover" src="<?php echo $image['thumb']; ?>" rel="<?php echo $image['popup'];?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
						</span>
						<?php } ?>				
					<?php } ?>
				</div>	
			<?php } ?>	
			</div>			
		</div>
			<div class="col-md-7 col-sm-7">
				<div class="product-name-quick"><?php echo $heading_title;?></div>
				<hr>
				<?php if($on_off_quickview_tab_review_quickview =='1') { ?>	
				<?php if ($review_status) { ?>
					  <div class="rating">
						<p>
						  <?php for ($i = 1; $i <= 5; $i++) { ?>
						  <?php if ($rating < $i) { ?>
						  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
						  <?php } else { ?>
						  <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
						  <?php } ?>
						  <?php } ?>
						  <a href="" onclick="$('a[href=\'#tab-review-quickview\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review-quickview\']').trigger('click'); return false;"><?php echo $text_write; ?></a></p>
					  </div>
					  <?php } ?>
				<hr>
				<?php } ?>
					<?php if ($price) { ?>
					  <ul class="list-unstyled">
						<?php if (!$special) { ?>
						<li>
						  <span class="price"><?php echo $price; ?></span>
						</li>
						<?php } else { ?>
						<li><li><span class="price-old" style="text-decoration: line-through;"><?php echo $price; ?></span>&nbsp;&nbsp;<span class="price-new"><?php echo $special; ?></span></li></li>
						<?php } ?>
						<?php if ($tax) { ?>
						<li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
						<?php } ?>
						<?php if ($points) { ?>
						<li><?php echo $text_points; ?> <?php echo $points; ?></li>
						<?php } ?>
						<?php if ($discounts) { ?>
						<li>
						  <hr>
						</li>
						<?php foreach ($discounts as $discount) { ?>
						<li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
						<?php } ?>
						<?php } ?>
					  </ul>
					  <?php } ?>
				<hr>
			<?php if($on_off_quickview_manufacturer =='1'){?>	
				<div class="quick-manufacturer"><span><i class="fa fa-check fa-fw"></i><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></div>
			<?php } ?>
			<?php if($on_off_quickview_model =='1'){?>	
				<div class="quick-model"><span><i class="fa fa-check fa-fw"></i><?php echo $text_model; ?></span> <span><?php echo $model; ?></span> </div>
			<?php } ?>
			<?php if($on_off_quickview_quantity =='1'){?>	
				<?php if($quantity_prod <=0) { ?>				
					<div class="quick-stock"><span><i class="fa fa-check fa-fw"></i><?php echo $text_stock; ?></span> <span class="qty-not-in-stock"><?php echo $stock; ?></span></div>
				<?php } else { ?>
					<div class="quick-stock"><span><i class="fa fa-check fa-fw"></i><?php echo $text_stock; ?></span> <span class="qty-in-stock"><?php echo $stock; ?></span></div>
				<?php } ?>
			<?php } ?>
			<?php if( ($on_off_quickview_quantity =='1') || ($on_off_quickview_model =='1') || ($on_off_quickview_quantity =='1')) { ?>
				<hr>
			<?php } ?>
<?php if ($options) { ?>
<?php $coun_options = count($options);?>
	<?php if($coun_options > $on_off_quickview_options_count){ ?>
	<div class="options-expand panel panel-default">
        <a href="javascript:void(0);" onclick="$('.options').toggleClass('hidden-options');$('.options-expand a .caret').toggleClass('rotate');" title="<?php echo $text_option; ?>"><?php echo $text_option; ?> <span class="caret"></span></a>
    </div>
	<?php } else { ?>
	<div class="options-close panel panel-default">
        <a href="javascript:void(0);" onclick="$('.options').toggleClass('hidden-options');$('.options-expand a .caret').toggleClass('rotate');" title="<?php echo $text_option; ?>"><?php echo $text_option; ?> <span class="caret"></span></a>
    </div>
	<?php } ?>
      <div class="options <?php if($coun_options > $on_off_quickview_options_count) { ?>hidden-options<?php } ?>">
        <br />
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'image') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
				</div>
            <?php } ?>
			<?php if ($minimum > 1) { ?>
			<hr>
            <div class="quantity-minimum"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>
			<?php if($options){?><hr><?php } ?>
			<div class="btn-group-product">
			<?php if($on_off_quickview_addtocart=='1'){?>
			<div class="qty pull-left">
					<div class="quantity-adder clearfix">
						<div>
							<div class="quantity-number pull-left">
								<input class="quantity-product form-control" type="text" name="quantity" size="5" value="<?php echo $minimum; ?>" id="input-quantity" />
							</div>
							<div class="quantity-wrapper pull-left">
							<span onclick="btnplus_card_prod();" class="add-up add-action fa fa-plus"></span>
							<span onclick="btnminus_card_prod(<?php echo $minimum; ?>);" class="add-down add-action fa fa-minus"></span>
							</div>
						</div>
						<input type="hidden" name="product_id"  value="<?php echo $product_id; ?>" />
					</div>
			</div>
			<script type="text/javascript">
				function btnminus_card_prod(a){
					document.getElementById("input-quantity").value>a?document.getElementById("input-quantity").value--:document.getElementById("input-quantity").value=a
				}
				function btnplus_card_prod(){
					document.getElementById("input-quantity").value++
				};

			</script>
			<?php } ?>
			<style>
				.btn-add-to-cart-quickview {
					background:<?php echo $config_quickview_background_btnaddtocart;?>;
					color:<?php echo $config_quickview_textcolor_btnaddtocart;?>;
					border:1px solid <?php echo $config_quickview_background_btnaddtocart;?>;
				}
				.btn-add-to-cart-quickview:hover {
					background:<?php echo $config_quickview_background_btnaddtocart_hover;?>;
					color:<?php echo $config_quickview_textcolor_btnaddtocart_hover;?>;
					border:1px solid <?php echo $config_quickview_background_btnaddtocart_hover;?>;
				}
				.btn-wishlist-quickview {
					background:<?php echo $config_quickview_background_btnwishlist;?>;
					color:<?php echo $config_quickview_textcolor_btnwishlist;?>;
					border:1px solid <?php echo $config_quickview_background_btnwishlist;?>;
				}
				.btn-wishlist-quickview:hover {
					background:<?php echo $config_quickview_background_btnwishlist_hover;?>;
					color:<?php echo $config_quickview_textcolor_btnwishlist_hover;?>;
					border:1px solid <?php echo $config_quickview_background_btnwishlist_hover;?>;
				}
				.btn-compare-quickview {
					background:<?php echo $config_quickview_background_btncompare;?>;
					color:<?php echo $config_quickview_textcolor_btncompare;?>;
					border:1px solid <?php echo $config_quickview_background_btncompare;?>;
				}
				.btn-compare-quickview:hover {
					background:<?php echo $config_quickview_background_btncompare_hover;?>;
					color:<?php echo $config_quickview_textcolor_btncompare_hover;?>;
					border:1px solid <?php echo $config_quickview_background_btncompare_hover;?>;
				}
			</style>
			<?php if($on_off_quickview_addtocart=='1'){?>
				<button type="button" id="button-cart-quickview" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-add-to-cart-quickview"><i class="fa fa-shopping-cart fa-fw"></i> <?php echo $button_cart; ?></button>
			<?php } ?>
			<div class="btn-group">
			<?php if($on_off_quickview_wishlist=='1'){?>
				<button type="button" data-toggle="tooltip" class="btn btn-wishlist-quickview" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');$.magnificPopup.close();"><i class="fa fa-heart"></i></button>
			<?php } ?>
			<?php if($on_off_quickview_compare=='1'){?>
				<button type="button" data-toggle="tooltip" class="btn btn-compare-quickview" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');$.magnificPopup.close();"><i class="fa fa-exchange"></i></button>
			<?php } ?>
			</div>
			</div>
			</div>
		</div>
		<?php if($on_off_quickview_tab_description =='1') { ?>
			<div class="tab-pane" id="tab-description">
				<?php echo $description; ?>
			</div>
		<?php } ?>	
		<?php if($on_off_quickview_tab_specification =='1') { ?>
		<?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                  <tr>
                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
		<?php } ?>
		<?php if($on_off_quickview_tab_review_quickview =='1') { ?>	
		<?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review-quickview">
              <form class="form-horizontal" id="form-review-quickview">
                <div id="review-quickview"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review-quickview" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_review; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
            <?php } ?>
	</div>
	</div>
<script type="text/javascript"><!--
$('#button-cart-quickview').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#popup-quickview input[type=\'text\'], #popup-quickview input[type=\'hidden\'], #popup-quickview input[type=\'radio\']:checked, #popup-quickview input[type=\'checkbox\']:checked, #popup-quickview select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart-quickview').button('loading');
		},
		complete: function() {
			$('#button-cart-quickview').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						$('.options').removeClass('hidden-options');
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

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
			$.magnificPopup.close();
				html  = '<div id="modal-cart" class="modal fade">';
				html += '  <div class="modal-dialog">';
				html += '    <div class="modal-content">';
				html += '     <div class="modal-body alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
				html += '    </div>';
				html += '  </div>';
				html += '</div>';
				$('body').append(html);
				$('#modal-cart').modal('show');

				$('#cart-total').html(json['total']);
				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('#review-quickview').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review-quickview').fadeOut('slow');

    $('#review-quickview').load(this.href);

    $('#review-quickview').fadeIn('slow');
});

$('#review-quickview').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review-quickview').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review-quickview").serialize(),
		beforeSend: function() {
			$('#button-review-quickview').button('loading');
		},
		complete: function() {
			$('#button-review-quickview').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review-quickview').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review-quickview').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#popup-quickview .date').datetimepicker({
	pickTime: false
});

$('#popup-quickview .datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('#popup-quickview .time').datetimepicker({
	pickDate: false
});

$('#popup-quickview button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
</div>
</div>	  
</div>	  
	 