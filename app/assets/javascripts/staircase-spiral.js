$(document).ready(function() {
    function units(num, cases) {
        cases = {nom: 'фотография', gen: 'фотографии', plu: 'фотографий'};
        num = Math.abs(num);
        
        var word = '';
        
        if (num.toString().indexOf('.') > -1) {
            word = cases.gen;
        } else { 
            word = (
                num % 10 == 1 && num % 100 != 11 
                    ? cases.nom
                    : num % 10 >= 2 && num % 10 <= 4 && (num % 100 < 10 || num % 100 >= 20) 
                        ? cases.gen
                        : cases.plu
            );
        }
        return word;
    }
    // top slider
    var slider_count = $('#staircase-slider .slide').length;
    $('.js-slider-count').html(slider_count + ' ' + units(slider_count));
    var staircase_slider = $("#staircase-slider").royalSlider({
        arrowsNav: false,
        controlNavigationSpacing: 0,
        controlNavigation: 'bullets',
        keyboardNavEnabled: true,
        // autoHeight: true,
        autoScaleSlider: true,
        autoScaleSliderWidth: 1000,
        autoScaleSliderHeight: 400,
        imageScalePadding: 0,
        slidesSpacing: 0,
        transitionSpeed: 500,
        imageScaleMode: 'fit',
        autoPlay: {
            enabled: false,
            delay: 4000,
            pauseOnHover: true,
            stopAtAction: false,
        },
        sliderDrag: true,
        sliderTouch: true,
        navigateByClick: false,
    }).data('royalSlider');
    $('.js-slider-count-wrap')
        .append('<span class="left-helper"></span>');
    var left_pos = $('.left-helper').offset().left;
    $("#staircase-slider .rsBullets").offset({left: left_pos});

    // popular
    $("#popular-slider").owlCarousel({
        pagination: false,
        items : 2,
        itemsDesktop : [1199,2],
        itemsDesktopSmall : [1100,2],
        itemsTablet: [768,2],
        itemsMobile : [479,2],
        navigation: true,
        navigationText: ["",""],
        responsiveRefreshRate: 50,
        slideSpeed: 800,
        rewindNav: false,
        autoPlay: 3000,
        stopOnHover: true
    });
    $('.js-popular-count').html($("#popular-slider .popular-slide").length);

    // reccomend reviews slider
    $("#rec-rev-slider").owlCarousel({
        pagination: false,
        items : 1,
        itemsDesktop : [1199,1],
        itemsDesktopSmall : [1100,1],
        itemsTablet: [768,1],
        itemsMobile : [479,1],
        navigation: true,
        navigationText: ["",""],
        responsiveRefreshRate: 50,
        slideSpeed: 800,
        rewindNav: true,
        autoPlay: 3000,
        stopOnHover: true
    });
    $('.js-rev-count').html($('#rec-rev-slider .rec-reviews-slide').length);

    $('.owl-prev, .owl-next')
        .addClass('this')
        .append('<span class="this-hover"></span>');
    $(document).on('mouseenter','.owl-prev, .owl-next', function() {
        $(this).addClass('hover');
    });
    $(document).on('mouseleave','.owl-prev, .owl-next',  function() {
        $(this).removeClass('hover');
    });

    // special slider
    var index_slider_2 = $(".special-slider").royalSlider({
        arrowsNav: true,
        arrowsNavAutoHide: false,
        controlNavigationSpacing: 0,
        controlNavigation: 'none',
        keyboardNavEnabled: true,
        // autoHeight: true,
        autoScaleSlider: true,
        autoScaleSliderWidth: 1000,
        autoScaleSliderHeight: 300,
        imageScalePadding: 0,
        slidesSpacing: 0,
        transitionSpeed: 500,
        imageScaleMode: 'fit',
        autoPlay: {
            enabled: true,
            delay: 3000,
            pauseOnHover: true,
            stopAtAction: false
        },
        sliderDrag: true,
        sliderTouch: true,
        navigateByClick: false
    }).data('royalSlider');
    $(".special-slider")
        .find('.rsArrow').addClass('this')
        .find('.rsArrowIcn').addClass('this-hover');
    $(".special-slider")
        .find('.rsArrow')
        .hover(function() {
            $(this).addClass('hover');
        }, function() {
            $(this).removeClass('hover');
        });
});