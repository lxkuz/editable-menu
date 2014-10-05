$(document).ready(function() {
    // show hide banner
    var banner = $('#banner'),
        banner_img = $('#banner img'),
        banner_outer = $('.banner-outer'),
        banner_wrap = $('.banner-wrap');

    function detect_banner_slide() {
        var content_width = 1000 + parseInt($('.js-content-width').css('margin-left')),
            with_half_banner = content_width + banner_img.outerWidth()*0.5,
            window_width = $(window).width();
        if(window_width < with_half_banner) {
            banner.addClass('slided');
        } else {
            banner.removeClass('slided');
        }
    }
    $(window).resize(function() {
        detect_banner_slide();
    });
    detect_banner_slide();
    $(window).load(function() {
        detect_banner_slide();
    })

    var trans = false;
    if($('html').hasClass('csstransforms') && $('html').hasClass('csstransitions')) {
        trans = true;
    } else {
        trans = false;
    }
    banner
        .hover(function() {
            if($(this).hasClass('slided')) {
                $(this).addClass('hover');
                show_banner();
            }
        }, function() {
            $(this).removeClass('hover');
            hide_banner();
        });

    function show_banner() {
        var content_width = 1000 + parseInt($('.js-content-width').css('margin-left')),
            window_width = $(window).width(),
            banner_width = banner_img.outerWidth(),
            banner_shift = -(banner_width-(window_width - content_width));
        if(trans) {
            banner_img
                .addClass('open')
                .css({
                    '-webkit-transform': 'translateX(' + banner_shift + 'px)',
                    '-ms-transform': 'translateX(' + banner_shift + 'px)',
                    'transform': 'translateX(' + banner_shift + 'px)'
                });
        } else {
            banner_img
                .addClass('open')
                .stop(1)
                .animate({left: banner_shift},500);
        }
    }
    function hide_banner() {
        if(trans) {
            banner_img
                .removeClass('open')
                .css({
                    '-webkit-transform': 'translateX(' + 0 + 'px)',
                    '-ms-transform': 'translateX(' + 0 + 'px)',
                    'transform': 'translateX(' + 0 + 'px)'
                });
        } else {
            banner_img
                .removeClass('open')
                .stop(1)
                .animate({left: 0},500);
        }
    }

    $(window).resize(function() {
        if(banner_img.hasClass('open')) {
            show_banner();
        }
    });



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
        navigateByClick: false,
        loop: true
    }).data('royalSlider');

    $(".index-slider-2")
    	.find('.rsArrow').addClass('this')
    	.find('.rsArrowIcn').addClass('this-hover');
    var back_timeout;
	$(".index-slider-2")
    	.find('.rsArrow')
    	.hover(function() {
            var _this = $(this);
    		_this.addClass('hover');
            back_timeout = setTimeout(function() {
                _this.addClass('no-back')
            },150);
    	}, function() {
            clearTimeout(back_timeout);
    		$(this).removeClass('hover, no-back');

    	});

    // partners slider
    $('.index-partners-slider').owlCarousel({
        pagination: true,
        items : 4,
        itemsDesktop : [1199,4],
        itemsDesktopSmall : [1100,4],
        itemsTablet: [768,4],
        itemsMobile : [479,4],
        navigation: true,
        navigationText: ["",""],
        responsiveRefreshRate: 50,
        slideSpeed: 300,
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

    // validate
    $('#feedback-form').validate({
        rules: {
            fbemail: "required",
            fbphone: "required"
        },
        submitHandler: function(form) {
            $('.js-feedback-form').hide();
            $('.js-feedback-form-sent').fadeIn(300);
            start_reset_counter();
            // form.submit();
        }
    });
    function form_reset() {
        $('.js-feedback-form-sent').hide();
        $('.js-feedback-form')
            .fadeIn(300)
            .find('input[type="text"], input[type="email"]')
            .val('');
    }
    var feedback_timeout;
    function start_reset_counter() {
        feedback_timeout = setTimeout(function() {
            form_reset();
        }, 3000);
    }

    // auth forms
    $('.js-forget-psw').click(function(e) {
        e.preventDefault();
        $('.js-auth-form').hide();
        $('.js-restore-form').fadeIn(300);
    });
    $('.js-forget-back').click(function(e) {
        e.preventDefault();
        $('.js-restore-form').hide();
        $('.js-auth-form').fadeIn(300);
    });
    $('.js-restore-back').click(function(e) {
        e.preventDefault();
        $('.js-restore-form-success').hide();
        $('.js-auth-form').find('input[type="text"], input[type="password"]').val('');
        $('.js-restore-form').find('input[type="email"]').val('');
        $('.js-auth-form').fadeIn(300);
    });

    var auth_cell = $('.js-auth-cell');
    $('.js-close-auth').click(function() {
        auth_cell
            .animate({left: 10},200)
            .animate({left: -300},1000)
            .removeClass('open');
    });
    $('.js-open-auth').click(function(e) {
        e.preventDefault();
        if(!auth_cell.hasClass('open')) {
            auth_cell
                .animate({left: 10},1000)
                .animate({left: 0},200)
                .addClass('open');
        }
        $.scrollTo($('.js-auth-cell-inner'),500);
    });



    $('.start-auth-form').validate({
        rules: {
            authname: "required",
            authpsw: "required"
        },
        submitHandler: function(form) {
            // console.log('auth submit');
            form.submit();
        }
    });

    $('.restore-auth-form').validate({
        rules: {
            restemail: "required"
        },
        submitHandler: function(form) {
            $('.js-restore-form').hide();
            $('.js-restore-form-success').fadeIn(300);

            // console.log('password restore');
            // form.submit();
        }
    });
});
