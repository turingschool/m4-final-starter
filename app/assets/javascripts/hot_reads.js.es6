$( document ).ready(function(){
  getHotReads()
})

function isHotRead(reads){
  var urls = Object.keys(reads)
  var links = $('.link')
  links.each(function(index){
    var link = $('.link').eq(index)
    var baseUrl = link.children().first().next().text().split(':')
    var url = (baseUrl[1] + ':' + baseUrl[2]).trim()
    if (urls.includes(url)){
      $(link).children().first().html(`<h3>HOT READ!!<h3>`)
    }
  })
  isTopRead(reads)
}

function isTopRead(topReadUrl) {
  console.log(topReadUrl)
  var links = $('.link')
  links.each(function(index){
    var link = $('.link').eq(index)
    var baseUrl = link.children().first().next().text().split(':')
    var url = (baseUrl[1] + ':' + baseUrl[2]).trim()
    // console.log(topReadUrl, url)
    if (topReadUrl === url){
      $(link).children().first().html('')
      $(link).children().first().html(`<h3 id='top-read'>Top Read</h3>`)
    }
  })
}
function getHotReads(){
  $.ajax({
    type: "GET",
    url: "https://sheltered-cliffs-80557.herokuapp.com/api/v1/hot_reads/",
  }).then(function(data){
    isHotRead(data)
  })
    .fail(displayFailure);
}
