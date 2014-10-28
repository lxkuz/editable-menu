class MenuEditor.ItemView extends MenuEditor.View
  template: "item"
  tagName: "li"
  className: "me-item"

  events:
    "click .destroy": "destroy"
    "click .item-link": "preventLink"

  unlink: =>
    super
    @$el.remove()

  render: =>
    super
    @editable = @options.editable
    @$el.data "model-id", @model.id
    @

  toggleEditable: =>
    @editable = !@editable

  destroy: =>
    @model.destroy
      success: @options.refreshCallback
    no

  preventLink: =>
    if !@options.readonly && @editable
      return no
