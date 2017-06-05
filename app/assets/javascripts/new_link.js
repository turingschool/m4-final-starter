$( document ).ready(function(){
  $('#add-link-button').on("click", createLink)
})

function createLink(){
  var url = $('input[name=url]').val()
  var title = $('input[name=title]').val()
  $.post("/api/v1/links", {link: {url: url, title: title}}).then((data) =>{
    console.log(data)
  })

}
