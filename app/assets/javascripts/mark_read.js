$( document ).ready(function(){
  $("body").on("click", ".mark-read-btn", markAsRead)
})

function markAsRead(event) {
  var newReadStatus = false
  var $this = $(this).parent()

  if ($this.hasClass('link-unread')) {
    $this.removeClass('link-unread').addClass('link-read')
    $this.find('.mark-read-btn').text('Mark as Unread')
    newReadStatus = true
  } else {
    $this.removeClass('link-read').addClass('link-unread')
    $this.find('.mark-read-btn').text('Mark as Read')
    newReadStatus = false
  }
  $this.find('.link-box-read').text(newReadStatus)

  var formData = {
    title: $this.find('.link-box-title').text(),
    url: $this.find('.link-box-url').text(),
    id: $this.find('.link-box-id').text(),
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
  }).then()
    .fail();
}