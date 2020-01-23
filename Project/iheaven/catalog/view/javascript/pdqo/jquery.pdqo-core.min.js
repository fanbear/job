function pdqoObject(e) {
    
    var $productID = $(e).data('pdqo-item');
    var $options = $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea');
    
    var $pdqo = $.ajax({
        url: 'index.php?route=extension/module/pdqo/pdqo',
        type: 'post',
        data: {option: $options.serializeArray(), product_id: $productID},
        dataType: 'json',
        async: false
    });
    
    $pdqoStatus = $pdqo.status;
    $pdqo = $.parseJSON($pdqo.responseText);
    
    if($pdqoStatus !== 200) {
        return false;
    }
    if($pdqo['settings'] !== false && $pdqo['settings']['general']['module_status'] === '1') {
        if($pdqo.option.length > 0 && !$options.length) {
            window.location.href = $pdqo.product.href.replace(/&amp;/g, '&');
            return false;
        }
        if ($pdqo.error) {
            $('.text-danger').parent().addClass('has-error');
            if ($pdqo.error.option) {
                for (i in $pdqo.error.option) {
                    var element = $('#input-option' + i.replace('_', '-'));

                    if (element.parent().hasClass('input-group')) {
                        element.parent().after('<div class="text-danger">' + $pdqo.error.option[i] + '</div>');
                    } else {
                        element.after('<div class="text-danger">' + $pdqo.error.option[i] + '</div>');
                    }
                }
            }

            if ($pdqo.error['recurring']) {
                $('select[name=\'recurring_id\']').after('<div class="text-danger">' + $pdqo.error['recurring'] + '</div>');
            }

            return false;
        }else{
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');
        }
        
        var productData = new Object();
        
        if(!$options.length) {
            productData = {
                product_id: $productID,
                quantity: $pdqo.product.minimum,
            };
        }else{
            productData = $options;
        }
        
        var cartFlag = false;
        
        var $addToCart = $.parseJSON($.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: productData,
            dataType: 'json',
            async: false
        }).responseText);
        
        if($addToCart['success']) {
            $('#cart-total').html($addToCart['total']);
            cartFlag = true;
        }
        
        if(cartFlag) {
            $.magnificPopup.open({
                items: {
                    src: '/index.php?route=extension/module/pdqo/index'
                },
                type: 'ajax',
                preloader: false,
                fixedBgPos: false,
                midClick: true,
                closeMarkup: '<img title="%title%" src="catalog/view/image/pdqo/cross.png" class="mfp-close">',
                callbacks: {
                    beforeOpen: function() {
                        var $settings = $pdqo.settings;
                        $pdqo = null;
                        if($settings.window.animation.duration_out) {
                            this.st.removalDelay = $settings.window.animation.duration_out; 
                        }
                        setTimeout(function() {
                            if($settings.overlay.opacity.status === '1') {
                                $('.mfp-bg').css('opacity', $settings.overlay.opacity.deep);
                                $('.mfp-bg').css('background-color', $settings.overlay.color);
                            }else{
                                $('.mfp-bg').css('opacity', 0);
                            }
                        }, 0);

                        if($settings.overlay.blur.status === '1') {
                            var $blur = {
                                '-webkit-filter': 'blur('+$settings.overlay.blur.deep+'px)',
                                '-moz-filter': 'blur('+$settings.overlay.blur.deep+'px)',
                                '-o-filter': 'blur('+$settings.overlay.blur.deep+'px)',
                                '-ms-filter': 'blur('+$settings.overlay.blur.deep+'px)',
                                'filter': 'blur('+$settings.overlay.blur.deep+'px)'
                            };
                            var blurElements = $settings.overlay.blur.element.split(',');
                            for (var i = 0; i <= blurElements.length - 1; i++) {
                                $(blurElements[i]).css($blur);
                            }
                        }
                        if($settings.extra.close_on_bg.status === '1') {
                            this.st.closeOnBgClick = true; 
                        }else{
                            this.st.closeOnBgClick = false;
                        }
                        if($settings.extra.close_on_esc.status === '1') {
                            this.st.enableEscapeKey = true; 
                        }else{
                            this.st.enableEscapeKey = false;
                        }
                        if($settings.extra.close_btn.status === '1') {
                            this.st.showCloseBtn = true; 
                        }else{
                            this.st.showCloseBtn = false;
                        }
                        if($settings.extra.close_btn.inside === '1') {
                            this.st.closeBtnInside = true; 
                        }else{
                            this.st.closeBtnInside = false;
                        }
                        if($settings.extra.align_top.status === '1') {
                            this.st.alignTop = true; 
                        }else{
                            this.st.alignTop = false;
                        }
                        this.st.settings = $settings;
                    },
                    open: function() {
                        if(this.st.settings.window.animation.in !== '0') {
                            $('.mfp-content').addClass('pdqo-animated '+this.st.settings.window.animation.in+'');
                        }
                    },
                    beforeClose: function() {
                        if(this.st.settings.window.animation.out !== '0') {
                            $('.mfp-content').removeClass(this.st.settings.window.animation.in).addClass(this.st.settings.window.animation.out);
                        }
                    },
                    close: function() {
                        var blurElements = this.st.settings.overlay.blur.element.split(',');
                        for (var i = 0; i <= blurElements.length - 1; i++) {
                            $(blurElements[i]).removeAttr('style');
                        }
                        $('.mfp-content').removeClass('pdqo-animated').removeClass(this.st.settings.window.animation.out);
                    }
                }
            });
        }
    }
}

function pdqoUpdateCart(e, min, max) {
    var $productRow = $(e).parent().parent();
    var $productKey = $productRow.data('pdqo-pkey');
    var value = Math.abs(e.value);
    if (value < min || value === NaN) {
        value = min;
    }
    if (value > max) {
        value = max; $(e).val(max);
    }
    $.ajax({
        url: 'index.php?route=extension/module/pdqo/update_cart',
        type: 'post',
        data: {key: $productKey, qty: value},
        dataType: 'json',
        success: function(json) {
            var $getCart = $.parseJSON($.ajax({
                url: 'index.php?route=extension/module/pdqo/get_cart',
                type: 'post',
                data: {key: $productKey},
                async: false
            }).responseText);
            pdqoCartTotals(json);
            $productRow.find('.pdqo-products-cost').text($getCart['products'][0].total);
        }
    });
}
function pdqoRemove(e) {
    var $productRow = $(e).parent().parent();
    var $productKey = $productRow.data('pdqo-pkey');
    $.ajax({
        url: 'index.php?route=extension/module/pdqo/remove_from_cart',
        type: 'post',
        data: {key: $productKey},
        dataType: 'json',
        success: function(json) {
            if(!json.count_products) {
                $.magnificPopup.close();
            }
            $productRow.remove();
            pdqoCartTotals(json);
        }
    });
}
function pdqoCartTotals(data) {
    var $totalsRows;
    for(totals in data['total_data']['totals']) {
        t = data['total_data']['totals'][totals];
        $totalsRows += '<tr>';
        $totalsRows += '<td colspan="3"></td>';
        $totalsRows += '<td class="right">' + t.title + ':</td>';
        $totalsRows += '<td class="right"><b>' + t.text + '</b></td>';
        $totalsRows += '<td></td>';
        $totalsRows += '</tr>';   
    }
    
    $('#cart-total').html(data['total_data']['total']);
    $('#cart > ul').load('index.php?route=common/cart/info ul li');
    $('.pdqo-products-totals').html($totalsRows);
}