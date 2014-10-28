$(document).ready ->
  CKEDITOR.disableAutoInline = true;

  isNested = ($el) ->
    if $el.data('nestedFor')
      true
    else
      false

  moveAttrsToCK = (instance, $el) ->
    instance.firstSnapshot = instance.getData()
    instance.dataType = $el.data('type')
    instance.dataAttr = $el.data('attribute')
    instance.dataObject = $el.data('object')
    instance.dataUrl = $el.data('url')
    instance.isNested = isNested($el)
    if instance.isNested
      instance.dataNestedId = $el.data('nestedId')
      instance.dataNestedFor = $el.data('nestedFor')
      instance.dataNestedIndex = $el.data('nestedIndex')

  saveChanges = (instance)->
    if instance.checkDirty()
      url = instance.dataUrl
      obj = instance.dataObject
      data = {}
      data[obj] = getDataFromCK(instance)
      $.post( url, data, (responce) -> sucsessUpdate(responce))

  getContent = (instance) ->
    if instance.dataType == 'textarea'
      instance.getData()
    else
      $('<p>'+instance.getData()+'</p>').text() # no html tags for text inputs

  getDataFromCK = (instance) ->
    data = {}
    content = getContent(instance)
    if instance.isNested
      data[instance.dataNestedFor] ?= {}
      data[instance.dataNestedFor][instance.dataNestedIndex] ?= {}
      data[instance.dataNestedFor][instance.dataNestedIndex][instance.dataAttr] = content
      data[instance.dataNestedFor][instance.dataNestedIndex]['id'] = instance.dataNestedId
    else
      data[instance.dataAttr] = content
    data

  sucsessUpdate = (responce)->
    #url can be changed if title changed?
    if window.location.href == responce.url
      $.each CKEDITOR.instances, (instance) ->
        CKEDITOR.instances[instance].firstSnapshot = CKEDITOR.instances[instance].getData()
        CKEDITOR.instances[instance].resetDirty()
      alert('Изменения сохранены')
    else
      window.location = responce.url

#  we may need this func to undo changes
#  cancelChanges = ->
#    $.each CKEDITOR.instances, (instance) ->
#      CKEDITOR.instances[instance].setData(CKEDITOR.instances[instance].firstSnapshot)

  $('.ckeditable').each ->
    $el = $(@)
    id = @.id
    ck_toolbar = 'Poor'
    if $el.data('type') == 'textarea'
      ck_toolbar = 'Rich'
    CKEDITOR.inline(id, {toolbar: ck_toolbar, readOnly: false}) # by default display:none fields are readonly
    CKEDITOR.instances[id].on 'blur', -> saveChanges(CKEDITOR.instances[id])
    moveAttrsToCK(CKEDITOR.instances[id], $el)

  $('.inline-admin-attributes .collapse').click ->
    $(this).siblings('.collapsible').slideToggle('slow')
    $(this).toggleClass('collapsed')
    $.each CKEDITOR.instances, (instance) ->
      CKEDITOR.instances[instance].setReadOnly(false)

