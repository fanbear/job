
<!--author sv2109 (sv2109@gmail.com) license for 1 product copy granted for Blackangel861 ( filosofia-buduara.ru)-->
<?php echo $header; ?>
<?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-statuses" data-toggle="tab"><?php echo $tab_statuses; ?></a></li>
            <li><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-support" data-toggle="tab"><?php echo $tab_support; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-statuses">
							
              <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-delete">
                
                <div class="pull-right">
                  <a href="<?php echo $insert; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                  <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-delete').submit() : false;"><i class="fa fa-trash-o"></i></button>
                </div>
                <br />
                <br />
                <br />
              
                <table id="statuses" class="table table-striped table-bordered table-hover">  
                  <thead>
                    <tr>
                      <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
                      <td class="left"><?php echo $status_image; ?></td>                            
                      <td class="left"><?php echo $status_name; ?></td>              
                      <td class="left"><?php echo $status_url; ?></td>
                      <td class="left"><?php echo $sort_order; ?></td>
                      <td class="left"><?php echo $status_action; ?></td>  
                    </tr>
                  </thead>
                  <tbody>

                  <?php if ($statuses) { ?>
                  <?php foreach ($statuses as $status) { ?>
                  <tr>
                    <td style="text-align: center;">
                      <input type="checkbox" name="selected[]" value="<?php echo $status['status_id']; ?>" class="form-control"/>
                    </td>
                    <td class="left"><img src="<?php echo $status['thumb']; ?>" /></td>
                    <td class="left"><?php echo $status['name']; ?></td>
                    <td class="left"><a href="<?php echo $status['url']; ?>"><?php echo $status['url']; ?></a></td>
                    <td class="left"><?php echo $status['sort_order']; ?></td>
                    <td class="left"><?php foreach ($status['action'] as $action) { ?>
                      <a href="<?php echo $action['href']; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
                      <?php } ?></td>
                  </tr>
                  <?php } ?>
                  <?php } else { ?>
                  <tr>
                    <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
                  </tr>
                  <?php } ?>

                  </tbody>
                </table>

                <div class="pagination">  
                  <?php echo $pagination; ?>
                </div>  

              </form>  

							<input type="hidden" name="product_status_module[0][product_status]" value="1" class="form-control"/>
              
            </div>

            <div class="tab-pane" id="tab-general">
              <form action="<?php echo $action_settings; ?>" method="post" enctype="multipart/form-data" id="form-settings">
                <br />
                <div class="pull-right">
                <button type="submit" form="form-settings" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                </div>
                <br />
                <br />
                <br />

                <table id="general" class="table table-striped table-bordered table-hover">
                  <tr>
                    <td class="left"><?php echo $text_key; ?></td>              
                    <td width="500" style="text-align: left;">
                      <input type="text" size="70" name="product_status_options[key]" value="<?php echo isset($options['key']) ? $options['key'] : '';?>" class="form-control">
                    </td>
                  </tr>
                </table>
                <br />

                <table id="general" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="left"></td>
                      <td class="left"><?php echo $text_product; ?></td>
                      <td class="left"><?php echo $text_category; ?></td>
                    </tr>								  
                  </thead>
                  <tbody >
                    <tr>
                      <td class="left"><?php echo $text_image_width; ?><br /><?php echo $text_image_width_help; ?></td>              
                      <td style="text-align: left;">
                        <input type="text" name="product_status_options[product][image_width]" value="<?php echo isset($options['product']['image_width']) ? $options['product']['image_width'] : '0';?>" class="form-control">
                      </td>
                      <td style="text-align: left;">
                        <input type="text" name="product_status_options[category][image_width]" value="<?php echo isset($options['category']['image_width']) ? $options['category']['image_width'] : '0';?>" class="form-control">
                      </td>
                    </tr>
                    <tr>
                      <td class="left"><?php echo $text_image_height; ?><br /><?php echo $text_image_height_help; ?></td>              
                      <td style="text-align: left;">
                        <input type="text" name="product_status_options[product][image_height]" value="<?php echo isset($options['product']['image_height']) ? $options['product']['image_height'] : '0';?>" class="form-control">
                      </td>
                      <td style="text-align: left;">
                        <input type="text" name="product_status_options[category][image_height]" value="<?php echo isset($options['category']['image_height']) ? $options['category']['image_height'] : '0';?>" class="form-control">
                      </td>
                    </tr>

                    <tr>
                      <td class="left"><?php echo $text_sticker_image_width; ?><br /><?php echo $text_sticker_image_width_help; ?></td>              
                      <td style="text-align: left;">
                        <input type="text" name="product_status_options[product_sticker][image_width]" value="<?php echo isset($options['product_sticker']['image_width']) ? $options['product_sticker']['image_width'] : '0';?>" class="form-control">
                      </td>
                      <td style="text-align: left;">
                        <input type="text" name="product_status_options[category_sticker][image_width]" value="<?php echo isset($options['category_sticker']['image_width']) ? $options['category_sticker']['image_width'] : '0';?>" class="form-control">
                      </td>
                    </tr>
                    <tr>
                      <td class="left"><?php echo $text_sticker_image_height; ?><br /><?php echo $text_sticker_image_height_help; ?></td>              
                      <td style="text-align: left;">
                        <input type="text" name="product_status_options[product_sticker][image_height]" value="<?php echo isset($options['product_sticker']['image_height']) ? $options['product_sticker']['image_height'] : '0';?>" class="form-control">
                      </td>
                      <td style="text-align: left;">
                        <input type="text" name="product_status_options[category_sticker][image_height]" value="<?php echo isset($options['category_sticker']['image_height']) ? $options['category_sticker']['image_height'] : '0';?>" class="form-control">
                      </td>
                    </tr>

                    <tr>
                      <td class="left"><?php echo $text_name_display; ?></td>              
                      <td style="text-align: left;">
                        <select name="product_status_options[product][name_display]" class="form-control">
                          <option value="0" <?php echo (isset($options['product']['name_display']) && !$options['product']['name_display']) ?  'selected="selected"' : '';?>><?php echo $text_name_display_disable; ?></option>
                          <option value="next" <?php echo (isset($options['product']['name_display']) && $options['product']['name_display'] == 'next') ?  'selected="selected"' : '';?>><?php echo $text_name_display_next; ?></option>
                          <option value="tip" <?php echo (isset($options['product']['name_display']) && $options['product']['name_display'] == 'tip') ?  'selected="selected"' : '';?>><?php echo $text_name_display_tip; ?></option>
                        </select>					
                      </td>
                      <td style="text-align: left;">
                        <select name="product_status_options[category][name_display]" class="form-control">
                          <option value="0" <?php echo (isset($options['category']['name_display']) && !$options['category']['name_display']) ?  'selected="selected"' : '';?>><?php echo $text_name_display_disable; ?></option>
                          <option value="next" <?php echo (isset($options['category']['name_display']) && $options['category']['name_display'] == 'next') ?  'selected="selected"' : '';?>><?php echo $text_name_display_next; ?></option>
                          <option value="tip" <?php echo (isset($options['category']['name_display']) && $options['category']['name_display'] == 'tip') ?  'selected="selected"' : '';?>><?php echo $text_name_display_tip; ?></option>
                        </select>					
                      </td>
                    </tr>
                    <tr>
                      <td class="left"><?php echo $text_status_display; ?></td>              
                      <td style="text-align: left;">
                        <select name="product_status_options[product][status_display]" class="form-control">
                          <option value="0" <?php echo (isset($options['product']['status_display']) && !$options['product']['status_display']) ?  'selected="selected"' : '';?>><?php echo $text_status_display_disable; ?></option>
                          <option value="inline" <?php echo (isset($options['product']['status_display']) && $options['product']['status_display'] == 'inline') ?  'selected="selected"' : '';?>><?php echo $text_status_display_inline; ?></option>
                          <option value="new_line" <?php echo (isset($options['product']['status_display']) && $options['product']['status_display'] == 'new_line') ?  'selected="selected"' : '';?>><?php echo $text_status_display_new_line; ?></option>
                        </select>					
                      </td>
                      <td style="text-align: left;">
                        <select name="product_status_options[category][status_display]" class="form-control">
                          <option value="0" <?php echo (isset($options['category']['status_display']) && !$options['category']['status_display']) ?  'selected="selected"' : '';?>><?php echo $text_status_display_disable; ?></option>
                          <option value="inline" <?php echo (isset($options['category']['status_display']) && $options['category']['status_display'] == 'inline') ?  'selected="selected"' : '';?>><?php echo $text_status_display_inline; ?></option>
                          <option value="new_line" <?php echo (isset($options['category']['status_display']) && $options['category']['status_display'] == 'new_line') ?  'selected="selected"' : '';?>><?php echo $text_status_display_new_line; ?></option>
                        </select>					
                      </td>
                    </tr>
                    <tr>
                      <td class="left"><?php echo $text_auto_display; ?></td>              
                      <td style="text-align: left;">
                        <select name="product_status_options[product][auto_display]" class="form-control">
                          <option value="0" <?php echo (isset($options['product']['auto_display']) && !$options['product']['auto_display']) ?  'selected="selected"' : '';?>><?php echo $text_auto_display_disable; ?></option>
                          <option value="1" <?php echo (isset($options['product']['auto_display']) && $options['product']['auto_display']) ?  'selected="selected"' : '';?>><?php echo $text_auto_display_enable; ?></option>                    
                        </select>					
                      </td>
                      <td style="text-align: left;">
                        <select name="product_status_options[category][auto_display]" class="form-control">
                          <option value="0" <?php echo (isset($options['category']['auto_display']) && !$options['category']['auto_display']) ?  'selected="selected"' : '';?>><?php echo $text_auto_display_disable; ?></option>
                          <option value="1" <?php echo (isset($options['category']['auto_display']) && $options['category']['auto_display']) ?  'selected="selected"' : '';?>><?php echo $text_auto_display_enable; ?></option>                    
                        </select>					
                      </td>
                    </tr>
                    <tr>
                      <td class="left"><?php echo $text_sticker_display; ?></td>              
                      <td style="text-align: left;">
                        <select name="product_status_options[product][sticker_display]" class="form-control">
                          <option value="0" <?php echo (isset($options['product']['sticker_display']) && !$options['product']['sticker_display']) ?  'selected="selected"' : '';?>><?php echo $text_sticker_display_disable; ?></option>
                          <option value="1" <?php echo (isset($options['product']['sticker_display']) && $options['product']['sticker_display']) ?  'selected="selected"' : '';?>><?php echo $text_sticker_display_enable; ?></option>                    
                        </select>					
                      </td>
                      <td style="text-align: left;">
                        <select name="product_status_options[category][sticker_display]" class="form-control">
                          <option value="0" <?php echo (isset($options['category']['sticker_display']) && !$options['category']['sticker_display']) ?  'selected="selected"' : '';?>><?php echo $text_sticker_display_disable; ?></option>
                          <option value="1" <?php echo (isset($options['category']['sticker_display']) && $options['category']['sticker_display']) ?  'selected="selected"' : '';?>><?php echo $text_sticker_display_enable; ?></option>                    
                        </select>					
                      </td>
                    </tr> 
                  </tbody>
                </table>

                <br />
                <table id="general" class="table table-striped table-bordered table-hover">
                  <tbody >
                    <tr>
                      <td class="left"><?php echo $status_new_hours; ?></td>              
                      <td style="text-align: left;">
                        <input type="text" name="product_status_options[status_new_hours]" value="<?php echo isset($options['status_new_hours']) ? $options['status_new_hours'] : '0';?>" class="form-control">
                      </td>
                    </tr>
                    <tr>
                      <td class="left"><?php echo $status_bestseller_total; ?></td>              
                      <td style="text-align: left;">
                        <input type="text" name="product_status_options[status_bestseller_total]" value="<?php echo isset($options['status_bestseller_total']) ? $options['status_bestseller_total'] : '0';?>" class="form-control">
                      </td>
                    </tr>
                    <tr>
                      <td class="left"><?php echo $status_popular_total; ?></td>              
                      <td style="text-align: left;">
                        <input type="text" name="product_status_options[status_popular_total]" value="<?php echo isset($options['status_popular_total']) ? $options['status_popular_total'] : '0';?>" class="form-control">
                      </td>
                    </tr>
                    <tr>
                      <td class="left"><?php echo $cache_results; ?></td>              
                      <td style="text-align: left;">
                        <input type="checkbox" name="product_status_options[cache]" value="1" <?php echo isset($options['cache']) && $options['cache'] ? 'checked="checked"' : '';?>" class="form-control">
                      </td>
                    </tr>
                  </tbody>
                </table>

              </form>

            </div>
							
						<div class="tab-pane" id="tab-support">
              <?php echo $support_text; ?>
            </div>
            
					</div>
      </div>
    </div>
  </div>
  
	<div id="copyright">author sv2109 (sv2109@gmail.com) license for 1 product copy granted for Blackangel861 ( filosofia-buduara.ru)</div>
  
</div>
<?php echo $footer; ?>