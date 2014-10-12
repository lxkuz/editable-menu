class MenuEditor.View extends Backbone.View

  initialize: =>
    @options = arguments[0]
    super

  getTemplateFunction: =>
    JST["components/menu-editor/templates/#{@template}"]

  render: =>
    html = @getTemplateFunction()(@getTemplateParams())
    @$el.html html
    @

  getTemplateParams: =>
    model: @model
    options: @options

  unlink: =>
    @unbind()