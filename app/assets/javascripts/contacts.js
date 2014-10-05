$(document).ready(function() {
    $("#cont-slider").owlCarousel({
        pagination: false,
        items : 3, 
        itemsDesktop : [1199,3],
        itemsDesktopSmall : [1100,3],
        itemsTablet: [768,3],
        itemsMobile : [479,3],
        navigation: true,
        navigationText: ["",""],
        responsiveRefreshRate: 50,
        slideSpeed: 150,
        rewindNav: true,
        autoPlay: 3000,
        stopOnHover: true
    });
    $('.owl-prev, .owl-next')
        .addClass('this')
        .append('<span class="this-hover"></span>');
    $(document).on('mouseenter','.owl-prev, .owl-next', function() {
        $(this).addClass('hover');
    });
    $(document).on('mouseleave','.owl-prev, .owl-next',  function() {
        $(this).removeClass('hover');
    });

    // staircase counter
    $('.js-stair-count').each(function(){
        var value_arr = $(this).html().split('');
        $(this).html('');
        for(var i = 0; i < value_arr.length; i++) {
            $('<span class="stair-count-item">'+value_arr[i]+'</span>').appendTo($(this));
        }
    });
});