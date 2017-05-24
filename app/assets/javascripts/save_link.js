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
    submitNewLink(formData)
  } else {
    updateLink(formData)
  }
}

function clearLinkForm() {
  $('#link_title').val('')
  $('#link_url').val('')
  $('#link_id').val('')
}

function submitNewLink(formData) {
  $.ajax({
    type: "POST",
    url: "/links",
    data: formData
  }).then(function(response){
    $('.link-list').prepend(response)
    $('.flash-messages').html('Link successfully saved')
    clearLinkForm()
  }).fail(function(error){
    window.location = '/links'
  });
}

function updateLink(formData) {
  var updatePath = "/links/" + formData.id
  $.ajax({
    type: "PUT",
    url: updatePath,
    data: formData
  }).done(function(response){
    window.location = '/links'
  }).fail(function(error){
    console.log(error)
  })
}