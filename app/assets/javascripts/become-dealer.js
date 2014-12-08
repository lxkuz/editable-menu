$(document).ready(function() {
    //var dealer_slider = $('#dealer-slider').royalSlider({
    //    arrowsNav: false,
    //    loop: false,
    //    keyboardNavEnabled: true,
    //    imageAlignCenter: true,
    //    arrowsNavAutoHide: false,
    //    controlsInside: false,
    //    // imageScaleMode: 'fit',
    //    addActiveClass: true,
    //    autoHeight: true,
    //    // autoScaleSlider: true,
    //    // autoScaleSliderHeight: 412,
    //    controlNavigation: 'bullets',
    //    thumbsFitInViewport: false,
    //    navigateByClick: false,
    //    startSlideId: 0,
    //    autoPlay: true,
    //    transitionType:'slide',
    //    globalCaption: false,
    //    sliderDrag: true,
    //    sliderTouch: true
    //}).data('royalSlider');

    $('.js-goto-form').click(function(e) {
        e.preventDefault();
        var dest_pos = $('.js-dealer-form-wrap').offset().top;
        $.scrollTo(dest_pos - 100, 500);
        setTimeout(function() {
            $('.js-focus').focus();
        },500);
    });

    
    $('.become-dealer-form').validate({
        rules: {
            'dealer_request[name]': "required",
            'dealer_request[email]': "required",
            'dealer_request[phone]': "required",
            'dealer_request[city]': "required"
        },
        submitHandler: function(form) {
            var data = new FormData(form);
            $('.dealer-form-wrap').block({
                message: '<h3>Отправка..</h3>',
                css: {
                    border: '3px solid ##252525',
                    padding: '15px'
                }
            });
            $.ajax({
                url: form.action,
                data: data,
                cache: false,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function(){
                    $('.dealer-form-wrap').unblock();
                    show_success_form();
                }
            });
        }

    });
    $(document).on('ajax:success', '.become-dealer-form', function(){
        show_success_form();
    })
    function show_success_form() {
        $('.js-dealer-form').hide();
        $('.js-form-success').fadeIn(300);
        start_counter();
    }
    $('.js-close-form').click(function() {
        close_form();
    });
    var counter = $('.js-close-counter');
    var interval,
        timeout;
    function start_counter() {
        counter.html(counter.data('start'));

        clearInterval(interval);
        interval = setInterval(function() {
            counter.html(+counter.html() -1 );
        },1000);
        timeout = setTimeout(function() {
            clearInterval(interval);
            close_form();
        }, 5000);
    }
    function close_form() {
        $('.js-dealer-form-wrap').slideUp(300);
        $('.js-goto-form')
            .off()
            .addClass('disable hover');
    }
});