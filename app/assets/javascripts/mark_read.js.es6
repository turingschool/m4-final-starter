$( document ).ready(function(){
    $('.change-read-button').on('click', markAsRead)
})

function markAsRead() {
  var id = this.getAttribute('data-id')
  var readStatus = this.getAttribute('data-read-status')
  if (readStatus === 'false'){
    markRead(id)
  }
  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + id,
    data: {link: { read: true }},
  }).then(markRead(id))
    .fail(displayFailure);
}

function markRead(id) {
  var button = $(`.change-read-button[data-id=${id}]`)
  var parent = $(`.change-read-button[data-id=${id}]`).parent('.link')
  parent.addClass('read')
  button.text('Mark as Unread')
  button.attr('data-read-status', 'true')
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
