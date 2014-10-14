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
    @

  showIfNoResults: (results) =>
    @noResultsPanel.toggle((results.length is 0) || (@input.val().length is 0))
    results

  beginAutocomplete: ->
    @input.data('autocompleter').activate()

  setTarget: (obj) =>
    unless _.isEmpty(obj.data)
      @model.set obj.data
      @save()

  save: =>
    @model.save null,
      success: @options.refreshCallback

  unlink: =>
    super
    @$el.remove()