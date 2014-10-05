#= require active_admin/base
#= require jquery.liTranslit
#= require jquery.datetimepicker

$(document).ready ->
  $('#article_title').liTranslit
    elAlias: $('#article_title_translit')

  $('#article_published_at').datetimepicker()
