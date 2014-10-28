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
    @input.keypress @makeLink

    @

  showIfNoResults: (results) =>
    @nothingFounded = (results.length is 0) && !(@input.val().length is 0)
    @noResultsPanel.toggle(@nothingFounded)
    results

  beginAutocomplete: ->
    @input.data('autocompleter').activate()

  setTarget: (obj) =>
    unless _.isEmpty(obj.data)
      @model.set obj.data
      @save()

  makeLink: (ev) =>
      if @nothingFounded and ev.which is 13
        name = @input.val()
        url = prompt("Создание пункта меню '#{name}'. Введите адрес ссылки:")
        if url
          @model.set name: name, url: url
          @save()
        ev.preventDefault()


  save: =>
    @model.save null,
      success: @options.refreshCallback

  unlink: =>
    @input.data('autocompleter').deactivate()
    super
    @$el.remove()