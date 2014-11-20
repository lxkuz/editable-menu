jQuery.extend({
  getValues: function(url) {
    var items = [];

    $.ajax({
      url: url,
      type: 'get',
      dataType: 'json',
      async: false,
      success: function(data) {
        $.each(data, function(key, value) {
          items.push([value.name]);
        });
      }
    });

    return items;
  }
});

CKEDITOR.dialog.add('snippetDialog', function(editor) {
  var snippetsUrl = '/admin/snippets.json',
      items       = $.getValues(snippetsUrl);

  return {
    title: 'Select snippet to insert',
    minWidth: 400,
    minHeight: 100,
    contents: [
      {
        id: 'tab-basic',
        elements: [
          {
            type: 'select',
            id: 'snippet',
            items: items,
            default: items[0][0]
          }
        ]
      }
    ],

    onOk: function() {
      var name = this.getValueOf('tab-basic', 'snippet')

      $.ajax({
        url: snippetsUrl,
        type: 'get',
        dataType: 'json',
        async: false,
        success: function(data) {
          $.each(data, function(key, value) {
            if (value.name == name) {
              editor.insertHtml(value.text);
              return false;
            }
          });
        }
      });
    }
  };
});
