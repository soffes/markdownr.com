$(function() {
  
  var cached_input = "Welcome to [Markdownr.com](http://markdownr.com). We hope you *really* enjoy using this.\n\nJust type some [markdown](http://daringfireball.net/projects/markdown) on the left and see it on the right. **Simple as that.**";
  var show_html = false;
  
  var form = $('form#notepad_form');
  var notepad = $('textarea#notepad');
  var markdown_output = $('div#markdown-output');
  var html_output = $('textarea#html-output');
  var toggle_output = $('a#toggle-output');
  var loading = $('div#loading');
  
  // Process markdown
  var process = function() {
    if (notepad.val() == cached_input) {
      return;
    }
    loading.show();
    var pre_cache = notepad.val();
    $.post(form.attr('action'), form.serialize(), function(data, textStatus) {
      markdown_output.html(data);
      html_output.val(data);
      loading.fadeOut(100);
      cached_input = pre_cache;
    });
  };
  
  // Toggle output
  var toggle = function(e) {
    e.preventDefault();
    show_html = !show_html;
    
    if (show_html) {
      toggle_output.html('Hide HTML');
      markdown_output.hide();
      html_output.show();
    } else {
      toggle_output.html('Show HTML');
      markdown_output.show();
      html_output.hide();
    }
  };
  
  // Add event for keyup and focus
  notepad.keyup(process);
  notepad.focus();
  
  // Add event for toggle link
  toggle_output.click(toggle);
  
});
