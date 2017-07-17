$('#new-link-form').submit(function(e){
  e.preventDefault
  $('#ajax-errors').empty()
  url = $('#new-link-form #link_url').val()
  title = $('#new-link-form #link_title').val()
  $.ajax({
    type: "POST",
    url: '/api/v1/links',
    data: {url: url, title: title},
    success: function(data){
      if (data.errors) {
        $('#ajax-errors').append(data.errors)
      } else {
        $('.links-section').append(makeLink(data))
      }
    }
  })
  return false
})


function makeLink(data){
  return `<div class="link" data-link-id="${data.id}">
          <h3 class="title" data-title="${data.title}">Title: ${data.title}</h4><br>
          <h3 class="url" data-url="${data.url}">URL: <a href="${data.url}">${data.url}</a></h4><br>
          <h4>Read?: ${data.read}</h4><br>
          <button type="button" class="edit-button">edit</button>
          </div>`
}
