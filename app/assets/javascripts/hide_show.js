$(document).ready(function() {
  $('.link-container').on('click', '.show-read', function() {
    var children = $(this).nextAll();
    children.each(function(index) {
      if ($(this).find('.link-read').text() == 'false') {
        $(this).hide();
      } else if ($(this).find('.link-read').text() == 'true') {
        $(this).show();
      }
    });
  });

  $('.link-container').on('click', '.show-unread', function() {
    var children = $(this).nextAll();
    children.each(function(index) {
      if ($(this).find('.link-read').text() == 'true') {
        $(this).hide();
      } else if ($(this).find('.link-read').text() == 'false') {
        $(this).show();
      }
    });
  });
});

function clearFields() {
  $('.url-tag').val(null);
  $('.title-tag').val(null);
}
