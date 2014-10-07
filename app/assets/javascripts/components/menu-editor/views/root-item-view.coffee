class MenuEditor.RootItemView extends MenuEditor.View
  template: "root-item"
  className: "col-xs-2"

  events:
    "click .destroy": "destroy"

  render: =>
    super
    @model.children().each (child) =>
      view = new MenuEditor.ItemView model: child
      @$el.append view.render().el
    @

  destroy: =>
    @model.destroy
      success: =>
        @el.remove()
    no