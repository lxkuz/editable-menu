
$(document).ajaxComplete (event, xhr, settings) ->
  data = $.parseJSON(xhr.responseText);
  if data.notice?
    new PNotify({
      title: 'Сохранено',
      text: data.notice,
      type: 'notice',
      delay: 500
    });
  if data.error?
    new PNotify({
      title: 'Ошибка',
      text: data.error,
      type: 'error',
      delay: 500
    });

