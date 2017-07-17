$(document).ready(function(){
  $('.submit_link').on('click', function(event) {
    event.preventDefault()
    const newLink = getLinkFromForm()
    newLink.createLink()
  })
})

function getLinkFromForm() {
    const title = $('input[name="title"]').val()
    const url = $('input[name="url"]').val()


    return new Link ({
      title: title,
      url: url,
    })
  }
