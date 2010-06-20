$(function() {
  
  var form = $('form#notepad_form');
  var notepad = $('textarea#notepad');
  var output = $('div#output');
  var html_output = $('textarea#html-output');
  var toggle_output = $('a#toggle-output');
  var loading = $('div#loading');
  var parser_select = $('select#parser');
  
  var cached_input = notepad.val();
  var show_html = false;
  
  // Process markdown
  var process = function() {
    if (notepad.val() == cached_input) {
      return;
    }
    loading.show();
    var pre_cache = notepad.val();
    $.post(form.attr('action'), form.serialize(), function(data, textStatus) {
      output.html(data);
      html_output.val(data);
      loading.hide();
      cached_input = pre_cache;
    });
  };
  
  // Parser change
  var parser_change = function() {
    // TODO: update default if it is still the default text
    cached_input = '';
    
    // Reprocess
    process();
  };
  
  // Toggle output
  var toggle = function(e) {
    e.preventDefault();
    show_html = !show_html;
    
    if (show_html) {
      toggle_output.html('Hide HTML');
      output.hide();
      html_output.show();
    } else {
      toggle_output.html('Show HTML');
      output.show();
      html_output.hide();
    }
  };
  
  // Add event for keyup and focus
  notepad.keyup(process);
  notepad.focus();
  
  // Add event for parser change
  parser_select.change(parser_change);
  
  // Add event for toggle link
  toggle_output.click(toggle);
  
});
