$(document).ready(function(){
  $('body').on('change paste keyup', '#filter-text', filterLink)
})

function filterLink(){
  $('div.link-box').show()
  $('div.link-box').not(".link-box:contains('" + $('#filter-text').val() + "')").hide()
}