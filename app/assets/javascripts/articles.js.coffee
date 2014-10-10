$(document).ready ->
  CKEDITOR.disableAutoInline = true;
  $('.ckeditable').each ->
    $el = $(@)
    id = @.id
    ck_toolbar = 'Poor'
    if $el.data('type') == 'textarea'
      ck_toolbar = 'Rich'
    CKEDITOR.inline(id, toolbar: ck_toolbar)
    CKEDITOR.instances[id].on 'blur', -> actionsDisplay()
    CKEDITOR.instances[id].firstSnapshot = CKEDITOR.instances[id].getData()
    CKEDITOR.instances[id].attr_name = $el.data('name')

  $('#ck-cancel').click -> cancelChanges();
  $('#ck-submit').click (e)-> saveChanges(e.target);

  saveChanges = (target)->
    url = $(target).data('url')
    name = $(target).data('name')
    data = {}
    data[name] = {}
    $.each CKEDITOR.instances, (instance) ->
      if CKEDITOR.instances[instance].checkDirty()
        data[name][CKEDITOR.instances[instance].attr_name] = CKEDITOR.instances[instance].getData()
    #if changed data exists
    if Object.keys(data).length > 0
      $.post( url, data, (responce) -> sucsessUpdate(responce))

  sucsessUpdate = (responce)->
    #url can be changed if title changed?
    if window.location.href == responce.url
      $.each CKEDITOR.instances, (instance) ->
        CKEDITOR.instances[instance].firstSnapshot = CKEDITOR.instances[instance].getData()
      $('#ck-actions').hide()
      alert('Изменения сохранены')
    else
      window.location = responce.url

  cancelChanges = ->
    $.each CKEDITOR.instances, (instance) ->
      CKEDITOR.instances[instance].setData(CKEDITOR.instances[instance].firstSnapshot)
    $('#ck-actions').hide()

  actionsDisplay = ->
    display = false
    $.each CKEDITOR.instances, (instance) ->
      if CKEDITOR.instances[instance].checkDirty()
        display = true
    if display
      $('#ck-actions').show()
      $('#ck-actions').css('top', '100px')

    else
      $('#ck-actions').hide()



