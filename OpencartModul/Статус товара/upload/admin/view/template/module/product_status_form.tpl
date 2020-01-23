<?php echo $header; ?>
<?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
        
          <ul class="nav nav-tabs" id="language">
            <?php foreach ($languages as $language) { ?>
            <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <?php foreach ($languages as $language) { ?>
            <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <td class="required" width="20%"><?php echo $status_image; ?></td>
                  <td valign="top">
                    <a href="" id="thumb-image<?php echo $language['language_id']; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb[$language['language_id']]; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                    <input type="hidden" name="status_description[<?php echo $language['language_id']; ?>][image]" value="<?php echo isset($status_description[$language['language_id']]['image']) ? $status_description[$language['language_id']]['image'] : ''; ?>" id="image<?php echo $language['language_id']; ?>"  />
                    
                    <?php if (isset($error_image[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_image[$language['language_id']]; ?></div>
                    <?php } ?>  
                  </td>
                </tr>

                <tr>
                  <td class="required"><?php echo $status_name; ?></td>
                  <td><input type="text" name="status_description[<?php echo $language['language_id']; ?>][name]" size="100" value="<?php echo isset($status_description[$language['language_id']]['name']) ? $status_description[$language['language_id']]['name'] : ''; ?>" class="form-control" />
                  
                    <?php if (isset($error_name[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                    <?php } ?>
                  </td>
                </tr>

                <tr>
                  <td><?php echo $status_url; ?></td>
                  <td><input type="text" name="status_description[<?php echo $language['language_id']; ?>][url]" size="100" value="<?php echo isset($status_description[$language['language_id']]['url']) ? $status_description[$language['language_id']]['url'] : ''; ?>" class="form-control" />
                  </td>
                </tr>

                <tr>
                  <td><?php echo $status_sticker; ?></td>
                  <td>
                    <select name="status_description[<?php echo $language['language_id']; ?>][sticker]" class="form-control" >
                      <option value="" <?php echo !isset($status_description[$language['language_id']]['sticker']) || $status_description[$language['language_id']]['sticker']  == '' ? 'selected="selected"' : ''; ?>><?php echo $sticker_disable; ?></option>
                      <option value="left-top" <?php echo isset($status_description[$language['language_id']]['sticker']) && $status_description[$language['language_id']]['sticker']  == 'left-top' ? 'selected="selected"' : ''; ?>><?php echo $sticker_left_top; ?></option>
                      <option value="left-center" <?php echo isset($status_description[$language['language_id']]['sticker']) && $status_description[$language['language_id']]['sticker']  == 'left-center' ? 'selected="selected"' : ''; ?>><?php echo $sticker_left_center; ?></option>
                      <option value="left-bottom" <?php echo isset($status_description[$language['language_id']]['sticker']) && $status_description[$language['language_id']]['sticker']  == 'left-bottom' ? 'selected="selected"' : ''; ?>><?php echo $sticker_left_bottom; ?></option>
                      <option value="right-top" <?php echo isset($status_description[$language['language_id']]['sticker']) && $status_description[$language['language_id']]['sticker']  == 'right-top' ? 'selected="selected"' : ''; ?>><?php echo $sticker_right_top; ?></option>
                      <option value="right-center" <?php echo isset($status_description[$language['language_id']]['sticker']) && $status_description[$language['language_id']]['sticker']  == 'right-center' ? 'selected="selected"' : ''; ?>><?php echo $sticker_right_center; ?></option>
                      <option value="right-bottom" <?php echo isset($status_description[$language['language_id']]['sticker']) && $status_description[$language['language_id']]['sticker']  == 'right-bottom' ? 'selected="selected"' : ''; ?>><?php echo $sticker_right_bottom; ?></option>
                      <option value="center-top" <?php echo isset($status_description[$language['language_id']]['sticker']) && $status_description[$language['language_id']]['sticker']  == 'center-top' ? 'selected="selected"' : ''; ?>><?php echo $sticker_center_top; ?></option>
                      <option value="center" <?php echo isset($status_description[$language['language_id']]['sticker']) && $status_description[$language['language_id']]['sticker']  == 'center' ? 'selected="selected"' : ''; ?>><?php echo $sticker_center; ?></option>
                      <option value="center-bottom" <?php echo isset($status_description[$language['language_id']]['sticker']) && $status_description[$language['language_id']]['sticker']  == 'center-bottom' ? 'selected="selected"' : ''; ?>><?php echo $sticker_center_bottom; ?></option>
                    </select>  

                  </td>
                </tr>

                <tr>
                  <td><?php echo $sort_order; ?></td>
                  <td><input type="text" name="status_description[<?php echo $language['language_id']; ?>][sort_order]" size="100" value="<?php echo isset($status_description[$language['language_id']]['sort_order']) ? $status_description[$language['language_id']]['sort_order'] : ''; ?>" class="form-control" />
                  </td>
                </tr>

                <tr>
                  <td><b><?php echo $status_auto; ?></b></td>
                  <td>
                  </td>
                </tr>

                <tr>
                  <td><?php echo $status_attribute; ?></td>
                  <td>
                    <div class="input-group">
                      <input type="text" name="status_description[<?php echo $language['language_id']; ?>][attribute_name]" value="<?php echo isset($status_description[$language['language_id']]['attribute_name']) ? $status_description[$language['language_id']]['attribute_name'] : ''; ?>" class="form-control" />
                      <input type="hidden" name="status_description[<?php echo $language['language_id']; ?>][attribute_id]" value="<?php echo isset($status_description[$language['language_id']]['attribute_id']) ? $status_description[$language['language_id']]['attribute_id'] : ''; ?>" class="form-control" />
                      <span class="input-group-btn">
                        <a onclick="delete_attribute(<?php echo $language['language_id']; ?>); return false;" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>
                      </span>
                    </div>
                  </td>
                </tr>

                <tr>
                  <td><?php echo $status_attribute_value; ?><br /><?php echo $status_attribute_value_help; ?></td>
                  <td><input type="text" name="status_description[<?php echo $language['language_id']; ?>][attribute_value]" size="100" value="<?php echo isset($status_description[$language['language_id']]['attribute_value']) ? $status_description[$language['language_id']]['attribute_value'] : ''; ?>" class="form-control" />
                  </td>
                </tr>

                <tr>
                  <td><?php echo $status_manufacturer; ?></td>
                  <td>
                    <select name="status_description[<?php echo $language['language_id']; ?>][manufacturer_id]" class="form-control" >
                      <option value="0" selected="selected"><?php echo $text_none; ?></option>
                      <?php foreach ($manufacturers as $manufacturer) { ?>
                        <?php if (isset($status_description[$language['language_id']]['manufacturer_id']) && $manufacturer['manufacturer_id'] == $status_description[$language['language_id']]['manufacturer_id']) { ?>
                          <option value="<?php echo $manufacturer['manufacturer_id']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
                        <?php } else { ?>
                          <option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
                        <?php } ?>
                      <?php } ?>
                    </select>
                  </td>
                </tr>

                <tr>
                  <td><?php echo $status_category; ?></td>
                  <td>
                    <select name="status_description[<?php echo $language['language_id']; ?>][category_id]" class="form-control" >
                      <option value="0" selected="selected"><?php echo $text_none; ?></option>
                      <?php foreach ($categories as $product_category) { ?>
                        <?php if (isset($status_description[$language['language_id']]['category_id']) && $product_category['category_id'] == $status_description[$language['language_id']]['category_id']) { ?>
                          <option value="<?php echo $product_category['category_id']; ?>" selected="selected"><?php echo $product_category['name']; ?></option>
                        <?php } else { ?>
                          <option value="<?php echo $product_category['category_id']; ?>"><?php echo $product_category['name']; ?></option>
                        <?php } ?>
                      <?php } ?>
                    </select>
                  </td>
                </tr>

                <tr>
                  <td><?php echo $status_price; ?></td>
                  <td>
                    <div class="col-sm-6">
                      <div class="col-sm-2">
                        <?php echo $status_price_from; ?>: 
                      </div>
                      <div class="col-sm-10">
                        <input type="text" name="status_description[<?php echo $language['language_id']; ?>][price_from]" size="20" value="<?php echo isset($status_description[$language['language_id']]['price_from']) ? $status_description[$language['language_id']]['price_from'] : ''; ?>" class="form-control" /> 
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="col-sm-2">
                        <?php echo $status_price_to; ?>: 
                      </div>
                      <div class="col-sm-10">
                        <input type="text" name="status_description[<?php echo $language['language_id']; ?>][price_to]" size="20" value="<?php echo isset($status_description[$language['language_id']]['price_to']) ? $status_description[$language['language_id']]['price_to'] : ''; ?>" class="form-control" />
                      </div>
                    </div>
                  </td>
                </tr>

                <tr>
                  <td><?php echo $status_stock; ?></td>
                  <td>
                    <div class="col-sm-6">
                      <div class="col-sm-2">
                        <?php echo $status_stock_from; ?>: 
                      </div>
                      <div class="col-sm-10">
                        <input type="text" name="status_description[<?php echo $language['language_id']; ?>][stock_from]" size="20" value="<?php echo isset($status_description[$language['language_id']]['stock_from']) ? $status_description[$language['language_id']]['stock_from'] : ''; ?>" class="form-control" /> 
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="col-sm-2">
                        <?php echo $status_stock_to; ?>: 
                      </div>
                      <div class="col-sm-10">
                        <input type="text" name="status_description[<?php echo $language['language_id']; ?>][stock_to]" size="20" value="<?php echo isset($status_description[$language['language_id']]['stock_to']) ? $status_description[$language['language_id']]['stock_to'] : ''; ?>" class="form-control" />
                      </div>
                    </div> 
                  </td>
                </tr>

                <tr>
                  <td><?php echo $status_new; ?></td>
                  <td><input type="checkbox" name="status_description[<?php echo $language['language_id']; ?>][new]" value="1" <?php echo isset($status_description[$language['language_id']]['new']) && $status_description[$language['language_id']]['new'] ? 'checked="checked"' : ''; ?> class="form-control" />
                  </td>
                </tr>

                <tr>
                  <td><?php echo $status_bestseller; ?></td>
                  <td><input type="checkbox" name="status_description[<?php echo $language['language_id']; ?>][bestseller]" value="1" <?php echo isset($status_description[$language['language_id']]['bestseller']) && $status_description[$language['language_id']]['bestseller'] ? 'checked="checked"' : ''; ?> class="form-control" />
                  </td>
                </tr>

                <tr>
                  <td><?php echo $status_popular; ?></td>
                  <td><input type="checkbox" name="status_description[<?php echo $language['language_id']; ?>][popular]" value="1" <?php echo isset($status_description[$language['language_id']]['popular']) && $status_description[$language['language_id']]['popular'] ? 'checked="checked"' : ''; ?> class="form-control" />
                  </td>
                </tr>

                <tr>
                  <td><?php echo $status_special; ?></td>
                  <td><input type="checkbox" name="status_description[<?php echo $language['language_id']; ?>][special]" value="1" <?php echo isset($status_description[$language['language_id']]['special']) && $status_description[$language['language_id']]['special'] ? 'checked="checked"' : ''; ?> class="form-control" />
                  </td>
                </tr>

                <tr>
                  <td><?php echo $status_promotion; ?><br/><?php echo $status_promotion_help; ?></td>
                  <td><input type="checkbox" name="status_description[<?php echo $language['language_id']; ?>][promotion]" value="1" <?php echo isset($status_description[$language['language_id']]['promotion']) && $status_description[$language['language_id']]['promotion'] ? 'checked="checked"' : ''; ?> class="form-control" /> <br/> <?php echo $status_promotion_image; ?><input type="checkbox" name="status_description[<?php echo $language['language_id']; ?>][promotion_image]" value="1" <?php echo isset($status_description[$language['language_id']]['promotion_image']) && $status_description[$language['language_id']]['promotion_image'] ? 'checked="checked"' : ''; ?> class="form-control" />
                  </td>
                </tr>

              </table>
            </div>
            
            <?php } ?>
          </div>
        </form>  
      </div>
    </div>
  </div>
  
</div>

<script type="text/javascript"><!--

$('#language a:first').tab('show');
    
function attribute_autocomplete(language_id) {
	$('input[name=\'status_description[' + language_id + '][attribute_name]\']').autocomplete({
		source: function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/attribute/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {	
					response($.map(json, function(item) {
						return {
              label: item['name'],
              value: item['attribute_id']
						}
					}));
				}
			});
		}, 
		select: function(item) {
      $('input[name=\'status_description[' + language_id + '][attribute_name]\']').attr('value', item['label']);
      $('input[name=\'status_description[' + language_id + '][attribute_name]\']').val(item['label']);
			$('input[name=\'status_description[' + language_id + '][attribute_id]\']').attr('value', item['value']);

			return false;
		}
	});
}

function delete_attribute(language_id) {
	$('input[name=\'status_description[' + language_id + '][attribute_name]\']').attr('value', '');
  $('input[name=\'status_description[' + language_id + '][attribute_name]\']').val('');
	$('input[name=\'status_description[' + language_id + '][attribute_id]\']').attr('value', '');
}
//--></script>
 
<?php foreach ($languages as $language) { ?>
<script type="text/javascript"><!--
  attribute_autocomplete(<?php echo $language['language_id']; ?>);
//--></script> 
<?php } ?>

<?php echo $footer; ?>