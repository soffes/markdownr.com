$(function() {
  const form = $('form#notepad_form');
  const notepad = $('textarea#notepad');
  const output = $('div#output');
  const html_output = $('textarea#html-output');
  const toggle_output = $('a#toggle-output');
  const loading = $('div#loading');

  let last_markdown = notepad.val();
  let show_html = false;

  const process = function() {
    const markdown = notepad.val();
    if (markdown === last_markdown) {
      return;
    }

    loading.show();
    return jQuery.ajax({
      url: form.attr('action'),
      data: markdown,
      type: 'POST',
      headers: {
        'Content-Type': 'text/x-markdown',
        'Accept': 'text/html'
      },
      dataType: 'html'
    }).done(function(data) {
      output.html(data);
      html_output.val(data);
      loading.hide();
      return last_markdown = markdown;
    });
  };

  // Toggle output
  const toggle = function(event) {
    event.preventDefault();
    show_html = !show_html;

    if (show_html) {
      toggle_output.html('Hide HTML');
      output.hide();
      return html_output.show();
    } else {
      toggle_output.html('Show HTML');
      output.show();
      return html_output.hide();
    }
  };

  // Add event for keyup and focus
  notepad.keyup(process);
  notepad.focus();

  // Add event for toggle link
  return toggle_output.click(toggle);
});
