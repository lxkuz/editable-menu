class MenuEditor.ItemView extends MenuEditor.View
  template: "item"
  className: "me-item"

  events:
    "click .destroy": "destroy"

  destroy: =>
    @model.destroy
      success: @options.refreshCallback
    no