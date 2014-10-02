$(document).ready(function() {
    $("#reviews-slider").owlCarousel({
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
        rewindNav: false,
        autoPlay: 3000,
        stopOnHover: true
    });
    $('.js-rev-count').html($('#reviews-slider .rev-slide').length);
    $('.owl-prev, .owl-next')
        .addClass('this')
        .append('<span class="this-hover"></span>');
    $(document).on('mouseenter','.owl-prev, .owl-next', function() {
        $(this).addClass('hover');
    });
    $(document).on('mouseleave','.owl-prev, .owl-next',  function() {
        $(this).removeClass('hover');
    });

    
});