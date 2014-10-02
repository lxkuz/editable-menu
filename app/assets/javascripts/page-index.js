$(document).ready(function() {
    // get browser
    function get_browser(){
        var N=navigator.appName, ua=navigator.userAgent, tem;
        var M=ua.match(/(opera|chrome|safari|firefox|msie)\/?\s*(\.?\d+(\.\d+)*)/i);
        if(M && (tem= ua.match(/version\/([\.\d]+)/i))!= null) M[2]= tem[1];
        M=M? [M[1], M[2]]: [N, navigator.appVersion, '-?'];
        return M[0];
        }
    if( get_browser() == 'Firefox') {$('html').addClass('ff');}


    // slider
    var index_slider_1 = $(".index-slider-1").royalSlider({
        arrowsNav: false,
        controlNavigationSpacing: 0,
        controlNavigation: 'bullets',
        keyboardNavEnabled: true,
        // autoHeight: true,
        autoScaleSlider: true,
        autoScaleSliderWidth: 700,
        autoScaleSliderHeight: 200,
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

    $(document).on('click', '.js-slider-next', function() {
    	index_slider_1.next();
    });
    $(document).on('click', '.js-slider-prev', function() {
    	index_slider_1.prev();
    });


    // index slide 2
    var index_slider_2 = $(".index-slider-2").royalSlider({
        arrowsNav: true,
        arrowsNavAutoHide: false,
        controlNavigationSpacing: 0,
        controlNavigation: 'none',
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
            enabled: true,
            delay: 3000,
            pauseOnHover: true,
            stopAtAction: false
        },
        sliderDrag: true,
        sliderTouch: true,
        navigateByClick: false
    }).data('royalSlider');
    $(".index-slider-2")
    	.find('.rsArrow').addClass('this')
    	.find('.rsArrowIcn').addClass('this-hover');
	$(".index-slider-2")
    	.find('.rsArrow')
    	.hover(function() {
    		$(this).addClass('hover');
    	}, function() {
    		$(this).removeClass('hover');
    	});

    // partners slider
    $('.index-partners-slider').owlCarousel({
        pagination: false,
        items : 4, 
        itemsDesktop : [1199,4],
        itemsDesktopSmall : [1100,4],
        itemsTablet: [768,4],
        itemsMobile : [479,4],
        navigation: true,
        navigationText: ["",""],
        responsiveRefreshRate: 50,
        slideSpeed: 800,
        rewindNav: false,
        autoPlay: 3000,
        stopOnHover: true
    });
    $('.index-partners-slider .owl-prev, .index-partners-slider .owl-next')
    	.addClass('this')
    	.append('<span class="this-hover"></span>');

    

    var transforms = $('html').hasClass('csstransforms');
    if(transforms) {
    	$('.zoom').find('.cell-back').addClass('trans');
    }
    var transition = $('html').hasClass('csstransitions');
    var cssable = transforms && transition;
    // image zoom on hover
    $('.zoom').hover(function() {
    	if(cssable) {
    		$(this)
    			.find('.cell-back')
    			.addClass('zoom-back');
    	} else {
	    	$(this)
	    		.find('.cell-back')
	    		.stop()
	    		.animate({
	    			width: "114%",
	    			height: "114%",
	    			left: "-7%",
	    			top: "-7%"
	    			},1500);
    	}
    	// console.log('in');
    }, function() {
    	if(cssable) {
    		$(this)
    			.find('.cell-back')
    			.removeClass('zoom-back')
    	} else {
	    	$(this)
	    		.find('.cell-back')
	    		.stop()
	    		.animate({
	    			left: "0",
	    			top: "0",
	    			width: "100%",
	    			height: "100%"},1500);
	    }
    	// console.log('out');
    });


});