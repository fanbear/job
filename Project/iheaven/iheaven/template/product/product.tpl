<?php echo $header; ?>
<div class="menu">
    <div class="container">
        <div class="row">
            <?php echo $content_top; ?>
        </div>
    </div>
</div>
<script type="application/ld+json">
{
  "@context" : "http://schema.org",
  "@type" : "Product",
  "name" : "<?php echo $heading_title; ?>",
  "image" : "<?php echo $thumb; ?>",
  "description" : "<?php echo $heading_title; ?> купить в Киеве и Украине | цены от Iheaven Store",
  "url" : "https://iheaven.com.ua",
  "brand" : {
    "@type" : "Brand",
    "name" : "<?php echo $manufacturer; ?>"
  },
  "offers" : {
    "@type" : "Offer",
    "price" : "<?php echo $price; ?>",
    "priceCurrency" : "UAH",
    "sku" : "<?php echo $model; ?>"
  },
  "aggregateRating" : {
    "@type" : "AggregateRating",
    "ratingValue" : "4.9",
    "bestRating" : "5",
    "worstRating" : "4.2",
    "ratingCount" : "217"
  }
}
</script>
<div class="container">
  <ul class="breadcrumb" itemscope itemtype="https://schema.org/BreadcrumbList">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
        <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
          <?php if($i+1 < count($breadcrumbs)) { ?>
            <a itemprop="item" href="<?php echo $breadcrumb['href']; ?>"><span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a>
            <meta itemprop="position" content="1" />
          <?php } else { ?>
            <a rel="nofollow" itemprop="item" href="<?php echo $breadcrumb['href']; ?>">
              <span itemprop="name"><?php echo $breadcrumb['text']; ?></span>
            </a>
            <meta itemprop="position" content="1" /> 
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
      <div class="row">
        <div class="col-sm-8" style="margin-top: 20px;">
            <div class="row">
                    <h1 class="pr-name pr-xs"><?php echo $heading_title; ?></h1>
                    <div class="col-sm-6 col-xs-12 img-block">
                        <div id="black"><img class="wow swing" data-wow-duration="4s" data-wow-offset="100" data-wow-iteration="3" src="/image/catalog/new_yaer.png" class="img-responsive" alt=""></div>
                        <!-- <div class="col-sm-2 col-xs-2" style="padding: 0">
                            <?php if ($images) { ?>
                                <?php foreach ($images as $image) { ?>
                                <a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
                                <?php } ?>
                            <?php } ?>
                        </div> -->
                        <div class="col-sm-11 col-xs-12">
                            <?php if ($thumb || $images) { ?>
                              <ul class="thumbnails">
                                    <?php if ($thumb) { ?>
                                    <li><a class="img-product" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
                                    <?php } ?>
                                    <div class="img-carousel owl-carousel">
                                    <?php if ($images) { ?>
                                        <?php foreach ($images as $image) { ?>
                                        <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
                                        <?php } ?>
                                    <?php } ?>
                                    </div>
                              </ul>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-12 block-price" id="product">
                        <h1 class="pr-name pr-lg"><?php echo $heading_title; ?></h1>
                         <?php if ($price) { ?>
                            <hr>
                            <ul class="list-unstyled price-art">
                                <?php if (!$special) { ?>
                                <p class="p_sp" id="new_p">&#8194;<?php echo $price; ?></p>
                                <li class="button-cpl" style="color: #1e3048; font-weight: bold; font-size: 16px;">+ Выбраный комплект <span data-toggle="tooltip" data-original-title="Удалить комплект" onclick="del_option();" class="button-refresh">&times;</span></li>
                                <?php } else { ?>
                                <p id="old-price">
                                    <span class="skidon"><?php echo $price; ?></span>
                                    <span class="procent"></span>
                                </p>
                                <p class="p_sp" id="new_p">&#8194;<?php echo $special; ?></p>
                                <li class="button-cpl" style="color: #1e3048; font-weight: bold; font-size: 16px;">+ Выбраный комплект <span data-toggle="tooltip" data-original-title="Удалить комплект" onclick="del_option(); " class="button-refresh">&times;</span></li>
                                <!-- СКИДКИ -->
                                <script>
                                       var str = $('.skidon .autocalc-product-price').html().replace(" ", "");
                                       var dst = $('.p_sp span').html().replace(" ", "");
                                       var set = parseInt(str) - parseInt(dst);
                                       var delim = parseInt(str) / 100;
                                       var procent = Math.ceil(set / delim).toFixed(0);
                                       $('.skidon .autocalc-product-price').removeClass('autocalc-product-price');
                                       $('.procent').html("<div class='informer'><span class='t_p'> - " + procent + " % </span>&#8194;Ваша скидка <span style='color: red;'>&#8194;"+ set +"&#8194;грн<span></div>");
                                </script>
                                <?php } ?>
                            </ul>
                            <hr>
                        <?php } ?>
                        <script>function del_option(){location.reload();}</script>
                        <div class="btn-product-group">
                                    <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block">Купить</button>
                                    <button type="button" id="one-click" data-pdqo-item="<?php echo $product_id; ?>" onclick="pdqoObject(this);" data-toggle="tooltip" title="Быстрый заказ"><img src="/image/catalog/product-img/one-click.png" alt="В один клик"></button>
                                    <button type="button" id="wish" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><img src="https://chaspick.com.ua/image/catalog/whishilist.png" alt="Закладки"></button>
                                    <div class="credit_in_mount">
                                        <p id="btn-credit" onclick="$('#xd_zvonok_modal').modal('show');">Купить в кредит</p>
                                            <p style="font-size: 14px; color: #232323; font-weight: bold;">На 4 месяца без (%)<span>&#8194;от&#8194;</span><span class="credit_four" style="color: #3d72bb; font-size: 20px;"></span ><span>&#8194;грн/мес</span>
                                            <p style="font-size: 14px; color: #232323; font-weight: bold;">До 24 месяца под (2%/мес)<span>&#8194;от&#8194;</span><span class="credit_tw_four" style="color: #3d72bb; font-size: 20px;"></span ><span>&#8194;грн/мес</span>
                                            <?php if (!empty($price) && empty($special)) { ?>
                                                <script>
                                                        var new_price = $('.p_sp .autocalc-product-price').html().replace(" ", "");
                                                        var four = parseInt(new_price) / 4;
                                                        var tw_four = parseInt(new_price) / 24;
                                                        $('.credit_in_mount .credit_four').html(Math.round(four));
                                                        $('.credit_in_mount .credit_tw_four').html(Math.round(tw_four));
                                                        function check(){
                                                            setTimeout(function(){
                                                                $('.credit_in_mount .credit_four').empty();
                                                                var new_price = $('.p_sp .autocalc-product-price').html().replace(" ", "");
                                                                var four = parseInt(new_price) / 4;
                                                                var tw_four = parseInt(new_price) / 24;
                                                                $('.credit_in_mount .credit_four').html(Math.round(four));
                                                                $('.credit_in_mount .credit_tw_four').html(Math.round(tw_four));
                                                            },500);
                                                        };
                                                </script>
                                            <?php }?>
                                            <?php if (!empty($special)) { ?> 
                                              <script>
                                                    var new_price = $('.p_sp span').html().replace(" ", "");
                                                        var four = parseInt(new_price) / 4;
                                                        var tw_four = parseInt(new_price) / 24;
                                                        $('.credit_in_mount .credit_four').html(Math.round(four));
                                                        $('.credit_in_mount .credit_tw_four').html(Math.round(tw_four));
                                                         function check(){
                                                            setTimeout(function(){
                                                            $('.credit_in_mount .credit_four').empty();
                                                            var new_price = $('.p_sp span').html().replace(" ", "");
                                                            var four = parseInt(new_price) / 4;
                                                            var tw_four = parseInt(new_price) / 24;
                                                            $('.credit_in_mount .credit_four').html(Math.round(four));
                                                            $('.credit_in_mount .credit_tw_four').html(Math.round(tw_four));
                                                            },500);
                                                        };
                                                </script>
                                          <?php } ?>
                                        </p>
                                    </div>
                        </div>  
                        <div class="form-group qu">
                            <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
                            <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
                            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                            <br />
                        </div>
                        <div class="col-sm-12 label-block">
                            <div class="col-sm-12 bank" style="padding: 0;">
                                <div class="row">
                                    <div id="gift" class="col-sm-2 col-xs-3">
                                        <img src="/image/catalog/wayforpay.png" style="width: auto; z-index: 1; position: relative;" alt="WayForpay">
                                        <div class="text">
                                            <b>Платежная система WayForPay</b>
                                                <p>Оплата Visa/MasterCard через систему WayForPay</p>
                                        </div>
                                    </div>
                                <div id="mono" class="col-sm-2 col-xs-3">
                                    <img  src="/image/catalog/mono.png" style="width: auto; z-index: 1; position: relative;" alt="монобанк">
                                    <div class="text">
                                        <b>ПОКУПКА ЧАСТЯМИ ОТ MONOBANK</b>
                                        <p>"Покупка частями" - это простой способ приобрести желаемый товар разделив оплату на 4, 6 и 10 платежей, без комиссии и дополнительных платежей</p>
                                     </div>
                                </div>
                                <!--  <div id="privat" class="col-sm-2 col-xs-3">
                                    <img src="/image/catalog/privat.jpeg" style="width: auto; height: 36px; z-index: 1; position: relative;" alt="приват">
                                    <div class="text">
                                        <b>ОПЛАТА ЧАСТЯМИ ОТ ПРИВАТБАНКА НА 10 ПЛАТЕЖЕЙ</b>
                                        <p>1. Наличие кредитной карты ПриватБанка с активированной услугой "Оплата Частями"</p>
                                        <p>2. Доступный кредитный лимит, превышающий сумму покупки</p>
                                        <p>Первый платёж будет списан с кредитной карты. Первый платёж + 9 последующих = 10 платежей.</p>
                                    </div>
                                </div> -->
                                <div id="rasrochka" class="col-sm-2 col-xs-3">
                                    <img src="/image/catalog/rasrochka.png"  style="width: auto; z-index: 1; position: relative;" alt="рассрочка">
                                     <div class="text">
                                        <b>Беспроцентная рассрочка</b>
                                        <p>Беспроцентная рассрочка до 4 месяцев</p>
                                        <p>Кредит до 24 месяцев - 2% в месяц</p>
                                        <!-- <p><a href="#">Детальнее >>></a></p> -->
                                    </div>
                                </div>
                                <div id="mastercard" class="col-sm-3 col-xs-3">
                                    <img src="/image/catalog/mastercard_logo.png.png" style="width: auto; z-index: 1; position: relative; right: -7px;" alt="оплата картой">
                                    <div class="text">
                                        <b>Доступна оплата картами Visa/Mastercard</b>
                                        <p>Все операции проходят через систему WayForPay</p>
                                        <p>1. Оплата в один клик</p>
                                        <p>2. Регулярные платежи</p>
                                     </div>
                                </div>
                                <div id="novaya" class="col-sm-2 col-xs-3"> 
                                    <img src="/image/catalog/novaya.png"  style="width: auto; z-index: 1; position: relative;" alt="рассрочка">
                                    <div class="text">
                                        <b>Доступна доставка перевозчиком Новая Почта</b>
                                        <p>1. Доставка в отделение вашего города</p>
                                        <p>2. Адресная доставка</p>
                                        <p>3. Доствка курьером</p>
                                    </div>
                                </div>
                                    <!-- <div id="novaya" class="col-sm-2 col-xs-3"> 
                                        <img src="/image/catalog/new_year.png"  style="width: auto; height: 40px; z-index: 1; position: relative;" alt="рассрочка">
                                        <div class="text">
                                            <b>Еще больше скидок и акций от магазина iHeaven</b>
                                         </div>
                                    </div> -->
                                    </div>
                                </div>
                        </div>
                    </div>
                    <div class="att col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-sm-6">
                                 <?php if ($attribute_groups) { ?>
                                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                                        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                            <?php if(in_array($attribute['attribute_id'], array(176,168,171,164))) { ?>

                                              <?php if($attribute['name'] == 'Размер экрана') {?>
                                                <div class="atr atribute-display col-sm-6 col-xs-6">
                                                  <p style="font-weight: bold; color: #1e3048; font-size: 14px;"><?php echo $attribute['name']; ?>:</p>
                                                  <p style="font-size: 12px; color: #666666;"><?php echo $attribute['text']; ?></p>
                                                </div>
                                              <?php }?>

                                              <?php if($attribute['name'] == 'Объем встроенной памяти') {?>
                                                <div class="atr atribute-memory col-sm-6 col-xs-6">
                                                  <p style="font-weight: bold; color: #1e3048; font-size: 14px;">Обьем памяти:</p>
                                                  <p style="font-size: 12px; color: #666666;"><?php echo $attribute['text']; ?></p>
                                                </div>
                                              <?php }?>

                                              <?php if($attribute['name'] == 'Процессор') {?>
                                                <div class="atr atribute-cp col-sm-6 col-xs-6">
                                                  <p style="font-weight: bold; color: #1e3048; font-size: 14px;"><?php echo $attribute['name']; ?>:</p>
                                                  <p style="font-size: 12px; color: #666666;"><?php echo $attribute['text']; ?></p>
                                                </div>
                                              <?php }?>

                                              <?php if($attribute['name'] == 'Основная камера, Мп') {?>
                                                <div class="atr atribute-camera col-sm-6 col-xs-6">
                                                  <p style="font-weight: bold; color: #1e3048; font-size: 14px;"><?php echo $attribute['name']; ?>:</p>
                                                  <p style="font-size: 12px; color: #666666;"><?php echo $attribute['text']; ?></p>
                                                </div>
                                              <?php }?>
                                          
                                           <?php } ?>
                                      <?php } ?>
                                    <?php } ?>
                                  <?php } ?>
                            </div>
                         
                          <div class="col-sm-6">
                              <ul class="list-unstyled art">
                                <li><span>КОД ТОВАРА: &#8194;</span> <?php echo $model; ?></li>
                                <?php if ($manufacturer) { ?>
                                <li><span>ПРОИЗВОДИТЕЛЬ: &#8194;</span><a href="<?php echo $manufacturers; ?>"> <?php echo $manufacturer; ?></a></li>
                                <?php } ?>
                                <li><span>МОДЕЛЬ:&#8194;</span>
                                        <?php if ($attribute_groups) { ?>
                                            <?php foreach ($attribute_groups as $attribute_group) { ?>
                                                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                                    <?php if(in_array($attribute['attribute_id'], array(191))) { ?>
                                                     <?php if($attribute['name'] == 'Модель') {?>
                                                        <?php echo $attribute['text']; ?>
                                                    <?php }?>
                                                    <?php } ?>
                                                <?php } ?>
                                             <?php } ?>
                                      <?php } ?>
                                </li>
                                <li><span>Гарантия:</span>
                                        <?php foreach ($attribute_groups as $attribute_group) { ?>
                                            <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                                <?php if(in_array($attribute['attribute_id'], array(192))) { ?>
                                                    <?php if($attribute['name'] == 'Гарантия') {?>
                                                        <?php echo $attribute['text']; ?>
                                                    <?php }?>
                                                <?php } ?>
                                            <?php } ?>
                                        <?php } ?>
                                </li>
                                <li><?php if($stock == "Есть в наличии") {?>
                                    <strong style="color: #6dbf3e"><?php echo $stock; ?></strong>
                                <?php } else {?>
                                    <strong style="color: red"><?php echo $stock; ?></strong>
                                    <?php } ?>
                                </li>
                            </ul>
                          </div>
                        </div>
                    </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="row">
                <div class="col-sm-12 col-xs-12" id="product">
                  <div class="row">
                    <div class="col-sm-12 col-xs-12 product-info-block">
                        <p class="dell_right"><strong>ДОСТАВКА</strong></p>
                        <hr class="dlr-hr" style="background: #1e2e46">
                        <div class="delivery">
                            <p class="one">
                                <b>Самовывоз из iHeaven</b><br>
                                <small>бесплатно | сегодня</small>
                            </p>

                            <p class="two">
                                <b>Экспресс-доставка</b><br>
                                <small>Нашим курьером по Киеву</small>
                            </p>
                            <p class="three">
                                <b>Самовывоз из "Нова пошта"</b><br>
                                <small>Из отделения Вашего города</small>
                            </p>
                            <p class="four">
                                <b>Курьером "Нова пошта"</b><br>
                                <small>Адресная доставка 50 грн</small>
                            </p>
                        </div>
                        
                        <p class="dell_right"><strong>ОПЛАТА</strong></p>
                        <hr class="dlr-hr" style="background: #6dbf3e">
                        <div class="pay">
                            <p class="one">
                                <b>Наличными, Безналичными</b><br>
                                <small>VISA/Mastercard/WayForPay</small>
                            </p>
                        </div>
                        
                        <p class="dell_right"><strong>Обмен/возврат</strong></p>
                        <hr class="dlr-hr" style="background: #3d72bb">
                        <div class="wtt">
                           
                            <p class="one"><b>В течение 14 дней</b><br>
                                <small>Обмен и возврат товара осуществляется в течение 14 дней после покупки, согласно закону Украины "О защите прав потребителей Украины"</small>
                            </p>
                        </div>
                    </div>
                    </div>
                  </div>
                </div>
            </div>
        </div>
        <div class="op-carousel col-sm-12 col-xs-12"> 
            <?php if ($options) { ?>
                    <?php foreach ($options as $option) { ?>
                      <?php if ($option == []) { ?>
                        <p>товара нет</p>
                      <?php } ?>
                    <?php if ($option['type'] == 'radio') { ?>
                        <label class="control-label" id="op_label">Вместе дешевле</label>
                            <!-- УДАЛЕНИЕ ОПЦИИ и ДАННЫЕХ ВОЗЛЕ ЦЕНЫ-->
                        <script>
                            function delit(){
                                $('.button-refresh').css({"display" : "inline-block"});
                                $('.button-cpl').css({"display" : "inline-block"});
                            }
                        </script>
                        <div class="owl-carousel" id="option-carousel">
                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                              <div class="item">
                                <div class="radio">
                                  <label>
                                    <input class="option-input" onclick="check(); delit();" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />

                                    <div class="option-wrapper">
                                        <div class="row">
                                            <?php  $nac = str_replace(" ","",$option_value['price']) / 8; $summ = str_replace(" ","",$option_value['price']) + $nac;?>
                                            <div class="col-sm-1"></div>
                                            <div class="col-sm-2 col-xs-5">
                                                <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                                <p class="op_name" style="margin-top: 10px"><?php echo $heading_title; ?></p>
                                            </div>
                                            <div class="col-sm-1 col-xs-2 option-plus"><p>+</p></div>
                                            <div class="col-sm-2 col-xs-5">
                                              <?php if ($option_value['image']) { ?>
                                                <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                                                 <b class="op_price" style="margin-top: 10px">
                                                    <?php if ($option_value['price']) { ?>
                                                        <span class="op_old_price" style="color: #a3a3a3; text-decoration: line-through;">
                                                            <?php echo round($summ); ?> грн
                                                        </span>
                                                        <span class="space">&#8194;|&#8194;</span>
                                                        <span class="mob-space"> | </span>
                                                        <span class="op_new_price" style= "color: #ee2325"><?php echo $option_value['price']; ?></span>
                                                     <?php } ?>  
                                                </b>
                                              <?php } ?>
                                               <p class="op_name"><?php echo $option_value['name']; ?></p>
                                            </div>
                                            <div class="col-sm-1 col-xs-12 option-plus o_r"><p>=</p></div>
                                            <div class="col-sm-4 col-xs-12 option-summ">
                                                <div class="opt-summ">
                                                    <b style="color: black; padding-top: 10px;">Скидка на <?php echo $option_value['name']; ?>
                                                    <div class="procent_option">
                                                        <div class="informer"><span class="t_p">
                                                          <?php 
                                                            $option_pr = $summ / 100;
                                                            $eco = $summ - str_replace(" ","",$option_value['price']); 
                                                            $option_summ = $eco / $option_pr;
                                                          ?>
                                                          -<?php echo round($option_summ); ?> %
                                                        </span>&#8194;Ваша скидка - <?php echo round($eco); ?>&#8194;грн
                                                        </div>
                                                    </div>
                                                    </b>
                                                    <p class="op_old_price" style="color: #ee2325; text-decoration: line-through; font-size: 14px; padding: 5px 0;"><?php echo round($summ); ?> грн</p>
                                                    <b class="option_minus" style="color: #232323"><span><?php echo $option_value['price'];?></span></b>
                                                </div>
                                              <div class="option-button">ВЫБРАТЬ</div>
                                            </div>
                                            <div class="col-sm-1"></div>
                                        </div>
                                      <!-- <div class="op-price">
                                        <?php if ($price) { ?>
                                          <?php if (!$special) { ?>
                                          <p style="text-decoration: line-through"><?php echo $price; ?></p>
                                          <?php } else { ?>
                                          <h2 style="text-decoration: line-through"><?php echo $special; ?></h2>
                                          <?php } ?>
                                        <?php } ?>
                                      </div> -->
                                      
                                      <!-- <?php if ($option_value['price']) { ?>
                                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                      <?php } ?> -->
                                    </div>
                                  </label>
                                </div>
                              </div>
                            <?php } ?>
                        </div>    
                      <?php } ?>
                    <?php } ?>
                <?php } ?>
        </div>
        <div class="col-xs-12 product-info-block" id="mobile-info">
                        <p class="dell_right"><strong>ДОСТАВКА</strong></p>
                        <hr class="dlr-hr" style="background: #1e2e46">
                        <div class="delivery">
                            <p class="one">
                                <b>Самовывоз из iHeaven</b><br>
                                <small>бесплатно | сегодня</small>
                            </p>

                            <p class="two">
                                <b>Экспресс-доставка</b><br>
                                <small>Нашим курьером по Киеву</small>
                            </p>
                            <p class="three">
                                <b>Самовывоз из "Нова пошта"</b><br>
                                <small>Из отделения Вашего города</small>
                            </p>
                            <p class="four">
                                <b>Курьером "Нова пошта"</b><br>
                                <small>Адресная доставка 50 грн</small>
                            </p>
                        </div>
                        
                        <p class="dell_right"><strong>ОПЛАТА</strong></p>
                        <hr class="dlr-hr" style="background: #6dbf3e">
                        <div class="pay">
                            <p class="one">
                                <b>Наличными, Безналичными</b><br>
                                <small>VISA/Mastercard/WayForPay</small>
                            </p>
                        </div>
                        
                        <p class="dell_right"><strong>Обмен/возврат</strong></p>
                        <hr class="dlr-hr" style="background: #3d72bb">
                        <div class="wtt">
                           
                            <p class="one"><b>В течение 14 дней</b><br>
                                <small>Обмен и возврат товара осуществляется в течение 14 дней после покупки, согласно закону Украины "О защите прав потребителей Украины"</small>
                            </p>
                        </div>
                    </div>
        <div class="col-sm-12" style="padding: 0;">
            <!--  -->
           <!--  <ul class="nav nav-tabs product-tabs">
              <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
              <?php if ($attribute_groups) { ?>
              <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
              <?php } ?>
              <?php if ($review_status) { ?>
              <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
              <?php } ?>
            </ul> -->
            <!--  -->
            <div class="tab-content col-xs-12" style="padding: 0">
              <?php if ($attribute_groups) { ?>
              <div class="" id="tab-specification">
                <p>Технические характеристики</p>
                <div class="atr-wrapper">
                  <?php foreach ($attribute_groups as $attribute_group) { ?>
                          <div class="row atr-block">
                                <div class="col-sm-12 group-name" style="padding-left: 0;"><strong><?php echo $attribute_group['name']; ?></strong></div>
                              <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                <div class="col-sm-12 col-xs-12">
                                    <div class="attribute-row">
                                        <div class="row">
                                            <div class="col-sm-6 col-xs-6 dotted"><p style="color: rgba(0,0,0,.54); background: white; position: relative; top: 2px;"><?php echo $attribute['name']; ?></p></div>
                                            <div class="col-sm-6 col-xs-6"><p style="color: rgba(0,0,0,.87);"><?php echo $attribute['text']; ?></p></div>
                                        </div>
                                    </div>
                                </div>
                              <?php } ?>
                          </div>
                      
                  <?php } ?>
                  </div>
              
              </div>
              <?php } ?>
              <?php if ($review_status) { ?>
              <div class="" id="tab-review">
                <p class="rev">Отзывы покупателей</p>
                <form class="form-horizontal" id="form-review">
                  <div id="review"></div>
                  <p class="h4"><?php echo $text_write; ?></p>
                  <?php if ($review_guest) { ?>
                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                      <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                    </div>
                  </div>
                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                      <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                      <div class="help-block"><?php echo $text_note; ?></div>
                    </div>
                  </div>
                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label"><?php echo $entry_rating; ?></label>
                      &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                      <input type="radio" name="rating" value="1" />
                      &nbsp;
                      <input type="radio" name="rating" value="2" />
                      &nbsp;
                      <input type="radio" name="rating" value="3" />
                      &nbsp;
                      <input type="radio" name="rating" value="4" />
                      &nbsp;
                      <input type="radio" name="rating" value="5" />
                      &nbsp;<?php echo $entry_good; ?></div>
                  </div>
                  <?php echo $captcha; ?>
                  <div class="buttons clearfix">
                    <div class="pull-right">
                      <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary">ОСТАВИТЬ ОТЗЫВ</button>
                    </div>
                  </div>
                  <?php } else { ?>
                  <?php echo $text_login; ?>
                  <?php } ?>
                </form>
              </div>
              <?php } ?>
                <div class="" id="tab-description">
                    <div class="d"><?php echo $description; ?></div>
                    <!-- <p id="d-open">ПОДРОБНЕЙ ▼</p> -->
                </div>
              
            </div>
        </div>
 
      </div>
      <?php if ($products) { ?>
      <h3><?php echo $text_related; ?></h3>
      <div class="row">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-xs-8 col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-xs-6 col-md-4'; ?>
        <?php } else { ?>
        <?php $class = 'col-xs-6 col-sm-3'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p><?php echo $product['description']; ?></p>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($j = 1; $j <= 5; $j++) { ?>
                <?php if ($product['rating'] < $j) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['price']) { ?>
              <p class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
            <div class="button-group">
              <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <?php if (($column_left && $column_right) && (($i+1) % 2 == 0)) { ?>
        <div class="clearfix visible-md visible-sm"></div>
        <?php } elseif (($column_left || $column_right) && (($i+1) % 3 == 0)) { ?>
        <div class="clearfix visible-md"></div>
        <?php } elseif (($i+1) % 4 == 0) { ?>
        <div class="clearfix visible-md"></div>
        <?php } ?>
        <?php $i++; ?>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
    <div class="col-xs-12">
          <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
    </div>
    </div>
</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
  $.ajax({
    url: 'index.php?route=product/product/getRecurringDescription',
    type: 'post',
    data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
    dataType: 'json',
    beforeSend: function() {
      $('#recurring-description').html('');
    },
    success: function(json) {
      $('.alert, .text-danger').remove();

      if (json['success']) {
        $('#recurring-description').html(json['success']);
      }
    }
  });
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-cart').button('loading');
    },
    complete: function() {
      $('#button-cart').button('reset');
    },
    success: function(json) {
      $('.alert, .text-danger').remove();
      $('.form-group').removeClass('has-error');

      if (json['error']) {
        if (json['error']['option']) {
          for (i in json['error']['option']) {
            var element = $('#input-option' + i.replace('_', '-'));

            if (element.parent().hasClass('input-group')) {
              element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            } else {
              element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            }
          }
        }

        if (json['error']['recurring']) {
          $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
        }

        // Highlight any found errors
        $('.text-danger').parent().addClass('has-error');
      }

      if (json['success']) {
        $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

        $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

        $('html, body').animate({ scrollTop: 0 }, 'slow');

        $('#cart > ul').load('index.php?route=common/cart/info ul li');
      }
    },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
  });
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
  pickTime: false
});

