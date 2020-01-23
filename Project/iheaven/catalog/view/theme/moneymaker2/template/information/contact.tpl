<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <ul class="breadcrumb text-center">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
        <?php if($i+1<count($breadcrumbs)) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li><?php } else { ?><li class="active"><?php echo $breadcrumb['text']; ?></li><?php } ?>
        <?php } ?>
      </ul>
      <h1 class="h2 text-center content-title"><?php echo $heading_title; ?></h1>
      <div class="row catalog-thumb">
        <div class="col-sm-12 text-center">
          <span class="fa-stack fa-2x img-thumbnail">
            <i class="fa fa-circle fa-stack-2x"></i>
            <i class="fa fa-phone fa-stack-1x fa-inverse"></i>
          </span>
        </div>
      </div>
      <?php if ($moneymaker2_catalog_contacts_quicklinks) { ?>
      <div class="row catalog-sub">
        <div class="col-sm-12">
          <div class="text-center">
            <a class="btn btn-sm btn-link" href="tel:<?php echo preg_replace('/\D/', '', $telephone); ?>"><?php echo $moneymaker2_catalog_contacts_call_title; ?></a>
            <a class="btn btn-sm btn-link" href="mailto:<?php echo $config_email; ?>"><?php echo $moneymaker2_catalog_contacts_mail_title; ?></a>
            <?php if ($geocode) { ?><a class="btn btn-sm btn-link" href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" rel="noopener"><?php echo $button_map; ?></a><?php } ?>
            <?php if ($moneymaker2_catalog_contacts_link) { ?>
            <a class="btn btn-sm btn-link" href="<?php echo $moneymaker2_catalog_contacts_multilink ? $moneymaker2_catalog_contacts_multilink : $moneymaker2_catalog_contacts_link; ?>"><?php echo $moneymaker2_catalog_contacts_link_title; ?></a>
            <?php } ?>
          </div>
        </div>
      </div>
      <?php } ?>
      <hr class="catalog-hr">
      <?php if ($locations) { ?>
      <br />
      <h3><?php echo $text_store; ?></h3>
      <div class="panel-group" id="accordion">
        <?php foreach ($locations as $location) { ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
            <div class="panel-body">
              <div class="row">
                <?php if ($location['image']) { ?>
                <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <div class="col-sm-3"><strong><?php echo $location['name']; ?></strong><br />
                  <address>
                  <?php echo $location['address']; ?>
                  </address>
                  <?php if ($location['geocode']) { ?>
                  <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" rel="noopener" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                  <?php } ?>
                </div>
                <div class="col-sm-3"> <strong><?php echo $text_telephone; ?></strong><br>
                  <?php echo $location['telephone']; ?><br />
                  <br />
                  <?php if ($location['fax']) { ?>
                  <strong><?php echo $text_fax; ?></strong><br>
                  <?php echo $location['fax']; ?>
                  <?php } ?>
                </div>
                <div class="col-sm-3">
                  <?php if ($location['open']) { ?>
                  <strong><?php echo $text_open; ?></strong><br />
                  <?php echo $location['open']; ?><br />
                  <br />
                  <?php } ?>
                  <?php if ($location['comment']) { ?>
                  <strong><?php echo $text_comment; ?></strong><br />
                  <?php echo $location['comment']; ?>
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <div class="row">
        <div class="col-sm-6">
          <h3><?php echo $text_telephone; ?></h3>
          <p>
            <i class="fa fa-fw fa-phone"></i> <?php echo $telephone; ?>
            <?php if ($fax) { ?><br /><i class="fa fa-fw fa-phone"></i> <?php echo $fax; ?> (<?php echo $text_fax; ?>)<?php } ?>
          </p>
          <h3><?php echo $text_address; ?></h3>
          <p>
            <?php if ($geocode) { ?>
            <a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" data-toggle="tooltip" title="<?php echo $button_map; ?>" target="_blank" rel="noopener"><i class="fa fa-fw fa-map-marker"></i> <?php echo $address; ?></a>
            <?php } else { ?>
            <i class="fa fa-fw fa-map-marker"></i> <?php echo $address; ?>
            <?php } ?>
          </p>
          <p class="hidden"><br /><i class="fa fa-fw fa-envelope-o"></i> <?php echo $config_email; ?></p>
        </div>
        <div class="col-sm-6">
          <?php if ($open) { ?>
          <h3><?php echo $text_open; ?></h3>
          <p><i class="fa fa-fw fa-clock-o"></i> <?php echo $open; ?></p>
          <?php } ?>
          <?php if ($comment) { ?>
          <h3><?php echo $text_comment; ?></h3>
          <p><small><?php echo $comment; ?></small></p>
          <?php } ?>
        </div>
      </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend><?php echo $text_contact; ?></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-md-8 col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-md-8 col-sm-10">
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
            <div class="col-md-8 col-sm-10">
              <textarea name="enquiry" rows="1" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <div class="text-danger"><?php echo $error_enquiry; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php echo $captcha; ?>
          <?php if ($text_agree) { ?>
          <div class="form-group required">
            <div class="col-sm-offset-2 col-sm-10">
              <?php echo $text_agree; ?>
              <?php if ($agree) { ?>
              <input type="checkbox" name="agree" value="1" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="agree" value="1" />
              <?php } ?>
              <?php if ($error_agree) { ?>
              <div class="text-danger"><?php echo $error_agree; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <div class="form-group required">
              <div class="buttons col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary"><i class="fa fa-angle-right"></i> <?php echo $button_submit; ?></button>
              </div>
          </div>
        </fieldset>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php if ($moneymaker2_catalog_contacts_map&&$geocode) { ?>
<div id="geomap"></div>
<script>
  google.maps.event.addDomListener(window, 'load', init);
  function init() {
    var mapOptions = {
      zoom: 15,
      scrollwheel: false,
      draggable: true,
      center: new google.maps.LatLng(<?php echo $geocode; ?>),
      styles: [{"featureType":"landscape","stylers":[{"saturation":-100},{"lightness":65},{"visibility":"on"}]},{"featureType":"poi","stylers":[{"saturation":-100},{"lightness":51},{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"road.arterial","stylers":[{"saturation":-100},{"lightness":30},{"visibility":"on"}]},{"featureType":"road.local","stylers":[{"saturation":-100},{"lightness":40},{"visibility":"on"}]},{"featureType":"transit","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"administrative.province","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":-25},{"saturation":-100}]},{"featureType":"water","elementType":"geometry","stylers":[{"hue":"#ffff00"},{"lightness":-25},{"saturation":-97}]}]
    };
    var mapElement = document.getElementById('geomap');
    var map = new google.maps.Map(mapElement, mapOptions);
    var infowindow = new google.maps.InfoWindow({
      content: '<?php echo $store; ?>'
    });
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(<?php echo $geocode; ?>),
      map: map,
      title: '<?php echo $store; ?>'
    });
    infowindow.open(map, marker);
  }
</script>
<?php } ?>
<?php if ($moneymaker2_catalog_contacts_map_custom&&$moneymaker2_catalog_contacts_map_custom_code) { ?>
<div id="geomap">
  <?php echo $moneymaker2_catalog_contacts_map_custom_code; ?>
</div>
<?php } ?>
<?php echo $footer; ?>
