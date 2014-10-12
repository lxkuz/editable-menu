class MenuEditor.Item extends Backbone.Model
  children: =>
    new MenuEditor.Items(@get "children")

  url: =>
    "/menu_items#{if @id then "/" + @id else ''}"

  targetUrl: =>
    str = _.str.underscored(@get "target_type")
    str = _(str).pluralize()
    id = @get "target_id"
    "/#{str}/#{id}"
