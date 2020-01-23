$(document).ready(function(){

    setInterval(function () {
        var line = $('.hor-line').css('height');
        if(line == '1px'){

            $('.hor-line').animate({height : 100}, 500)
        }
        setTimeout(function () {
           if(line == '100px'){

            $('.hor-line').animate({height : 1}, 500)
            } 
        }, 100)

    },1000)

    setInterval(function () {
        var line = $('.hor-line-1').css('height');
        if(line == '1px'){

            $('.hor-line-1').animate({height : 100}, 500)
        }
        setTimeout(function () {
           if(line == '100px'){

            $('.hor-line-1').animate({height : 1}, 500)
            } 
        }, 100)

    },1200)

    setInterval(function () {
        var line = $('.hor-line-2').css('height');
        if(line == '1px'){

            $('.hor-line-2').animate({height : 100}, 400)
        }
        setTimeout(function () {
           if(line == '100px'){

            $('.hor-line-2').animate({height : 1}, 400)
            } 
        }, 100)

    },1400)



/*---------------------------------------*/
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();
        $(".zoom img").css({
        transform: 'translate3d(-50%, -'+(scroll/100)+'%, 0) scale('+(100 + scroll/5)/100+')',
        });
    });
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
    //фиксированое меню
        // $(window).scroll(function() {
        //     var Top = $(window).scrollTop();
        //        if(Top > 20){
        //         $('.menu').hide("slow");
        //         $('.menu-fixed').show("slow");
        //        }else {
        //         $('.menu').show("slow");
        //         $('.menu-fixed').hide("slow");
        //        }
        // });
        // $('.menu-fixed-icon').click(function(){
        //     if($('.menu-fixed-phone').css("display") == "none"){
        //         $('.menu-fixed-phone').show("slow");
        //         $('.menu-fixed-mail').show("slow");
        //         $('.menu-fixed-item').show("slow");
        //     }else{
        //         $('.menu-fixed-phone').hide("slow")
        //         $('.menu-fixed-mail').hide("slow")
        //         $('.menu-fixed-item').hide("slow")
        //     }
        // })

    //Прокрутка к якорям
    //Наша философия
     $('#button').click(function(){
        var top = $('#form').offset().top;
        $('html,body').animate({ scrollTop: top}, 3000)
    });
    //OWL-CARUSEL
    $('.owl-carousel').owlCarousel({
        items:1,
        lazyLoad:true,
        loop: true,
        autoplay: true,
        singleItem: true,
        margin:0,
        responsiveClass:true,
        responsive:{
            0:{
                items:1,
                nav:true,
                loop: true,
                lazyLoad: true
            },
            600:{
                items:1,
                nav: true,
                loop: true,
                lazyLoad: true
            },
            1000:{
                items:1,
                nav:true,
                loop: true,
                lazyLoad: true
            }
        }
    })

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

    //-------------------------

    // //------------------------- горизонтальная прокрутка
    // function scrollHorizontally(e) { //включает горизонтальный скрол элемента колесом
    // e = window.event || e;
    //     var delta = Math.max(-1, Math.min(1, (e.wheelDelta || -e.detail))); //это шаг колеса для разных браузеров
    // document.documentElement.scrollLeft -= (delta * 40); //прокручиваем всю страницу
    //     e.preventDefault();
    // };
  
    // function addMouseWell(elem, callback) { //вешает кроссплатформенный обработчик на колесо мыши над элементом
    //     if (elem.addEventListener) {
    //         if ('onwheel' in document) {
    //           elem.addEventListener("wheel", callback);
    //         } else if ('onmousewheel' in document) {
    //         elem.addEventListener("mousewheel", callback);
    //      } else {
    //           elem.addEventListener("MozMousePixelScroll", callback);
    //         }
    //     } else {
    //         elem.attachEvent("onmousewheel", callback);
    //     }
    // }

    // addMouseWell(window, scrollHorizontally);
    // //-----------------
})