<p class="h2"><?php echo $heading_title; ?></p>
<div class="filter-native">
  <?php foreach ($filter_groups as $filter_group) { ?>
  <p class="h5 text-muted"><?php echo $filter_group['name']; ?></p>
  <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
      <?php foreach ($filter_group['filter'] as $filter) { ?>
      <div class="checkbox">
        <label>
          <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
          <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
          <?php echo $filter['name']; ?>
          <?php } else { ?>
          <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" />
          <?php echo $filter['name']; ?>
          <?php } ?>
        </label>
      </div>
      <?php } ?>
  </div>
  <?php } ?>
  <p>
  <button type="button" id="button-filter" class="btn btn-default btn-sm btn-block"><i class="fa fa-fw fa-angle-right"></i><?php echo $button_filter; ?></button>
  </p>
</div>

<script><!--
$('#button-filter').on('click', function() {
	filter = [];

	$('input[name^=\'filter\']:checked').each(function(element) {
		filter.push(this.value);
	});

	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script>
