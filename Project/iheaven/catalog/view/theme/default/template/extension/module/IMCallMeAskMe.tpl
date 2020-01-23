<?php 

	function getIMCAValue($lang_settings, $lang_id, $name)
	{
		$result = '';
		if (isset($lang_settings[$lang_id])) {
			$result = $lang_settings[$lang_id][$name];
		}
		else {
			$result = $lang_settings['default'][$name];
		}
		
		return $result;
	}

	function echoText($lang_settings, $lang_id, $name) {
		echo getIMCAValue($lang_settings, $lang_id, $name);
	}

	function echoTextAfter($lang_settings, $lang_id, $name) {
		$result = getIMCAValue($lang_settings, $lang_id, $name);
		$is_after_inc = getIMCAValue($lang_settings, $lang_id, $name . '_inc');
		
		if(trim($result) == '' || ('' . $is_after_inc == '0')) 
			return;
		
		echo '<div class="form-group">'
				. '<div class="col-sm-12">'
					. $result
				. '</div>'
			. '</div>'
		;
	}
	
	function getClassReq($lang_settings,  $lang_id, $name) {
		$result = getIMCAValue($lang_settings, $lang_id, $name);
		
		return (('' . $result) == '1' ? 'required' : '' );
	}
	
	function isInc($lang_settings,  $lang_id, $name) {
		$result = getIMCAValue($lang_settings, $lang_id, $name);
		
		return ('' . $result) == '1';
	}
	
	
	function echoField($lang_settings, $lang_id, $name) {
		if (isInc($lang_settings, $lang_id, $name . '_inc')) {
			echo '<div class="form-group ' . getClassReq($lang_settings, $lang_id, $name . '_req') . '">'
					. '<label class="control-label col-sm-4">'
						. getIMCAValue($lang_settings, $lang_id, $name)
					. '</label>'
					. '<div class="col-sm-8">'
						. '<input type="text" name="' . $name . '" value="" ' 
								. ' placeholder="' 
									. getIMCAValue($lang_settings, $lang_id, $name . '_ph')
								.  '" class="form-control" />'
					. '</div>'
				. '</div>'
			;
			echoTextAfter($lang_settings, $lang_id, $name . '_after');
		}
	}


	function echoFieldArea($lang_settings, $lang_id, $name) {
		if (isInc($lang_settings, $lang_id, $name . '_inc')) {
			echo '<div class="form-group ' . getClassReq($lang_settings, $lang_id, $name . '_req') . '">'
					. '<label class="control-label col-sm-4">'
						. getIMCAValue($lang_settings, $lang_id, $name)
					. '</label>'
					. '<div class="col-sm-8">'
						. '<textarea name="' . $name . '" rows="5" ' 
								. ' placeholder="' 
									. getIMCAValue($lang_settings, $lang_id, $name . '_ph')
								.  '" class="form-control" ></textarea>'
					. '</div>'
				. '</div>'
			;
			echoTextAfter($lang_settings, $lang_id, $name . '_after');
		}
	}
?>

<div class="modal fade" id="imcallask-form-container-popup" data-remote="" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: none;" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="exampleModalLabel">
                	<?php echoText($lang_settings, $language_id, 'header'); ?>
                </h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" method="post" action="index.php?route=extension/module/IMCallMeAskMe/sendMessage">
                	<!-- After Header -->
                	<?php echoTextAfter($lang_settings, $language_id, 'header_after'); ?>
                	
                	<!-- Name field  ---->
                	<?php echoField($lang_settings, $language_id, 'name'); ?>

                	<!-- Email field  -->
                	<?php echoField($lang_settings, $language_id, 'email'); ?>

                	<!-- Tel field  -->
                	<?php echoField($lang_settings, $language_id, 'tel'); ?>

                	<!-- Text field  -->
                	<?php echoFieldArea($lang_settings, $language_id, 'text'); ?>

                    <div class="form-group">
                    	<div class="buttons col-sm-12 text-right">
                        	<button type="submit" class="btn btn-primary" data-loading-text=">>>>>>>>>">
                        		<?php echoText($lang_settings, $language_id, 'btn_ok'); ?>
                       		</button>
                        	<button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
			                    <?php echoText($lang_settings, $language_id, 'btn_cancel'); ?>
			                </button>
		               	</div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>