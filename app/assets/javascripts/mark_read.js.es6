$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", true, markAsRead)
  $("body").on("click", ".mark-as-unread", false, markAsRead)
})

function markAsRead(e) {
  e.preventDefault();
  var status = e.data
  var $link = $(this).parents('.link');
  var linkId = $link.data('link-id');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: status },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  var linkDiv = $(`.link[data-link-id=${link.id}]`)
  linkDiv.find(".read-status").text(`Read?: ${link.read}`);
  if (link.read) {
    linkDiv.addClass('read-true').removeClass('read-false')
    markReadButton(linkDiv)
  } else {
    linkDiv.addClass('read-false').removeClass('read-true')
    markUnreadButton(linkDiv)
  }
}

function markUnreadButton(linkDiv){
  linkDiv.find('button').addClass('mark-as-read')
  .removeClass('mark-as-unread').text("Mark as Read")
}

function markReadButton(linkDiv){
  linkDiv.find('button').addClass('mark-as-unread')
  .removeClass('mark-as-read').text("Mark as Unread")
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
