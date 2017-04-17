$(document).ready(function(){
  $('body').on('click', '.save-link-btn', saveLink)
})

function saveLink(event) {
  event.preventDefault()
  var formData = {
    title: $('#link_title').val(),
    url: $('#link_url').val(),
    id: $('#link_id').val()
  }

  if (formData.id == ""){
    $.ajax({
      type: "POST",
      url: "/links",
      data: formData,
    }).then(function(response){
      $('.link-list').prepend(response)
      clearLinkForm()
    }).fail(function(error){
      console.log(error)
    });
  } else {
    console.log('this is to update a link...')
  }
}

function clearLinkForm() {
  $('#link_title').val('')
  $('#link_url').val('')
  $('#link_id').val('')
}