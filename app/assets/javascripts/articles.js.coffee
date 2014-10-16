$(document).ready ->
  CKEDITOR.disableAutoInline = true;

  isNested = ($el) ->
    if $el.data('nestedFor')
      true
    else
      false

  moveAttrsToCK = (instance, $el) ->
    instance.firstSnapshot = instance.getData()
    instance.dataAttr = $el.data('attribute')
    instance.dataObject = $el.data('object')
    instance.dataUrl = $el.data('url')
    instance.isNested = isNested($el)
    if instance.isNested
      instance.dataNestedId = $el.data('nestedId')
      instance.dataNestedFor = $el.data('nestedFor')
      instance.dataNestedIndex = $el.data('nestedIndex')

  $('.ckeditable').each ->
    $el = $(@)
    id = @.id
    ck_toolbar = 'Poor'
    if $el.data('type') == 'textarea'
      ck_toolbar = 'Rich'
    CKEDITOR.inline(id, toolbar: ck_toolbar)
    CKEDITOR.instances[id].on 'blur', -> saveChanges(CKEDITOR.instances[id])
    moveAttrsToCK(CKEDITOR.instances[id], $el)

  saveChanges = (instance)->
    if instance.checkDirty()
      url = instance.dataUrl
      obj = instance.dataObject
      data = {}
      data[obj] = getDataFromCK(instance)
      $.post( url, data, (responce) -> sucsessUpdate(responce))

  getDataFromCK = (instance) ->
    data = {}
    if instance.isNested
      data[instance.dataNestedFor] ?= {}
      data[instance.dataNestedFor][instance.dataNestedIndex] ?= {}
      data[instance.dataNestedFor][instance.dataNestedIndex][instance.dataAttr] = instance.getData()
      data[instance.dataNestedFor][instance.dataNestedIndex]['id'] = instance.dataNestedId
    else
      data[instance.dataAttr] = instance.getData()
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



