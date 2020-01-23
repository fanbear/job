<h3><?php echo $heading_title; ?></h3>
<div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-3 col-xs-3">
                          <p><img src="/image/catalog/gift-1.png" style="width: auto; height: 40px; z-index: 1; position: relative; margin-bottom: 10px;" alt="Подарок"></p>
                          <p>
                            <img src="/image/catalog/mono.png" style="width: auto; height: 38px; z-index: 1; position: relative; margin-bottom: 10px;" alt="монобанк">
                            <img src="/image/catalog/privat.jpeg" style="width: auto; height: 32px; z-index: 1; position: relative; margin-bottom: 10px;" alt="приват">
                            <img src="/image/catalog/mastercard.png" style="width: auto; height: 38px; z-index: 1; position: relative; margin-bottom: 10px;" alt="оплата картой">
                            <img src="/image/catalog/rasrochka.png"  style="width: auto; height: 38px; z-index: 1; position: relative; margin-bottom: 10px;" alt="рассрочка">
                            <img src="/image/catalog/novaya.png"  style="width: auto; height: 38px; z-index: 1; position: relative; margin-bottom: 10px;" alt="рассрочка">
                          </p>
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
                          <?php echo $product['price']; ?>
                        </p>
                        <?php } else { ?>
                        <p class="price-old"><?php echo $product['price']; ?></p>
                        <p class="price-new"><?php echo $product['special']; ?></p> 
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
                <!-- <div class="atr-hover">
                    <ul>
                        <?php if($product['attribute_groups']) { ?>
                            <?php foreach($product['attribute_groups'] as $attribute_group) { ?>
                                <?php foreach($attribute_group['attribute'] as $attribute) { ?>
                                    <?php if(in_array($attribute['attribute_id'], array(123,19,29,77,76))) { ?>
                                        <li><b><?php echo $attribute['name']; ?>:</b> <?php echo $attribute['text']; ?></li>
                                    <?php }?>
                              <?php } ?>
                            <?php } ?>
                        <?php } ?>
                    </ul>
                </div> -->
          </div>
  </div>
  <?php } ?>
</div>
