#= require active_admin/base
#= require jquery.liTranslit
#= require jquery.datetimepicker

$(document).ready ->
  $('#article_title').liTranslit
    elAlias: $('#article_title_translit')

  $('#content_page_name').liTranslit
    elAlias: $('#content_page_page_url')

  $('#article_published_at').datetimepicker()
