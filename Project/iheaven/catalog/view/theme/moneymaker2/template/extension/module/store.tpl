<p class="h2"><?php echo $heading_title; ?></p>
<div class="row">
  <div class="col-sm-12">
    <p class="text-center"><?php echo $text_store; ?></p>
    <?php foreach ($stores as $store) { ?>
    <?php if ($store['store_id'] == $store_id) { ?>
    <p class=""><a href="<?php echo $store['url']; ?>"><b><?php echo $store['name']; ?></b></a></p>
    <?php } else { ?>
    <p class=""><a href="<?php echo $store['url']; ?>"><?php echo $store['name']; ?></a></p>
    <?php } ?>
    <?php } ?>
  </div>
</div>
