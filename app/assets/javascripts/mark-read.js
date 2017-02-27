var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){
  $('#links-list').on('click', 'button.mark-read', markRead)
  $('#links-list').on('click', 'button.mark-unread', markUnread)
});

function markRead(event){
  event.preventDefault();

  var $link = $(this).parents('.link')
  var linkId = $link.data('id');

  $.ajax({
    url: '/api/v1/links/' + linkId,
    method: 'PATCH',
    data: {read: true}
  }).then( updateLink($link)
  )
}

function markUnread(event){
  event.preventDefault();

  var $link = $(this).parents('.link')
  var linkId = $link.data('id');

  $.ajax({
    url: '/api/v1/links/' + linkId,
    method: 'PATCH',
    data: {read: false}
  }).then( updateLink($link)
  )
}
//
// function updateLink(link) {
//   toggleButton(link)
//
// }
function updateLink(link) {
  var $button = link.find('button').first()
  var $status = link.find('.link-read')
  if (link.hasClass('unread')) {
    link.removeClass('unread')
    $button.removeClass('mark-read')

    link.addClass('read')
    $button.addClass('mark-unread')

    $status.text('true')
    $button.text('Mark as Unread')
  } else {
    link.removeClass('read')
    $button.removeClass('mark-unread')

    link.addClass('unread')
    $button.addClass('mark-read')

    $status.text('false')
    $button.text('Mark as Read')
  }
}
