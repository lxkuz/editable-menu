class MenuEditor.Base extends MenuEditor.View
  template: "base"

  initialize: =>
    super
    @$el.addClass "menu-editor"
    @menu = @$el.data "menu"
    @searchUrl = @$el.data "search-url"
    @limit = @$el.data("limit")
    @items = new MenuEditor.Items
    @liClass = @$el.data "li-class"
    @ulClass = @$el.data "ul-class"


    @readonly = @$el.attr("data-editable") == undefined
    @$el.toggleClass "readonly", @readonly
    @editable = false
    @render()

    $(window).bind "editing-tumbler", @toggleEditable

  toggleEditable: (ev, editable) =>
    @$el.toggleClass "editing", editable
    @editable = editable
    for view in @rootItemViews
      view.toggleEditable()

    @$el.toggleClass "editable", @editable

    @itemsContainer.sortable "option", "disabled", !@editable

  render: =>
    super
    @itemsContainer = @$ "ul"
    @itemsContainer.addClass @ulClass if @ulClass
    @refresh()
    unless @readonly
      @itemsContainer.sortable
        stop: @recalcPositions
        items: "li:not(.me-form, .clear)"
        disabled: !@editable
        handle: ".item-link"
    @

  draw: =>
    @clear()

    @items.each (item) =>
      view = new MenuEditor.ItemView
        model: item
        searchUrl: @searchUrl
        readonly: @readonly
        editable: @editable
        parent: @
        refreshCallback: @refresh
      el = view.render().el
      $(el).addClass @liClass if @liClass
      @itemsContainer.append el
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

    @formView = new MenuEditor.FormView
      model: new MenuEditor.Item({menu: @menu, position: position})
      searchUrl: @searchUrl
      refreshCallback: @refresh
    @itemsContainer.append @formView.render().el

  recalcPositions: (ev, ui) =>
    item = ui.item
    id = item.data "model-id"
    model = @items.get id
    index =  @itemsContainer.children(".me-item").index(ui.item) + 1
    model.set "position", index
    model.save null,
      success: @refresh

window.addComponent MenuEditor.Base,
  name: "menu-editor"
  view: true









