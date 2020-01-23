<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<div class="panel <?php if (true) { if ($review['rating'] >= 4) { ?>panel-success<?php } else if ($review['rating'] == 3) { ?>panel-warning<?php } else { ?>panel-danger<?php } } else { ?>panel-default<?php } ?> " itemprop="review" itemscope itemtype="http://schema.org/Review">
  <div class="panel-heading">
    <div class="pull-left">
      <b itemprop="author"><?php echo $review['author']; ?></b>
    </div>
    <div class="text-right" itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
      <meta itemprop="worstRating" content="1" >
      <meta itemprop="bestRating" content="5">
      <meta itemprop="ratingValue" content="<?php echo $review['rating']; ?>">
      <?php for ($i = 1; $i <= 5; $i++) { ?>
      <?php if ($review['rating'] < $i) { ?>
      <i class="fa fa-star-o"></i>
      <?php } else { ?>
      <i class="fa fa-star"></i>
      <?php } ?>
      <?php } ?>
    </div>
  </div>
  <div class="panel-body">
    <p itemprop="reviewBody">
      <?php echo $review['text']; ?>
    </p>
    <p class="text-right text-muted">
      <time itemprop = "datePublished" datetime = "<?php echo $review['date_added']; ?>" ><?php echo $review['date_added']; ?></time>
    </p>
  </div>
</div>
<?php } ?>
<div class="row">
  <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
</div>
<?php } else { ?>
<div class="row">
  <div class="col-sm-12 text-center">
    <p><?php echo $text_no_reviews; ?></p>
  </div>
</div>
<?php } ?>
