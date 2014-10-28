class EditTumbler
  constructor: (el) ->
    @el = $ el
    @el.click @trigger
    @editing = (@el.attr("editing") != undefined) and (@el.attr("editing") != false)
    $(window).bind "editing-tumbler", @toggle

  toggle: (ev, editing)=> @editing = editing

  trigger: => $(window).trigger "editing-tumbler", [!@editing]

window.addComponent EditTumbler, name: "edit-tumbler"


