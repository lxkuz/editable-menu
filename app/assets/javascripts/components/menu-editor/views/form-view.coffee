class MenuEditor.FormView extends MenuEditor.View
  template: "form"
  tagName: "li"
  className: "me-form"

  events:
    "focusin input": "beginAutocomplete"

  render: =>
    super
    @input = @$ "input"
    @noResultsPanel = @$ ".no-results"
    @noResultsPanel.hide()
    
    @input.autocomplete @options.searchUrl,
      queryParamName: "query"
      remoteDataType: 'json'
      onItemSelect: @setTarget
      minChars: 0
      processData: @showIfNoResults
      useCache: false

    @addLink = @$ "a.add-link"
    @addLink.hide()
    @addLink.click @makeLink
    @input.keypress @makeLinkOnEnter
    @

  showIfNoResults: (results) =>
    @nothingFounded = (results.length is 0) && !(@input.val().length is 0)
    @noResultsPanel.toggle(@nothingFounded)
    @addLink.toggle(@nothingFounded)
    results

  beginAutocomplete: ->
    @input.data('autocompleter').activate()

  setTarget: (obj) =>
    unless _.isEmpty(obj.data)
      @model.set obj.data
      @save()

  makeLinkOnEnter: (ev) =>
    if ev.which is 13
      @makeLink()
      ev.preventDefault()

  makeLink: () =>
    if @nothingFounded
      name = @input.val()
      url = prompt("Создание пункта меню '#{name}'. Введите адрес ссылки:")
      if url
        @model.set name: name, url: url
        @save()
      false


  save: =>
    @model.save null,
      success: @options.refreshCallback

  unlink: =>
    @input.data('autocompleter').deactivate()
    super
    @$el.remove()