class EditTumbler
  constructor: (el) ->
    @el = $ el
    @el.click @toggle
    @editing = (@el.attr("editing") != undefined) and (@el.attr("editing") != false)

  toggle: =>
    @editing = !@editing
    $(window).trigger "editing-tumbler", [@editing]

window.addComponent EditTumbler, name: "edit-tumbler"


