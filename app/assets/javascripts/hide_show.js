$(document).ready(function() {
  showRead();
  showUnread();
  showAll();
});

function showAll() {
  $('.show-all').on('click', function() {
    var children = $('.link-container').children();
    children.each(function() {
      $(this).show();
    });
  });
}

function showUnread() {
  $('.show-unread').on('click', function() {
    var children = $('.link-container').children();
    children.each(function() {
      if ($(this).find('.link-read').text() == 'true') {
        $(this).hide();
      } else if ($(this).find('.link-read').text() == 'false') {
        $(this).show();
      }
    });
  });

}
function showRead() {
  $('.show-read').on('click', function() {
    var children = $('.link-container').children();
    children.each(function() {
      if ($(this).find('.link-read').text() == 'false') {
        $(this).hide();
      } else if ($(this).find('.link-read').text() == 'true') {
        $(this).show();
      }
    });
  });
}
