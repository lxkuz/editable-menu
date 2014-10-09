class MenuEditor.Base extends MenuEditor.View
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

  render: =>
    @$el.empty()
    @items.each (item) =>
      view = new MenuEditor.RootItemView
        model: item
        searchUrl: @searchUrl
        refreshCallback: @refresh
      @$el.append view.render().el

    form = new MenuEditor.FormView
      model: new MenuEditor.Item({menu: @menu})
      searchUrl: @searchUrl
      refreshCallback: @refresh
    @$el.append form.render().el

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
    @$el.append($("<div class='delimeter'>"))
    @$el.append("<div class='me-btn edit'>")

window.addComponent MenuEditor.Base,
  name: "menu-editor"
  view: true









