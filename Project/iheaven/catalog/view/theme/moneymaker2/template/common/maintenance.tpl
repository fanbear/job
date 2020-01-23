<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div id="content" class="col-sm-12">
      <h1 class="h2 text-center content-title"><?php echo $heading_title; ?></h1>
      <div class="row catalog-thumb">
        <div class="col-sm-12 text-center">
            <span class="fa-stack fa-2x img-thumbnail">
              <i class="fa fa-circle fa-stack-2x"></i>
              <i class="fa fa-cogs fa-stack-1x fa-inverse"></i>
            </span>
        </div>
      </div>
      <div class="row catalog-descr">
        <div class="col-sm-12 text-center">
          <div>
            <p><?php echo $message; ?></p>
          </div>
        </div>
      </div>
      <hr class="catalog-hr">
    </div>
  </div>
</div>
<?php echo $footer; ?>