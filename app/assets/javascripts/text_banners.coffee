$(document).ready ->
  colorpickerOps = {
    showPalette: true
    allowEmpty: true
    palette: [
      ['black', 'white'],
      ['rgb(222, 58, 26);', 'rgb(92, 92, 92);']
    ]
    change: (color) ->
      if color
        color.toHexString()

  }
  $(".colorpicker").spectrum(colorpickerOps);

  $('.uitabs').tabs()

  $('.ckeditable-rich-text').each ->
    CKEDITOR.replace(@, {toolbar: 'RichText', readOnly: false})


  $(document).on 'change', '.tb-toggle-chb', ->
    if $(@).is(":checked")
      $($(@).data('for')).removeClass('is-hidden')
    else
      $($(@).data('for')).addClass('is-hidden')
    $.modal.resize()

  $(document).on 'submit', '.text-banner-form', (e) ->
    e.preventDefault()
    form = e.target
    data = new FormData(form)
    $('.wrapper').block
      message: '<h3>Отправка..</h3>',
      css:
        border: '3px solid ##252525'
        padding: '15px'
        borderRadius: '8px'
    $.ajax
      url: form.action
      data: data
      cache: false
      contentType: false
      processData: false
      type: 'POST'
      success: (data) ->
        $('.wrapper').unblock()
        $(data.insert_to).html(data.banner_html)
        $(data.insert_to).find('.uitabs').tabs()
        $(data.insert_to).find(".colorpicker").spectrum(colorpickerOps);
        ta = $(data.insert_to).find('.ckeditable-rich-text')[0]
        if ta?
          CKEDITOR.replace(ta, {toolbar: 'RichText', readOnly: false})


