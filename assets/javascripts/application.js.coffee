$ ->
  form = $('form#notepad_form')
  notepad = $('textarea#notepad')
  output = $('div#output')
  html_output = $('textarea#html-output')
  toggle_output = $('a#toggle-output')
  loading = $('div#loading')
  parser_select = $('select#parser')
  
  cached_input = notepad.val();
  show_html = false;
  
  # Process markdown
  process = ->
    return if notepad.val() == cached_input
    loading.show()
    pre_cache = notepad.val()
    $.post form.attr('action'), form.serialize(), (data, textStatus) ->
      output.html(data)
      html_output.val(data)
      loading.hide()
      cached_input = pre_cache
  
  # Parser change
  parser_change = ->
    # TODO: update default if it is still the default text
    cached_input = ''
    
    # Reprocess
    process()
  
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
  
  # Add event for parser change
  parser_select.change(parser_change)
  
  # Add event for toggle link
  toggle_output.click(toggle)
