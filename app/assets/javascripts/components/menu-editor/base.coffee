window.MenuEditor = {}

class MenuEditor.Base
  constructor: (el) ->
    @el = $ el
    @menu = @el.data "menu"
    @items = new MenuEditor.Items
    @items.fetch
      data: {menu: @menu}
      success: @render

  render: =>
    @items.each (item) =>
      view = new MenuEditor.RootItemView
        model: item
      @el.append view.render().el
    @htmlFixes()


  htmlFixes: =>
    @el.children().first().addClass("col-xs-offset-1")
    @el.append($("<div class='delimeter'>"))

window.addComponent MenuEditor.Base, name: "menu-editor"










