$(document).ready(function() {
  $('.link-container').on('click', '.show-read', function() {
    var children = $(this).nextAll();
    children.each(function() {
      if ($(this).find('.link-read').text() == 'false') {
        $(this).hide();
      } else if ($(this).find('.link-read').text() == 'true') {
        $(this).show();
      }
    });
  });

  $('.link-container').on('click', '.show-unread', function() {
    var children = $(this).nextAll();
    children.each(function() {
      if ($(this).find('.link-read').text() == 'true') {
        $(this).hide();
      } else if ($(this).find('.link-read').text() == 'false') {
        $(this).show();
      }
    });
  });

  $('.link-container').on('click', '.show-all', function() {
    var children = $(this).nextAll();
    children.each(function() {
        $(this).show();
      });
  });
});

function clearFields() {
}
