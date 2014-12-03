$(document).ready ->
  colorpickerOps = {
    showPaletteOnly: true,
    showPalette: true,
    allowEmpty: true,
    palette: [
      ['black', 'white', 'rgb(92, 92, 92);']
    ]
  }
  $(".colorpicker-4-banner").spectrum(colorpickerOps);

  $(document).on 'submit', '.front-page-banner-form', (e) ->
    e.preventDefault()
    form = e.target
    data = new FormData(form)
    $.ajax
      url: form.action
      data: data
      cache: false
      contentType: false
      processData: false
      type: 'POST'
      success: (data) ->
        $(data.insert_to).html(data.banner_html)
        if !data.is_bg_banner
          transforms = $('html').hasClass('csstransforms')
          if transforms
            $('.zoom').find('.cell-back').addClass('trans');
          transition = $('html').hasClass('csstransitions');
          cssable = transforms && transition;
          $(data.insert_to).find('.zoom').on 'mouseenter', ->
            if cssable
              $(@).find('.cell-back').addClass('zoom-back')
            else
              $(@).find('.cell-back').stop().animate(
                width: "114%",
                height: "114%",
                left: "-7%",
                top: "-7%"
              ,1500)
          $(data.insert_to).find('.zoom').on 'mouseleave', ->
            if cssable
              $(@).find('.cell-back').removeClass('zoom-back')
            else
              $(@).find('.cell-back').stop().animate(
                  left: "0",
                  top: "0",
                  width: "100%",
                  height: "100%"
                ,1500)
          $(data.insert_to).find(".colorpicker-4-banner").spectrum(colorpickerOps);

  $(document).on 'DOMNodeInserted', '.banner-outer', (e) ->
      content_width = 1000 + parseInt($('.js-content-width').css('margin-left'))
      with_half_banner = content_width + $('#banner img').outerWidth()*0.5
      window_width = $(window).width();
      if(window_width < with_half_banner)
        $('#banner').addClass('slided')




