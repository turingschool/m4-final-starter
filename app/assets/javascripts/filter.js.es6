$(document).ready(function(){
  $('#show-read-filter').on('click',function (){
      filter('true')
  })
  $('#show-unread-filter').on('click',function (){
      filter('false')
  })
  $('input#filter').on('input', function(){
    let query = $(this).val()
    filter(query)
  })
})

function filter(term) {
  $('.link').each(function(){
    $(this).show()
    let text = $(this).text()
    if (!text.includes(term)){
      $(this).closest('.link').hide()
    }
  })
}
