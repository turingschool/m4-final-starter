$( document ).ready(function(){
    $('input[name=filter-input]').on('keyup', filterLinks)
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
  })
}
