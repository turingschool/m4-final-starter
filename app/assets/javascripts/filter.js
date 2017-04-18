$(document).ready(function(){
  $('body').on('change paste keyup', '#filter-text', filterLink)
  $('body').on('click', '#filter-read-only', filterReadOnlyLinks)
  $('body').on('click', '#filter-unread-only', filterUnreadOnlyLinks)
})

function filterLink(){
  showAllLinks()
  $('div.link-box').not(".link-box:contains('" + $('#filter-text').val() + "')").hide()
}

function filterReadOnlyLinks(){
  showAllLinks()
  $('.link-box.link-unread').hide()
}

function filterUnreadOnlyLinks(){
  showAllLinks()
  $('.link-box.link-read').hide()
}

function showAllLinks(){
  $('div.link-box').show()
}