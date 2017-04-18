$(document).ready(function() {
  $("body").on("click", ".flag-link", markLink);
});

function markLink(event) {
  var updateRead = false;
  var linkData = $(this).parent();
  var id = linkData.find('.link-id').text();
  var URL = "/api/v1/links/" + id;

  if (linkData.find('.link-read').text() == 'true') {
    linkData.find('.link-read').text('false');
    linkData.parent().css('background-color', 'White' );
    updateRead = false;
  } else {
    linkData.find('.link-read').text('true');
    linkData.parent().css('background-color', 'SlateGray' );
    updateRead = true;
  }

  $.ajax({
      method: "PATCH",
      url: URL,
      data: {
        id: id,
        read: updateRead
      },
    }).then()
    .fail();
  linkData.find('.link-read').text(updateRead);
}
