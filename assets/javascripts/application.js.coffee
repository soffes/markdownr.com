$ ->
  form = $('form#notepad_form')
  notepad = $('textarea#notepad')
  output = $('div#output')
  html_output = $('textarea#html-output')
  toggle_output = $('a#toggle-output')
  loading = $('div#loading')

  last_markdown = notepad.val();
  show_html = false;

  # Process markdown
  process = ->
    markdown = notepad.val()
    return if markdown == last_markdown
    loading.show()
    jQuery.ajax(
      url: form.attr('action')
      data: markdown
      type: 'POST'
      headers:
        'Content-Type': 'text/x-markdown'
        'Accept': 'text/html'
      dataType: 'html'
    ).done (data) ->
      output.html(data)
      html_output.val(data)
      loading.hide()
      last_markdown = markdown

  # Toggle output
  toggle = (e) ->
    e.preventDefault()
    show_html = !show_html

    if show_html
      toggle_output.html('Hide HTML')
      output.hide()
      html_output.show()
    else
      toggle_output.html('Show HTML')
      output.show()
      html_output.hide()

  # Add event for keyup and focus
  notepad.keyup(process)
  notepad.focus()

  # Add event for toggle link
  toggle_output.click(toggle)
