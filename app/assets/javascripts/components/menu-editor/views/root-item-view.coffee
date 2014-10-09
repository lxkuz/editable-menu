class MenuEditor.RootItemView extends MenuEditor.View
  template: "root-item"
  className: "me-root-item col-xs-2"

  events:
    "click .destroy": "destroy"

  render: =>
    super
    @model.children().each (child) =>
      view = new MenuEditor.ItemView
        model: child
        editable: @options.editable
        refreshCallback: @options.refreshCallback
      @$el.append view.render().el

    form = new MenuEditor.FormView
      model: new MenuEditor.Item({parent_id: @model.id})
      searchUrl: @options.searchUrl
      refreshCallback: @options.refreshCallback
    @$el.append form.render().el
    @

  destroy: =>
    @model.destroy
      success: @options.refreshCallback
    no