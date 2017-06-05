$( document ).ready(function(){
    $('input[name=filter-input]').on('keyup', filterLinks)
    $('#hide-unread-links-button').on('click', hideUnreadLinks)
})

function filterLinks(){
  links = $('.link')
  links.each(function(index){
    var link = $('.link').eq(index)
    var url = link.children().first().text().toLowerCase()
    var title = link.children().first().next().text().toLowerCase()
    var queryString = $('input[name=filter-input]').val().toLowerCase()
    if (!url.includes(queryString) || !title.includes(queryString)){
      link.hide()
    }
    else{
      link.show()
    }
  })
}

function hideUnreadLinks(){
  var links = $('.link.unread')
  links.each(function(index){
    $('.link.unread').eq(index).hide()
  })
}
