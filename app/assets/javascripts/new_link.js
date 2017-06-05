$( document ).ready(function(){
  $('#add-link-button').on("click", createLink)
})

function createLink(){
  var url = $('input[name=url]').val()
  var title = $('input[name=title]').val()
  console.log(url)
  console.log(title)
}
