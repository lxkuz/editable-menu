class MenuEditor.Base extends MenuEditor.View
  template: "base"

  initialize: =>
    super
    @$el.addClass "menu-editor"
    @menu = @$el.data "menu"
    @searchUrl = @$el.data "search-url"
    @limit = @$el.data("limit") || 10

    @items = new MenuEditor.Items

    @readonly = @$el.attr("data-editable") == undefined
    @$el.toggleClass "readonly", @readonly
    @editable = false
    @render()


  events:
    "click .edit": "toggleEditable"

  toggleEditable: =>
    @editable = !@editable
    for view in @rootItemViews
      view.toggleEditable()

    @$el.toggleClass "editable", @editable

    @itemsContainer.sortable "option", "disabled", !@editable

  render: =>
    super
    @itemsContainer = @$ ".items"
    @refresh()
    unless @readonly
      @itemsContainer.sortable
        stop: @recalcPositions
        items: "li:not(.me-form, .clear)"
        disabled: !@editable
        handle: ".root-item-link"
    @

  draw: =>
    childrenLengthArr = @items.map (item) =>
      item.children().length
    @clear()

    @items.each (item) =>
      view = new MenuEditor.RootItemView
        model: item
        searchUrl: @searchUrl
        readonly: @readonly
        editable: @editable
        parent: @
        refreshCallback: @refresh
      @itemsContainer.append view.render().el
      @rootItemViews.push view

    @formInit()
    @itemsContainer.append $("<li class='clear'>")

  clear: =>
    if @rootItemViews
      for view in @rootItemViews
        view.unlink()
    @formView.unlink() if @formView
    @rootItemViews = []
    @itemsContainer.empty() if @itemsContainer

  refresh: =>
    @items.fetch
      data:
        menu: @menu
      success: @draw

  formInit: =>
    lastChild = @items.last()
    if lastChild
      position = lastChild.get("position") + 1
    else
      position = 1

    if position <=  @limit
      @formView = new MenuEditor.FormView
        model: new MenuEditor.Item({menu: @menu, position: position})
        searchUrl: @searchUrl
        refreshCallback: @refresh
      @itemsContainer.append @formView.render().el
    else
      @formView = undefined

  recalcPositions: (ev, ui) =>
    item = ui.item
    id = item.data "model-id"
    model = @items.get id
    index =  @itemsContainer.children(".me-root-item").index(ui.item) + 1
    model.set "position", index
    model.save null,
      success: @refresh

window.addComponent MenuEditor.Base,
  name: "menu-editor"
  view: true









