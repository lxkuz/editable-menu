class MenuEditor.View extends Backbone.View

  getTemplateFunction: =>
    JST["components/menu-editor/templates/#{@template}"]

  render: =>
    html = @getTemplateFunction()(@getTemplateParams())
    @$el.html html
    @

  getTemplateParams: =>
    model: @model