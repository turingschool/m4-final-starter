$(document).ready(function(){
  $('.submit_link').on('click', function(event) {
    event.preventDefault()
    const newLink = getLinkFromForm()
    if (!newLink.title && !newLink.url) {
      $('.error').remove()
      $('.link_form').before('<span class="error">Please enter a title and url</span>')
    }
    else if (!newLink.title) {
      $('.error').remove()
      $('.link_form').before('<span class="error">Please enter a title</span>')
    }
    else if (!newLink.url) {
      $('.error').remove()
      $('.link_form').before('<span class="error">Please enter a url</span>')
    }
    if (newLink.title && newLink.url) {
      newLink.createLink()
    }
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
