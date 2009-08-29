$(function() {
  $('form#notepad_form').submit(function(e) {
    e.preventDefault();
    $.getJSON(this.action, $(this).serialize(), function(data, textStatus) {
      $('div#output').html(data.html);
    });
  });
});
