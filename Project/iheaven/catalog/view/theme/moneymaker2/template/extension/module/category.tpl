<p class="h2"><?php echo $heading_title; ?></p>
<div class="list-group">
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['category_id'] == $category_id) { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item<?php if ($child_id==0) { ?> active<?php } ?>"><?php if (isset($category['icon'])&&$category['icon']) { ?><i class="fa fa-fw fa-<?php echo $category['icon']; ?>"></i> <?php } ?><?php echo $category['name']; ?></a>
  <?php if ($category['children']) { ?>
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['category_id'] == $child_id) { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item active">&nbsp;&nbsp;&nbsp;<?php if (isset($child['icon'])&&$child['icon']) { ?> <i class="fa fa-fw fa-<?php echo $child['icon']; ?>"></i> <?php } else { ?>- <?php } ?><?php echo $child['name']; ?></a>
  <?php } else { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;<?php if (isset($child['icon'])&&$child['icon']) { ?> <i class="fa fa-fw fa-<?php echo $child['icon']; ?>"></i> <?php } else { ?>- <?php } ?><?php echo $child['name']; ?></a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  <?php } else { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item"><?php if (isset($category['icon'])&&$category['icon']) { ?><i class="fa fa-fw fa-<?php echo $category['icon']; ?>"></i> <?php } ?><?php echo $category['name']; ?></a>
  <?php } ?>
  <?php } ?>
</div>
