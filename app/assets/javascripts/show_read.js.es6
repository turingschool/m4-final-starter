$(document).ready(function(){
  $('#show-read-filter').on('click', hideUnread)
})

function hideUnread() {
  $('.read-status').each(function(){
    status = $(this).text()
    if (status == 'false'){
      $(this).closest('.link').hide()
    }
  })
}
