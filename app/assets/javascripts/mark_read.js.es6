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
  $(`.link[data-link-id=${link.id}]`).find(".read-status").text(`Read?: ${link.read}`);
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
