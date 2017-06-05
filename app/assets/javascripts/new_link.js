$( document ).ready(function(){
  $('#add-link-button').on("click", createLink)
})

function createLink(){
  var url = $('input[name=url]').val()
  var title = $('input[name=title]').val()
  $.post("/api/v1/links", {link: {url: url, title: title}}).then((data) =>{
    if( data.url){
      displayLink(data)
    }
  })
}

function displayLink(link){
  $('#links').prepend(`<div class='link'> <a href=${link.url}><h4>${link.url}</h4>
                      </a><h4>${link.title}</h4>
                      <form class='button_to' method='get' action="/links/${link.id}/edit">
                      <input type="submit" value="Edit ${link.title}">
                      </form>`)
}
