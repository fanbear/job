var $getCart = $.parseJSON($.ajax({
    url: 'index.php?route=extension/module/pdqo/get_cart',
    async: false
}).responseText);
$(document).ready(function() {
    $productTable = '<thead><tr><th></th><th>{t_product_title}</th><th align="center">{t_product_qty}</th><th align="center">{t_product_price}</th><th align="center">{t_product_cost}</th><th></th></tr></thead><tbody>';
        for(product in $getCart['products']) {
            var arr = new Array();
            var maximum;
            p = $getCart['products'][product];
            $productTable += '<tr data-pdqo-pkey="'+p.cart_id+'">';
            $productTable += '<td align="center"><img src="image/'+p.image+'" alt="'+p.name+'" style="width: 30px; height: auto;"></td>';
            $productTable += '<td>';
            $productTable += p.name;
                for(var option in p.option) {
                    if(p.option[option].quantity) {
                        arr[option] = p.option[option].quantity;
                    }else{
                        maximum = p.maximum;
                    }
                    if(p.option[option].type !== 'file')
                    $productTable += '<br/>- <small>' + p.option[option].name + ' ' + p.option[option].value + '</small>';
                }
                if(Math.min.apply(0, arr) == 'Infinity') {
                    maximum = p.maximum;
                }else{
                    maximum = Math.min.apply(0, arr);
                }

                $productTable += '</td>';
                if(p.quantity > p.minimum) {
                    quantity = p.quantity;   
                }else{
                    quantity = p.minimum;
                }
            $productTable += '<td align="center"><input type="number" onkeyup="pdqoUpdateCart(this, '+p.minimum+', '+maximum+');" class="pdqo-products-quantity" value="'+quantity+'" /></td>';
            $productTable += '<td align="center">'+p.price+'</td>';
            $productTable += '<td align="center" class="pdqo-products-cost">'+p.total+'</td>';
            $productTable += '<td align="center"><img class="pdqo-products-remove" onclick="pdqoRemove(this)" src="catalog/view/image/pdqo/rm.png" title="{t_remove} '+p.name+' {t_from_cart}" alt="{t_remove} '+p.name+' {t_from_cart}" width="16" height="16" /></td>';
            $productTable += '</tr>';
        }
    $productTable += '</tbody>';
    $productTable += '<tbody class="pdqo-products-totals"></tbody>';
    $('.pdqo-products').html($productTable);
    $('[name*="pdqo-p-field"]').mask('{field_phone_mask}');
    pdqoCartTotals($getCart);
});
$('.pdqo-cancel').bind('click', function() {
    $.magnificPopup.close();
});
$('.pdqo-confirm').bind('click', function() {
    var $pdqoFields = $('.pdqo-field');
    var $serializeFields = $pdqoFields.serializeArray();
    var $pdqoNameField = $('[name*="pdqo-n-field"]');
    var $pdqoPhoneField = $('[name*="pdqo-p-field"]');
    var $pdqoEmailField = $('[name*="pdqo-e-field"]');
    var $pdqoCommentField = $('[name*="pdqo-c-field"]');
    var successProp = {
        borderColor: '#46C52F',
        backgroundColor: '#BBECB2'
    };
    var errorProp = {
        borderColor: '#F52A2A',
        backgroundColor: '#FFA3A3'
    };
    var error = 0;
    var customerData = new Object();
    if({field_name_status}) {
        if(($pdqoNameField.val().length < 2) && {field_name_required}) {
            $pdqoNameField.css(errorProp);
            setTimeout(function() {
                $pdqoNameField.removeAttr("style");
            }, 700);
            error = 1;
        }else{
            $pdqoNameField.css(successProp);
            customerData['name'] = $pdqoNameField.val();
        }
    }
    if({field_phone_status}) {
        if(($pdqoPhoneField.val().length < 5) && {field_phone_required}) {
            $pdqoPhoneField.css(errorProp);
            setTimeout(function() {
                $pdqoPhoneField.removeAttr("style");
            }, 700);
            error = 1;
        }else{
            $pdqoPhoneField.css(successProp);
            customerData['phone'] = $pdqoPhoneField.val();
        }
    }
    if({field_email_status}) {
        if(($pdqoEmailField.val().length < 6) && {field_email_required}) {
            $pdqoEmailField.css(errorProp);
            setTimeout(function() {
                $pdqoEmailField.removeAttr("style");
            }, 700);
            error = 1;
        }else{
            $pdqoEmailField.css(successProp);
            customerData['email'] = $pdqoEmailField.val();
        }
    }
    if({field_comment_status}) {
        if(($pdqoCommentField.val().length < 2) && {field_comment_required}) {
            $pdqoCommentField.css(errorProp);
            setTimeout(function() {
                $pdqoCommentField.removeAttr("style");
            }, 700);
            error = 1;
        }else{
            $pdqoCommentField.css(successProp);
            customerData['comment'] = $pdqoCommentField.val();
        }
    }
    if(!error && $getCart['products'].length && Object.keys(customerData)) {
        $.ajax({
            url: 'index.php?route=extension/module/pdqo/order',
            type: 'post',
            dataType: 'json',
            data: {customer: customerData},
            beforeSend: function() {
               $('.pdqo-wrapper').html('<div class="pdqo-preloader" style="padding: 10px;" align="center"><img width="" src="catalog/view/image/pdqo/loader.gif"></div>');
            },
            success: function(json) {
                $pdqoCompleteOrder  = '<div class="pdqo-complete-order">';
                $pdqoCompleteOrder += '<div class="pdqo-section pdqo-group">';
                $pdqoCompleteOrder += '<div class="pdqo-col pdqo-span-12-of-12">';
                $pdqoCompleteOrder += '<div class="pdqo-complete-order-header">{t_order_num}'+json.order_id+' {t_successful_sended}</div>';
                $pdqoCompleteOrder += '<div class="pdqo-complete-order-content"><div class="pdqo-col pdqo-span-1-of-12">&nbsp;</div><div class="pdqo-col pdqo-span-10-of-12">';
                $pdqoCompleteOrder += '<b>' + $pdqoNameField.val() + '</b>, {t_thanks_for_order}';
                $pdqoCompleteOrder += '</div><div class="pdqo-col pdqo-span-1-of-12">&nbsp;</div></div>';
                $pdqoCompleteOrder += '</div>';
                $pdqoCompleteOrder += '</div>';
                $pdqoCompleteOrder += '</div>';
                $('.pdqo-wrapper').empty();
                $('.pdqo-wrapper').html($pdqoCompleteOrder);
                $('#cart-total').html(0);
                $('#cart > ul').load('index.php?route=common/cart/info ul li');
            },
            error: function(json) {
                console.log(json);
            }
        });
    }
});
(function(){
    var headerText = [],
    table = document.querySelector(".pdqo-products"),
    tableHeaders = table.querySelectorAll("thead>tr>th"),
    tableRows = table.querySelectorAll("tbody>tr");

    for(var i = 0; i < tableHeaders.length; i++) {
        var current = tableHeaders[i];
        headerText.push(current.textContent.replace(/\r?\n|\r/,""));
    } 
    for (var i = 0, row; row = tableRows[i]; i++) {
        for (var j = 0, col; col = row.cells[j]; j++) {
            col.setAttribute("data-th", headerText[j]);
        } 
    }
});