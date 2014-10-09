class MenuEditor.Base extends MenuEditor.View
  template: "base"

  initialize: =>
    super
    @$el.addClass "menu-editor"
    @menu = @$el.data "menu"
    @searchUrl = @$el.data "search-url"

    @readonly = @$el.attr("data-editable") != undefined
    @$el.toggleClass "readonly", @readonly
    @editable = false

    @refresh()

  events:
    "click .edit": "toggleEditable"

  toggleEditable: =>
    @editable = !@editable
    @$el.toggleClass "editable", @editable
    @itemsContainer.sortable( "option", "disabled", !@editable );

  render: =>
    super
    @itemsContainer = @$ ".items"
    @itemsContainer.empty()
    @items.each (item) =>
      view = new MenuEditor.RootItemView
        model: item
        searchUrl: @searchUrl
        refreshCallback: @refresh
      @itemsContainer.append view.render().el

    lastChild = @items.last()
    if lastChild
      position = lastChild.get("position") + 1
    else
      position = 1

    form = new MenuEditor.FormView
      model: new MenuEditor.Item({menu: @menu, position: position})
      searchUrl: @searchUrl
      refreshCallback: @refresh
    @itemsContainer.after form.render().el
    adjustment = undefined
    unless @readonly
      @itemsContainer.sortable
        stop: @recalcPositions
        disabled: !@editable

    @htmlFixes()
    @

  refresh: =>
    @items = new MenuEditor.Items
    @items.fetch
      data:
        menu: @menu
      success: @render

  htmlFixes: =>
    @$el.children().first().addClass("col-xs-offset-1")

  recalcPositions: (ev, ui) =>
    item = ui.item
    id = item.data "model-id"
    model = @items.get id
    index =  @itemsContainer.children().index(ui.item) + 1
    model.set "position", index
    model.save null,
      success: @refresh


window.addComponent MenuEditor.Base,
  name: "menu-editor"
  view: true









