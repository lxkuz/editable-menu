class MenuEditor.Item extends Backbone.Model
  children: =>
    new MenuEditor.Items(@get "children")

  url: =>
    "/menu_items#{if @id then "/" + @id else ''}"

  targetUrl: =>
    str = _.str.underscored(@get "target_type")

    id = if @get "translit"
      @get "translit"
    else
      @get "target_id"

    switch str
      when "content_page" then "/#{id}"
      else
        str = _(str).pluralize()
        "/#{str}/#{id}"
