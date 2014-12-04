$(document).ready(function() {
    PNotify.prototype.options.styling = "jqueryui";

    // search field
    $('.js-search-field').focus(function() {
        if(this.value==this.defaultValue) this.value='';
    });
    $('.js-search-field').blur(function() {
        if(this.value=='') this.value=this.defaultValue;
    });

    // phone links
    var deviceAgent = navigator.userAgent.toLowerCase();
    var agentID = deviceAgent.match(/(iphone|ipod|ipad)/);
    if (!agentID) {
        $('body').on('click', 'a[href^="tel:"]', function() {
            $(this).attr('href',
                $(this).attr('href').replace(/^tel:/, 'callto:'));
        });
    }

    // detect mobile device
    var mobile = (/iphone|ipad|ipod|android|blackberry|mini|windows\sce|palm/i.test(deviceAgent));
    if(mobile) {
        $('html').addClass('mobile');
    }

    // cover background
    $('.do-cover').css({backgroundSize: "cover"});

    // navigation
    var nav = $('.js-nav'),
        nav_trigger = $('.js-nav-trigger');
    $('.js-nav-trigger').click(function() {
        show_navigation();
    });
    function show_navigation() {
        nav
         .slideDown(300)
         .addClass('open');
    }
    function hide_navigation() {
        nav
         .slideUp(300)
         .removeClass('open');
    }

    var timeout,
        first_over = 1;
    $('body').mousemove(function(e) {
        e=e||window.event;
        var target=e.target||e.srcElement;
        if(nav.hasClass('open')) {
            if(!$(target).parents('.js-nav').length &&
               !$(target).parents('.js-nav-trigger').length &&
               !$(target).filter('.js-nav').length &&
               !$(target).filter('.js-nav-trigger').length) {
                if(first_over) {
                    timeout = setTimeout(function() {
                        hide_navigation();
                    }, 1000);
                    first_over = 0;
                    // console.log('not on menu');
                }
            } else {
                // console.log('on menu');
                first_over = 1;
                clearTimeout(timeout);
            }
        }
    });

    // inner nav
    var nav_inner = $('.js-nav-inner');
    $('.js-inner-nav-trigger').click(function() {
        switch_state($(this), 250);
    });
    function switch_state(trigger, delay) {
        if(trigger.hasClass('active')) {
            nav_inner.slideToggle(delay, 'linear');
            setTimeout(function() {
                trigger
                    .toggleClass('active')
                    .animate({left: 100}, delay);
            }, delay);
        } else {
            trigger
                .toggleClass('active')
                .animate({left: 36}, delay);
            setTimeout(function() {
                nav_inner.slideToggle(delay, 'linear');
            }, 2*delay);
        }
    }

    // anchors
    var fixed_top_offset = $('.js-fixed-top').outerHeight() + 20;
    $('.js-anchor').click(function(e) {
        e.preventDefault();
        var $target = $('[name=' + $(this).attr('href').replace(/^.*#/, "") + ']')
        var scroll_to = $target.offset().top - fixed_top_offset;
        $.scrollTo({top: scroll_to, left: 0}, 500);
    });

    if (window.location.hash) {
      setTimeout(function() {
        var $target = $('[name=' + window.location.hash.replace('#', '') + ']')
        if($target.length) {
            var scroll_to = $target.offset().top - fixed_top_offset;
            $.scrollTo({top: scroll_to, left: 0});
        }
      }, 500);
    }

    // tabs
    var tab_trigger = $('.js-tab-trigger'),
        tab_content = $('.js-tab-content');
    tab_trigger.click(function(e) {
        e.preventDefault();
        if(!$(this).hasClass('active')) {
            tab_trigger.removeClass('active');
            $(this).addClass('active');
            tab_content.hide().filter('#'+$(this).data('tabs')).fadeIn(300);
        }
    });
});
