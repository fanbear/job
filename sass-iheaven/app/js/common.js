$(document).ready(function(){

 if($("#old-price").length > 0) {
        $('#black img').css({"display" : "block"});  
    }

    function delit(){
        $('.button-refresh').css({"display" : "block"});
    }
// Head-phone additionl open
    $('#addtional-open').click(function (){
        if ($('#addtional-open').hasClass('rotate-180')){
            $('#addtional-open').removeClass('rotate-180');
            $('#phone').removeClass('phone-hover-style')
        }else{
            $('#addtional-open').addClass('rotate-180');
            $('#phone').addClass('phone-hover-style')
        }
        $('.additional').slideToggle(400);
    })
    $('.collapse-value button').click(function (){
        if($(this).text().indexOf('Показать все') == 0) {
            $(this).html("Показать меньше <i class='fa fa-fw'></i>");
        }
        else {
            $(this).html("Показать все <i class='fa fa-fw'></i>");
        }
    })

    $('.login').click(function (){
        $('.login-togle').slideToggle(400);
    })
    $('.phone-open').click(function (){
        $('.open-mob').slideToggle(400);
    })

    $('.arrow').click(function(){
        $(this).siblings('.ocf-option-values').slideToggle(400);
        if($(this).hasClass('rotate')){
            $(this).removeClass('rotate');
        }else {
            $(this).addClass('rotate');
        }
        
    })

    var optionhas = $('#option-carousel').find('div.item'); //поис опций

    // Если опций нету то убираем карусель
    if(optionhas.is('.item')){
    } else {
        $('.op-carousel').css({'display' : 'none'})
    }
    // Если атрибутов нету то убирае блок
    // if(atthas.is('.atr-waterdef')){
    // } else {
    //     $('.att').css({'display' : 'none'})
    // }
    // $('#button-cart').click(function(){
    //     $(this).empty();
    // })
    // Таймер
//---------------OWL-CARUSEL
    $('.img-carousel').owlCarousel({
        items: 3,
        margin:10,
        navigation: true,
        navigationText: ["<img src='myprevimage.png'>","<img src='mynextimage.png'>"],
        responsiveClass:true,
        responsive:{
            0:{
                items: 3,
                nav:true
            },
            600:{
                items: 3,
                nav:true
            },
            1000:{
                items:3,
                nav:true
            }
        }
    })

    $('#option-carousel').owlCarousel({
        items: 1,
        // autoplay:true,
        // autoplayTimeout: 3000,
        // autoplayHoverPause:true,
        nav: true,
        responsiveClass: true,
        responsive:{
            0:{
                items: 1,
                nav:true
            },
            600:{
                items: 1,
                nav:true
            },
            1000:{
                items:1,
                nav: true
            }
        }
    })
    $('#best-carousel').owlCarousel({
        items: 3,
        margin:10,
        navigation: true,
        navigationText: ["<img src='myprevimage.png'>","<img src='mynextimage.png'>"],
        responsiveClass: true,
        responsive:{
            0:{
                items: 1,
                nav:true
            },
            600:{
                items: 2,
                nav:true
            },
            1000:{
                items:3,
                nav: true
            }
        }
    })
    $('#autorec-carousel').owlCarousel({
        items: 4,
        margin:10,
        navigation: true,
        navigationText: ["<img src='myprevimage.png'>","<img src='mynextimage.png'>"],
        responsiveClass: true,
        responsive:{
            0:{
                items: 1,
                nav:true
            },
            600:{
                items: 2,
                nav:true
            },
            1000:{
                items:4,
                nav: true
            }
        }
    })
     $('#minus-qty').click(function(){
    var crtval = $('#input-quantity').val();
    if(crtval < 2){
      alert('Quanty Must Be 1');
    }
    else{
    var cartval = parseInt(crtval) - parseInt(1);
    //alert(cartval);
    $('#input-quantity').append().val(cartval);
    }
   });
  
    //add quantity
  $('#plus-qty').click(function(){
    var crtval = $('#input-quantity').val();
    var cartval = parseInt(crtval) + parseInt(1);
    //alert(cartval);
    $('#input-quantity').append().val(cartval);
   });

})