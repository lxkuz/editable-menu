$(document).ready ->
  CKEDITOR.disableAutoInline = true;

  isNested = ($el) ->
    if $el.data('nestedFor')
      true
    else
      false

  moveAttrsFromJqToCK = (instance, $el) ->
    instance.firstSnapshot = instance.getData()
    instance.dataName = $el.data('name')
    instance.isNested = isNested($el)
    if instance.isNested
      instance.dataNestedId = $el.data('nestedId')
      instance.dataNestedFor = $el.data('nestedFor')
      instance.dataNestedIndex = $el.data('nestedIndex')

  actionsDisplay = ->
    display = false
    $.each CKEDITOR.instances, (instance) ->
      if CKEDITOR.instances[instance].checkDirty()
        display = true
    if display
      $('#ck-actions').show()
    else
      $('#ck-actions').hide()

  $('.ckeditable').each ->
    $el = $(@)
    id = @.id
    ck_toolbar = 'Poor'
    if $el.data('type') == 'textarea'
      ck_toolbar = 'Rich'
    CKEDITOR.inline(id, toolbar: ck_toolbar)
    CKEDITOR.instances[id].on 'blur', -> actionsDisplay()
    moveAttrsFromJqToCK(CKEDITOR.instances[id], $el)

  $('#ck-cancel').click -> cancelChanges()
  $('#ck-submit').click (e)-> saveChanges(e.target)

  saveChanges = (target)->
    url = $(target).data('url')
    name = $(target).data('name')
    data = {}
    data[name] = {}
    $.each CKEDITOR.instances, (instance) ->
      if CKEDITOR.instances[instance].checkDirty()
        getDataFromCK(CKEDITOR.instances[instance], data[name])
    if Object.keys(data).length > 0 #changed data exists
      console.log data
      $.post( url, data, (responce) -> sucsessUpdate(responce))

  getDataFromCK = (instance, data) ->
    data ?= {}
    if instance.isNested
      data[instance.dataNestedFor] ?= {}
      data[instance.dataNestedFor][instance.dataNestedIndex] ?= {}
      data[instance.dataNestedFor][instance.dataNestedIndex][instance.dataName] = instance.getData()
      data[instance.dataNestedFor][instance.dataNestedIndex]['id'] = instance.dataNestedId
    else
      data[instance.dataName] = instance.getData()
    data

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


