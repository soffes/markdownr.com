$(function() {
  
  var form = $('form#notepad_form');
  var notepad = $('textarea#notepad');
  var output = $('div#output');
  var cached_input = '';
  var loading = $('div#loading')
  
  var process = function() {
    if (notepad.val() == cached_input) {
      return;
    }
    
    loading.show();
    
    $.get(form.attr('action'), form.serialize(), function(data, textStatus) {
      output.html(data);
      loading.fadeOut(100);
      cached_input = notepad.val();
    });
  };
  
  notepad.keyup(process);
  notepad.focus();
  
  process();
});
