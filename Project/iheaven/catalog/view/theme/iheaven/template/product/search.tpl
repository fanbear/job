<?php echo $header; ?>
<div class="menu">
    <div class="container">
        <div class="row">
            <?php echo $content_top; ?>
        </div>
    </div>
</div>
<div class="container">
  <ul class="breadcrumb" itemscope itemtype="https://schema.org/BreadcrumbList">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
        <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
          <?php if($i+1 < count($breadcrumbs)) { ?>
            <a itemprop="item" href="<?php echo $breadcrumb['href']; ?>"><span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a>
            <meta itemprop="position" content="<?php echo $key+1; ?>" />
          <?php } else { ?>
            <a rel="nofollow" itemprop="item" href="<?php echo $breadcrumb['href']; ?>">
              <span itemprop="name"><?php echo $breadcrumb['text']; ?></span>
            </a>
            <meta itemprop="position" content="<?php echo $key+1; ?>" /> 
          <?php } ?>
        </li>
        <?php } ?>
    </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <h1><?php echo $heading_title; ?></h1>
      <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
      <div class="row">
        <div class="col-sm-4">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <!-- <div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div> -->
       <!--  <div class="col-sm-3">
          <label class="checkbox-inline">
            <?php if ($sub_category) { ?>
            <input type="checkbox" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            <?php echo $text_sub_category; ?></label>
        </div> -->
      </div>
      <p>
        <label class="checkbox-inline">
          <?php if ($description) { ?>
          <input type="checkbox" name="description" value="1" id="description" checked="checked" />
          <?php } else { ?>
          <input type="checkbox" name="description" value="1" id="description" />
          <?php } ?>
          <?php echo $entry_description; ?></label>
      </p>
      <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button-cart btn btn-primary" />
      <h2><?php echo $text_search; ?></h2>
      <?php if ($products) { ?>
      <div class="row">
        <div class="col-md-2 col-sm-6 hidden-xs">
          <div class="btn-group btn-group-sm">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
       <!--  <div class="col-md-3 col-sm-6">
          <div class="form-group">
            <a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-link"><?php echo $text_compare; ?></a>
          </div>
        </div> -->
        <div class="col-md-4 col-xs-6">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
            <select id="input-sort" class="form-control" onchange="location = this.value;">
              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <!-- <div class="col-md-3 col-xs-6">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
            <select id="input-limit" class="form-control" onchange="location = this.value;">
              <?php foreach ($limits as $limits) { ?>
              <?php if ($limits['value'] == $limit) { ?>
              <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div> -->
      </div>
      <div class="row">
        <?php foreach ($products as $product) { ?>
          <div class="product-layout product-list col-xs-12 pr-t">
            <div class="product-thumb">
                  <div class="col-sm-12">
                      <div class="row">
                          <div class="col-sm-3 col-xs-3">
                              <div id="gift">
                                  <img src="/image/catalog/gift-1.png" style="width: auto; height: 40px; z-index: 1; position: relative;" alt="Подарок">
                                  <div class="text">
                                    <b> + ПОДАРОК</b>
                                    <p>При покупке данного товара можно выбрать подарок</p>
                                  </div>
                              </div>
                              <div id="mono">
                                  <img  src="/image/catalog/mono.png" style="width: auto; height: 38px; z-index: 1; position: relative;" alt="монобанк">
                                  <div class="text">
                                    <b>ПОКУПКА ЧАСТЯМИ ОТ MONOBANK</b>
                                    <p>"Покупка частями" - это простой способ приобрести желаемый товар разделив оплату на 4, 6 и 10 платежей, без комиссии и дополнительных платежей</p>
                                  </div>
                              </div>
                              <!-- <div id="privat">
                                  <img src="/image/catalog/privat.jpeg" style="width: auto; height: 32px; z-index: 1; position: relative;" alt="приват">
                                  <div class="text">
                                    <b>ОПЛАТА ЧАСТЯМИ ОТ ПРИВАТБАНКА НА 10 ПЛАТЕЖЕЙ</b>
                                    <p>1. Наличие кредитной карты ПриватБанка с активированной услугой "Оплата Частями"</p>
                                    <p>2. Доступный кредитный лимит, превышающий сумму покупки</p>
                                    <p>Первый платёж будет списан с кредитной карты. Первый платёж + 9 последующих = 10 платежей.</p>
                                  </div>
                              </div> -->
                              <div id="rasrochka">
                                  <img src="/image/catalog/rasrochka.png"  style="width: auto; height: 38px; z-index: 1; position: relative;" alt="рассрочка">
                                  <div class="text">
                                    <b>Беспроцентная рассрочка</b>
                                    <p>Беспроцентная рассрочка до 4 месяцев</p>
                                    <p>Кредит до 24 месяцев - 2% в месяц</p>
                                    <!-- <p><a href="#">Детальнее >>></a></p> -->
                                </div>
                              </div>
                              <div id="mastercard">
                                  <img src="/image/catalog/mastercard.png" style="width: auto; height: 38px; z-index: 1; position: relative;" alt="оплата картой">
                                  <div class="text">
                                    <b>Доступна оплата картами Visa/Mastercard</b>
                                    <p>Все операции проходят через систему WayForPay</p>
                                    <p>1. Оплата в один клик</p>
                                    <p>2. Регулярные платежи</p>
                                  </div>
                              </div>
                              <div id="novaya"> 
                                  <img src="/image/catalog/novaya.png"  style="width: auto; height: 38px; z-index: 1; position: relative;" alt="рассрочка">
                                  <div class="text">
                                      <b>Доступна доставка перевозчиком Новая Почта</b>
                                      <p>1. Доставка в отделение вашего города</p>
                                      <p>2. Адресная доставка</p>
                                      <p>3. Доствка курьером</p>
                                  </div>
                              </div>
                              <div id="sale">
                              <img class="wow swing" data-wow-duration = "2s" data-wow-offset="100" data-wow-iteration = "1" src="/image/catalog/black_fridey_tovar.png" style=" width: auto; height: 60px; z-index: 1; position: absolute;" alt="Подарок">
                                  <!-- <div class="text">
                                    <b> + ПОДАРОК</b>
                                    <p>При покупке данного товара можно выбрать подарок</p>
                                  </div> -->
                              </div>
                          </div>
                          <div class="col-sm-9 col-xs-9" style="padding: 0;">
                            <div class="col-sm-9 col-xs-10 p-name"><p><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></p></div>
                            <div class="col-sm-3 col-xs-2 wishlist"><button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><img src="https://chaspick.com.ua/image/catalog/whishilist.png" alt="Список желаемых"></button>
                            </div>
                            <div class="image">
                              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                            </div>
                          </div>
                      </div>
                  </div>
                  <div class="col-sm-12 caption">
                     <p class="desk"><?php echo $product['description']; ?></p>
                      <?php if ($product['price']) { ?>
                          <?php if (!$product['special']) { ?>
                          <p class="price">
                            <span>Цена: </span> &nbsp;<?php echo $product['price']; ?> 
                          </p>
                          <?php } else { ?>
                          <p class="price-old">
                            <span style="color: #F7941E">B</span>
                            <span style="color: white">l</span>
                            <span style="color: #F7941E">a</span>
                            <span style="color: white">c</span>
                            <span style="color: #F7941E">k</span>
                            <span>&#8194;</span>
                            <span style="color: white">S</span>
                            <span style="color: #F7941E">a</span>
                            <span style="color: white">l</span>
                            <span style="color: #F7941E">e</span>
                            <span style="color: white">:</span>
                            <span>&#8194;</span>
                            <span style="color: #F7941E; text-decoration: line-through"><?php echo $product['price']; ?> </span></p>
                          <p class="price-new"><span>Цена: </span> &#8195;<?php echo $product['special']; ?> </p> 
                          <?php } ?>
                          <!-- <?php if ($product['tax']) { ?>
                            <p class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></p>
                          <?php } ?> -->
                        <?php } ?>
                     <!--  <?php if ($product['rating']) { ?>
                      <div class="rating">
                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                        <?php if ($product['rating'] < $i) { ?>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                        <?php } else { ?>
                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                        <?php } ?>
                        <?php } ?>
                      </div>
                      <?php } ?> -->
                  </div>
                  <div class="mt-1"></div>
                  <div class="col-sm-6 col-xs-6" style="padding: 0;"><div class="desk-button"><a data-toggle="tooltip" data-original-title="Перейти на страницу товара" href="<?php echo $product['href']; ?>">Подробней</a></div></div>
                  <div class="col-sm-6 col-xs-6" style="padding: 0;"><p class="button-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');">Купить</p></div>
                    <!-- <div class="button-group">
                      <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                      <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                      <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                    </div> -->
                  <div class="atr-hover">
                      <ul>
                          <?php if($product['attribute_groups']) { ?>
                              <?php foreach($product['attribute_groups'] as $attribute_group) { ?>
                                  <?php foreach($attribute_group['attribute'] as $attribute) { ?>
                                      <?php if(in_array($attribute['attribute_id'], array(176,168,171,164,175,174))) { ?>
                                          <li><b><?php echo $attribute['name']; ?>:</b> <span><?php echo $attribute['text']; ?></span></li>
                                      <?php }?>
                                <?php } ?>
                              <?php } ?>
                          <?php } ?>
                      </ul>
                  </div>
            </div>
          </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>