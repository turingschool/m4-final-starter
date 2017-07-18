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
  $('#link-input').on('keyup', filterLinks)
})

function getLinkFromForm() {
    const title = $('input[name="title"]').val()
    const url = $('input[name="url"]').val()

    return new Link ({
      title: title,
      url: url,
    })
}

function filterLinks() {
  const filter = this.value.toUpperCase()
  const links = document.getElementsByClassName('link')

  for(i = 0; i < links.length; i++) {
    const linkTitle = links[i].innerText.replace(/\s/g, ' ').split(' ')[2]
    const linkURL = links[i].innerText.replace(/\s/g, ' ').split(' ')[5]
    const match = linkTitle.toUpperCase().indexOf(filter) > -1  || linkURL.toUpperCase().indexOf(filter) > -1
    links[i].style.display = match ?  "" : "none"
  }
}
