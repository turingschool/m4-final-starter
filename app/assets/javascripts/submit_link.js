$('#new-link-form').submit(function(e){
  e.preventDefault
  url = $('#new-link-form #link_url').val()
  title = $('#new-link-form #link_title').val()
  $.ajax({
    type: "POST",
    url: '/api/v1/links',
    data: {url: url, title: title},
    success: function(data){
      if (data.errors) {
        $('body').prepend(data.errors)
      } else {
        $('.links-section').append(makeLink(data))
      }
    }
  })
  return false
})


function makeLink(data){
  return `<div class="link" id="${data.id}">
            <h4>Title: ${data.title}</h4><br>
            <h4>URL: <a href="${data.url}"></a>${data.url}</h4><br>
            <h4>Read?: ${data.read}</h4><br>
          </div>`
}
