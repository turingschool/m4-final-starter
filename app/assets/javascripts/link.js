function searchLinks(a) {
  //a.preventDefault()

  var filter = this.value.toUpperCase()
  var links = document.getElementsByClassName('link-url')
  for(var i=0; i<links.length; i++){
    var linkName = links[i].innerHTML
    var matchedFilter = linkName.toUpperCase().indexOf(filter)  > -1
    links[i].parentElement.style.display = matchedFilter ? "" : "none"
    //debugger
  }
}

$(document).ready(function(){
  $('.search').on('keyup', searchLinks)
})
