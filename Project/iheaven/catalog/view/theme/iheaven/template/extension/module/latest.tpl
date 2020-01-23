<div class="container">
  <div class="row">
    <div class="row latest">
      <div class="tabs-head">
          <p>НОВИНКИ</p>
          <p><hr class=tab-line></p>
      </div>
    </div>
    <div class="row" id="tab-latest-0">
      <?php foreach ($products as $product) { ?>
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 pr-t">
            <div class="product-thumb">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-3 col-xs-3">
                                  <div id="gift">
                                      <img src="image/catalog/wayforpay.png" style="width: auto; height: 40px; z-index: 1; position: relative;" alt="Подарок">
                                      <!-- <div class="text">
                                          <b>Платежная система WayForPay</b>
                                          <p>Оплата Visa/MasterCard через систему WayForPay</p>
                                      </div> -->
                                  </div>
                                  <div id="mono">
                                      <img  src="/image/catalog/mono.png" style="width: auto; height: 38px; z-index: 1; position: relative;" alt="монобанк">
                                      <div class="text">
                                        <b>ПОКУПКА ЧАСТЯМИ ОТ MONOBANK</b>
                                        <p>"Покупка частями" - это простой способ приобрести желаемый товар разделив оплату на 4, 6 и 10 платежей, без комиссии и дополнительных платежей</p>
                                      </div>
                                  </div>
                                 <!--  <div id="privat">
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
                                        <b>КРЕДИТ БЕЗ ПЕРЕПЛАТ НА 25 ПЛАТЕЖЕЙ</b>
                                        <p>Первоначальный взнос + 24 платежа = 25 платежей.</p>
                                        <p><a href="#">Детальнее >>></a></p>
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
                                  <div id="novaya"> 
                                       <img class="wow swing" data-wow-duration = "2s" data-wow-offset="100" data-wow-iteration = "1" src="/image/catalog/new_yaer.png" style=" width: auto; height: 42px; z-index: 1; position: absolute;" alt="Подарок">
                                      <div class="text">
                                          <b>Еще больше скидок и акций от магазина iHeaven</b>
                                          <p>От 2% до 20% на весь ассортимент товаров</p>
                                      </div>
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
                          <span>Цена:</span>
                          &#8194;<?php echo $product['price']; ?>
                        </p>
                        <?php } else { ?>
                        <p class="price-old">
                            <?php $old_price = str_replace(" ","", $product['price']); $new_price = str_replace(" ","", $product['special']);$rass = $old_price - $new_price;$dellim = $old_price / 100;$procent = $rass / $dellim;?>
                            <span class="skd" style="color: black; text-decoration: line-through"><?php echo $product['price']; ?> </span>
                            <span class="procent">
                                <span class="informer">
                                    <span class="t_p">- <?php echo ceil($procent); ?> % </span>
                                </span>
                            </span>
                        </p>
                        <p class="price-new"><span>Цена: </span> &#8195;<span class="special_price"><?php echo $product['special']; ?> </span></p>  
                        <?php } ?>
                        <!-- <?php if ($product['tax']) { ?>
                          <p class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></p>
                        <?php } ?> -->
                      <?php } ?>
                </div>
                <div class="mt-1"></div>
                <div class="col-sm-6 col-xs-6" style="padding: 0;"><div class="desk-button"><a data-toggle="tooltip" data-original-title="Перейти на страницу товара" href="<?php echo $product['href']; ?>">Подробней</a></div></div>
                <div class="col-sm-6 col-xs-6" style="padding: 0;"><p class="button-cart" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">Купить</p></div>
            </div>
      </div>
      <?php } ?>
    </div>
  </div>
</div>

