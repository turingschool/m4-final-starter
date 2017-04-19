$(document).ready(function() {
  $('.flag-link').on('click', markLink );
});

function markLink(event) {
  var updateRead = false;
  var linkData = $(this).parent();
  var id = linkData.find('.link-id').text();
  var URL = "/api/v1/links/" + id;
  var linkURL = linkData.find('.link-url').text();

  if (linkData.find('.link-read').text() == 'true') {
    linkData.find('.link-read').text('false');
    linkData.parent().css('background-color', 'White' );
    updateRead = false;
  } else {
    linkData.find('.link-read').text('true');
    linkData.parent().css('background-color', 'SlateGray' );
    updateRead = true;
    // thing(linkURL);
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

  $.ajax({
      method: "POST",
      url: "https://hot-reads-smith.herokuapp.com/read",
      // url: "https://localhost:5000/read",
      data: {
        url: linkURL
      },
    }).then()
    .fail();
  linkData.find('.link-read').text(updateRead);
}
