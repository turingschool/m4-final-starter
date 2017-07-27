$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
})

function markAsRead(e) {
  e.preventDefault();
  var $link = $(this).parents('.link');
  var linkId = this.dataset.id
  var readStatus = $(`.link p[data-link-id=${linkId}]`)[0].innerHTML.split(' ')[1]
  if (readStatus === "true") {
    readStatus = false
  }
  else if (readStatus === "false") {
    readStatus = true
  }

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: {
            link:
              { read: readStatus },
          }
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  var status = $(`.link p[data-link-id=${link.id}]`)
  var button = $(`.link[data-id=${link.id}] input[type=button]`)
  var linkDiv = $(`.link[data-id=${link.id}]`)
  if (button.prop('value') === 'Mark as Read') {
    status.text('Read?: true')
    button.prop('value', 'Mark as Unread')
    linkDiv.addClass('read')
  }
  else if (button.prop('value') === 'Mark as Unread') {
    status.text('Read?: false')
    button.prop('value', 'Mark as Read')
    linkDiv.removeClass('read')
  }
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
