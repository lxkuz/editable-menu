class MenuEditor.ItemView extends MenuEditor.View
  template: "item"

  events:
    "click .destroy": "destroy"

  destroy: =>
    @model.destroy
      success: =>
        @el.remove()
    no
