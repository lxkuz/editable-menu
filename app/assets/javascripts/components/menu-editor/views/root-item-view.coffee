class MenuEditor.RootItemView extends MenuEditor.View
  template: "root-item"
  tagName: "li"
  className: "me-root-item col-xs-2"

  events:
    "click .destroy": "destroy"

  render: =>
    super
    @$el.data "model-id", @model.id
    @childrenContainer = @$ ".children"
    @model.children().each (child) =>
      view = new MenuEditor.ItemView
        model: child
        editable: @options.editable
        refreshCallback: @options.refreshCallback
      @childrenContainer.append view.render().el

    lastChild = @model.children().last()
    if lastChild
      position = lastChild.get("position") + 1
    else
      position = 1

    form = new MenuEditor.FormView
      model: new MenuEditor.Item({parent_id: @model.id, position: position})
      searchUrl: @options.searchUrl
      refreshCallback: @options.refreshCallback
    @childrenContainer.append form.render().el
    @

  destroy: =>
    @model.destroy
      success: @options.refreshCallback
    no