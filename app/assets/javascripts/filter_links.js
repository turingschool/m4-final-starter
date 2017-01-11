$(document).ready(function(){
  $('#filters').on('click', 'button.filter#read', filterRead)
  $('#filters').on('click', 'button.filter#unread', filterUnread)
  $('#filters').on('click', 'button.search', searchLinks)
});

function filterRead(args){
  $('.link').each(function(){
    if ($(this).hasClass('read')){
      $(this).show()
    } else {
      $(this).hide()
    }
  })
}

function filterUnread(args){
  $('.link').each(function(){
    if ($(this).hasClass('unread')){
      $(this).show()
    } else {
      $(this).hide()
    }
  })
}

function searchLinks(args){
  var text_to_match = $('#search_text').val()
  $('.link').each(function(){
    var url = $(this).find('.link-url').text()
    var title = $(this).find('.link-title').text()
    if (url.includes(text_to_match) || title.includes(text_to_match) ){
      $(this).show()
    } else {
      $(this).hide()
    }
  })
}
