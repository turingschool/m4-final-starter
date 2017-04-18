$( document ).ready(function(){
  $("body").on("click", ".mark-read-btn", markAsRead)
})

function markAsRead(event) {
  // e.preventDefault();
  var newReadStatus = false

  if ($(this).parent().hasClass('link-unread')) {
    $(this).parent().removeClass('link-unread').addClass('link-read')
    $(this).parent().find('.mark-read-btn').text('Mark as Unread')
    newReadStatus = true
  } else {
    $(this).parent().removeClass('link-read').addClass('link-unread')
    $(this).parent().find('.mark-read-btn').text('Mark as Read')
    newReadStatus = false
  }
  $(this).parent().find('.link-box-read').text(newReadStatus)

  var formData = {
    title: $(this).parent().find('.link-box-title').text(),
    url: $(this).parent().find('.link-box-url').text(),
    id: $(this).parent().find('.link-box-id').text(),
    read: newReadStatus
  }
  var updatePath = "/updatelink/" + formData.id

  $.ajax({
    type: "PUT",
    url: updatePath,
    data: {
      title: formData.title,
      url: formData.url,
      id: formData.id,
      read: formData.read
    },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
