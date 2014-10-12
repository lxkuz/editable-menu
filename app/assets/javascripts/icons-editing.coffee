class IconsEditing

  $(window).load ->
    $('[role="icon_editable"]').on 'mouseover', (event) ->
      $(this).find('.edit-icons').addClass("view-edit-icons")

    $('[role="icon_editable"]').on 'mouseout', (event) ->
      $(this).find('.edit-icons').removeClass("view-edit-icons")