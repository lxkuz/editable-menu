class MenuEditor.ItemView extends MenuEditor.View
  template: "item"
  className: "me-item"

  events:
    "click .destroy": "destroy"
    "click .item-link": "preventLink"

  preventLink: =>
    @options.parent.preventLink()

  render: =>
    super
    @$el.data "model-id", @model.id
    @

  destroy: =>
    @model.destroy
      success: @options.refreshCallback
    no