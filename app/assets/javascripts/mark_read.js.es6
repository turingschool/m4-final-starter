$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
})

function markAsRead(e) {
  e.preventDefault();
  // debugger
  var linkId = $(this).data('id');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  debugger
  $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
