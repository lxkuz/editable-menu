class MenuEditor.Item extends Backbone.Model
  children: =>
    @_children = new MenuEditor.Items(@get "children") unless @_children
    @_children

  url: =>
    @collection.url + "/" + @id

  targetUrl: =>
    str = _.str.underscored(@get "target_type")
    str = _(str).pluralize()
    id = @get "target_id"
    "/#{str}/#{id}"
