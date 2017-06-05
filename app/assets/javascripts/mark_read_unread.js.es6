$( document ).ready(function(){
    $('.change-read-button').on('click', changeReadStatus)
})

function changeReadStatus() {
  var id = this.getAttribute('data-id')
  var readStatus = this.getAttribute('data-read-status')
  console.log(typeof readStatus)
  if (readStatus === 'false'){
    var updateStatus = true
    markRead(id)
  }
  else {
    var updateStatus = false
    markUnread(id)
  }
  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + id,
    data: {link: { read: updateStatus }},
  }).then()
    .fail(displayFailure);
}

function markRead(id) {
  var button = $(`.change-read-button[data-id=${id}]`)
  var parent = $(`.change-read-button[data-id=${id}]`).parent('.link')
  parent.addClass('read')
  button.text('Mark as Unread')
  button.attr('data-read-status', 'true')
  button.prev().prev().text('Read: true')
}

function markUnread(id) {
  var button = $(`.change-read-button[data-id=${id}]`)
  var parent = $(`.change-read-button[data-id=${id}]`).parent('.link')
  parent.removeClass('read')
  button.text('Mark as Read')
  button.attr('data-read-status', 'false')
  button.prev().prev().text('Read: false')
}

function readOrUnread(id){
  var data = $(`.change-read-button[data-id=${id}]`).data().readStatus
  console.log(data)
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
