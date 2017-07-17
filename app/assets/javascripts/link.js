function searchLinks(a) {
  var filter = this.value.toUpperCase()
  var links = document.querySelectorAll('.link-url, .link-title')
  for(var i=0; i<links.length; i++){
    var linkName = links[i].innerHTML
    var matchedFilter = linkName.toUpperCase().indexOf(filter)  > -1
    links[i].parentElement.style.display = matchedFilter ? "" : "none"
  }
}

$(document).ready(function(){
  $('.search').on('keyup', searchLinks)
})