$('.datetime').datetimepicker({
  pickDate: true,
  pickTime: true
});

$('.time').datetimepicker({
  pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
  var node = this;

  $('#form-upload').remove();

  $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

  $('#form-upload input[name=\'file\']').trigger('click');

  if (typeof timer != 'undefined') {
      clearInterval(timer);
  }

  timer = setInterval(function() {
    if ($('#form-upload input[name=\'file\']').val() != '') {
      clearInterval(timer);

      $.ajax({
        url: 'index.php?route=tool/upload',
        type: 'post',
        dataType: 'json',
        data: new FormData($('#form-upload')[0]),
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function() {
          $(node).button('loading');
        },
        complete: function() {
          $(node).button('reset');
        },
        success: function(json) {
          $('.text-danger').remove();

          if (json['error']) {
            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
          }

          if (json['success']) {
            alert(json['success']);

            $(node).parent().find('input').val(json['code']);
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    }
  }, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
  $.ajax({
    url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
    type: 'post',
    dataType: 'json',
    data: $("#form-review").serialize(),
    beforeSend: function() {
      $('#button-review').button('loading');
    },
    complete: function() {
      $('#button-review').button('reset');
    },
    success: function(json) {
      $('.alert-success, .alert-danger').remove();

      if (json['error']) {
        $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
      }

      if (json['success']) {
        $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

        $('input[name=\'name\']').val('');
        $('textarea[name=\'text\']').val('');
        $('input[name=\'rating\']:checked').prop('checked', false);
      }
    }
  });
    grecaptcha.reset();
});

$(document).ready(function() {
  $('.thumbnails').magnificPopup({
    type:'image',
    delegate: 'a',
    gallery: {
      enabled:true
    }
  });
});

$(document).ready(function() {

    $('#d-open').click(function() {
        $('#tab-description .d').css({"height" : "auto"});
        $('#d-open').css({"display" : "none"});
    })
})

$(document).ready(function() {
  var hash = window.location.hash;
  if (hash) {
    var hashpart = hash.split('#');
    var  vals = hashpart[1].split('-');
    for (i=0; i<vals.length; i++) {
      $('#product').find('select option[value="'+vals[i]+'"]').attr('selected', true).trigger('select');
      $('#product').find('input[type="radio"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
      $('#product').find('input[type="checkbox"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
    }
  }
})
//--></script>
<?php echo $footer; ?>

