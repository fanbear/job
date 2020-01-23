<?php if ($price) { ?>
	<?php if (!$special) { ?>
	<li>
	  <h2><?php echo $price; ?></h2>
	</li>
	<?php } else { ?>
	<li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
	<li>
	  <h2><?php echo $special; ?></h2>
	</li>
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
<?php } ?>