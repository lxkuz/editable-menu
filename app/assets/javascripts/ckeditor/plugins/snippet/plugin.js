CKEDITOR.plugins.add('snippet', {
  icons: 'snippet',

  init: function(editor) {
    editor.addCommand('snippet', new CKEDITOR.dialogCommand('snippetDialog'));
    editor.ui.addButton('Snippet', {
      label: 'Insert HTML snippet',
      command: 'snippet'
    });

    CKEDITOR.dialog.add( 'snippetDialog', this.path + 'dialogs/snippet.js' );
  }
});
