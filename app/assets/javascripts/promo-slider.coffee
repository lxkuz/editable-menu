$(document).ready ->
  promoSliderOps = {
    arrowsNav: false,
    controlNavigationSpacing: 0,
    controlNavigation: 'bullets',
    keyboardNavEnabled: true,
    autoScaleSlider: true,
    autoScaleSliderWidth: 700,
    autoScaleSliderHeight: 200,
    imageScalePadding: 0,
    slidesSpacing: 0,
    transitionSpeed: 500,
    imageScaleMode: 'fit',
    autoPlay:
      enabled: false,
      delay: 4000,
      pauseOnHover: true,
      stopAtAction: false
    sliderDrag: true,
    sliderTouch: true,
    navigateByClick: false
  }
  promo_slider = $(".index-slider-1").royalSlider(promoSliderOps).data('royalSlider');

  $(document).on 'click', '.js-slider-next',  ->
    promo_slider.next()
  $(document).on 'click', '.js-slider-prev', ->
    promo_slider.prev()

  $('.promo-slider-wrapper').on 'submit', 'form', (e)->
    $('body>.wrapper').block
      message: '<h3>Отправка..</h3>'
      css:
        border: '3px solid ##252525'
        padding: '15px'
        borderRadius: '8px'

  $('.promo-slider-wrapper').on 'ajax:success', 'form, .index-slider-1 .destroy', (event, data, status, xhr)->
    $('body>.wrapper').unblock();
    promo_slider.destroy();
    $(".promo-slider-wrapper").html(data.slider_html)
    promo_slider = $(".index-slider-1").royalSlider(promoSliderOps).data('royalSlider');
    if data.goto?
      promo_slider.goTo(data.goto)
  return false