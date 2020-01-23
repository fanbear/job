$(document).ready(function(){

//--------- фиксированое меню-------------
    $(window).scroll(function() {
            var Top = $(window).scrollTop();
            if( Top > 20){
                $('.menu').addClass("fix")
            }else{
                $('.menu').removeClass("fix")
            }
                if ($(window).width() < 850 && Top > 20){
                    $('.menu').addClass("fix")
                    $('.logo').css({"display" : "none"})
                    $('.menu-item').css({"display" : "none"})
               }else {
                $('.menu a').removeClass("fix")
                $('.logo').css({"display" : "block"})
                $('.menu-item').css({"display" : "block"})
               }
        });
//----------------------------------------

//---------------- Отзывы ---------------

    $('#rev').click(function (){
        $('.hidden').slideToggle();
    })

//--------------------------------------



//-----------Прокрутка к якорям----------
    $('#setup').click(function(){
        var top = $('#setup-block').offset().top;
        console.log('top');
        $('html,body').animate({ scrollTop: top}, 3000)
    });
//---------------------------------------


//---------------OWL-CARUSEL
    $('.owl-carousel-1').owlCarousel({
        items: 3,
        lazyLoad:true,
        loop:true,
        autoplay:true,
        singleItem:true,
        margin:10,
        responsiveClass:true,
        responsive:{
            0:{
                items: 1,
                nav:true,
                loop:true,
                lazyLoad:true
            },
            600:{
                items: 3,
                nav:true,
                loop:true,
                lazyLoad:true
            },
            1000:{
                items:3,
                nav:true,
                loop:true,
                lazyLoad:true
            }
        }
    })
    $('.owl-carousel-2').owlCarousel({
        items: 3,
        lazyLoad:true,
        loop:true,
        autoplay:true,
        singleItem:true,
        margin:10,
        responsiveClass:true,
        responsive:{
            0:{
                items: 1,
                nav:true,
                loop:true,
                lazyLoad:true
            },
            600:{
                items: 3,
                nav:true,
                loop:true,
                lazyLoad:true
            },
            1000:{
                items:3,
                nav:true,
                loop:true,
                lazyLoad:true
            }
        }
    })

//-------------------------



//-------------------АяксФорма-------------------
     $("form").submit(function () {
         // Получение ID формы
         var formID = $(this).attr('id');
         // Добавление решётки к имени ID
         var formNm = $('#' + formID);
         $.ajax({
         type: "POST",
         url: 'mail.php',
         data: formNm.serialize(),
         success: function (data) {
             // Вывод текста результата отправки
             $(formNm).html(data);
             },
             error: function (jqXHR, text, error) {
             // Вывод текста ошибки отправки
             $(formNm).html(error);
             }
         });
         return false;
     });

     $("form-2").submit(function () {
         // Получение ID формы
         var formID = $(this).attr('id');
         // Добавление решётки к имени ID
         var formNm = $('#' + formID);
         $.ajax({
         type: "POST",
         url: 'mail.php',
         data: formNm.serialize(),
         success: function (data) {
             // Вывод текста результата отправки
             $(formNm).html(data);
             },
             error: function (jqXHR, text, error) {
             // Вывод текста ошибки отправки
             $(formNm).html(error);
             }
         });
         return false;
     });
//-----------------------------------------------

})