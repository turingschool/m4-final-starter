$(document).ready(function() {
  $('.link-container').on('click', '.show-read', function() {
    // event.preventDefault();
    var children = $(this).nextAll();
    children.each(function(index) {
      if ($(this).find('.link-read').text() == 'false') {
        $(this).hide();
      }
    });
    // debugger;
  });
  // debugger;

});

function clearFields() {
  $('.url-tag').val(null);
  $('.title-tag').val(null);
}
