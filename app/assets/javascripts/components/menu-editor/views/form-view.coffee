class MenuEditor.FormView extends MenuEditor.View
  template: "form"
  className: "me-form"

  events:
    "click .save": "save"

  render: =>
    super
    imput = @$ "input"
    imput.autocomplete @options.searchUrl,
      queryParamName: "query"
      remoteDataType: 'json'
      onItemSelect: @setTarget
    @

  setTarget: (obj) =>
    @model.set obj.data

  save: =>
    @model.save null,
      success: @options.refreshCallback

  unlink: =>
    super
    @$el.remove()