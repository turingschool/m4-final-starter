$( document ).ready(function(){
  $("body").on("click", "#show-read", showRead)
  $("body").on("click", "#show-unread", showUnread)
  $("body").on("click", "#show-all", showAll)
})


function showRead() {
  $('.read-true').show()
  $('.read-false').hide()
}

function showUnread() {
  $('.read-false').show()
  $('.read-true').hide()
}

function showAll() {
  $('.link').show()
}
