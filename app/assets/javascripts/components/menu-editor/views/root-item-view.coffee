class MenuEditor.RootItemView extends MenuEditor.View
  template: "root-item"
  tagName: "li"
  className: "me-root-item"

  events:
    "click .destroy": "destroy"
    "click .root-item-link": "preventLink"

  unlink: =>
    super
    for view in @children
      view.unlink()
    @childrenContainer.sortable "destroy"
    @$el.remove()

  render: =>
    super
    @editable = @options.editable
    @$el.data "model-id", @model.id
    @childrenContainer = @$ ".children"
    @children = []
    @model.children().each (child) =>
      view = new MenuEditor.ItemView
        model: child
        parent: @
        refreshCallback: @options.refreshCallback
      @childrenContainer.append view.render().el
      @children.push view

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

    unless @options.readonly
      @childrenContainer.sortable
        stop: @recalcPositions
        items: "li:not(.me-form, .clear)"
        disabled: !@editable
        handle: ".item-link"

    @

  toggleEditable: =>
    @editable = !@editable
    @childrenContainer.sortable "option", "disabled", !@editable


  recalcPositions: (ev, ui) =>
    item = ui.item
    id = item.data "model-id"
    model = @model.children().get id
    index =  @childrenContainer.children(".me-item").index(ui.item) + 1
    model.set "position", index
    model.save null,
      success: @options.refreshCallback

  destroy: =>
    @model.destroy
      success: @options.refreshCallback
    no

  preventLink: =>
    return no if !@options.readonly && @editable