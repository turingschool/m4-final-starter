$('.links-section').on('click', '.edit-button', function(){
  let id = $(this).parent().data('linkId')
  let title = $(this).siblings('h3.title').data('title')
  let url = $(this).siblings('h3.url').data('url')
  parent = $(this).parent()
  $(this).parent().append(saveButton)
  addEditForm(url, title, parent)
})


function saveButton(){
  return `<button type="button" class="save-button">save</button>`
}

function addEditForm(url, title, parent){
  $(parent).children('h3.title').remove()
  $(parent).children('h3.url').remove()
  $(parent).children('button.edit-button').remove()
  $(parent).prepend(
    `URL: <input type="text" name="URL" id="link_url" value="${url}" /><br>
    Title: <input type="text" name="Title" value="${title}" id="link_title" /><br>`
  )
}

$('.links-section').on('click', '.save-button', function (e){
  let  id = $(this).parent().data('linkId')
  let title = $(this).siblings("input[name='Title']").val()
  let url = $(this).siblings("input[name='URL']").val()
  $.ajax({
   type: "PUT",
   url: '/api/v1/links/' + id,
   data: {url: url, title: title},
   success: function(data){
     if (data.errors) {
       $('#ajax-errors').append(data.errors)
     } else {
       location.reload()
     }
   }
  })
})
