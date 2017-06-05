$( document ).ready(function(){
    $('input[name=filter-input]').on('keypress', filterLinks)
})

function filterLinks(){
  links = $('.link')
  links.each(function(index){
    var link = $('.link').eq(index)
    var url = link.children().first().text().toLowerCase()
    var title = link.children().first().next().text().toLowerCase()
    console.log(url, title)
  })
}
