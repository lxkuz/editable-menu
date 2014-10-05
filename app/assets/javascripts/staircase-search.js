$(document).ready(function() {
    var nav_triggers = $('.js-sn-trigger'),
        nav_containers = $('.js-sn-head');
    nav_triggers.click(function() {
        if(!$(this).hasClass('open')) {
            close_filter_nav();
            $(this)
                .addClass('open')
                .parents('.js-sn-head')
                .addClass('open');
        }
    });
    $('body').click(function(e) {
        e=e||window.event;
        var target=e.target||e.srcElement;
        if(!$(target).parents('.js-sn-head.open').length) {
           close_filter_nav();
        }
    });

    function close_filter_nav() {
        nav_triggers.removeClass('open');
        nav_containers.removeClass('open');
    }
    var filters = $('.js-filter-item');
    filters.click(function() {
        if(!$(this).hasClass('active')) {
            $(this)
                .parents('.js-sn-head')
                .find('.active')
                .removeClass('active')
            $(this)
                .addClass('active')
                .parent()
                .addClass('active')
            setTimeout(function() {
                close_filter_nav();
            },200);
        }
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
        navigateByClick: false,
        loop: true
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