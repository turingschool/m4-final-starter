$(document).ready(function() {
  $('.add-link').on('click', function() {
  event.preventDefault();
    var x = $(this).parents().data();
    var url = $('.url-tag').val();
    var title = $('.title-tag').val();
    var urlPath = "/api/v1/links/";
    $.ajax({
      type: "POST",
      url: urlPath,
      data: {
        title: title,
        url: url,
        read: false
      }
    });
  });
});
// $('input:submit').on('click', function() {
//   var title = $('.link-title').val();
//   var url = $('.link-url').val();
//   var link = $('<a>').attr('href', url).text(title);
//   $('.links').append(link);
// });
// function addLink(event) {
//   event.preventDefault();
//   console.log(event.parents);
//   $.ajax({
//       type: "CREATE",
//       url: "/links/" + linkId,
//       data: {
//         read: true
//       },
//     }).then(updateLinkStatus)
//     .fail(displayFailure);
// }

// function markAsRead(e) {
//   e.preventDefault();

//   var $link = $(this).parents('.link');
//   var linkId = $link.data('link-id');

//   $.ajax({
//       type: "PATCH",
//       url: "/api/v1/links/" + linkId,
//       data: {
//         read: true
//       },
//     }).then(updateLinkStatus)
//     .fail(displayFailure);
// }

// function updateLinkStatus(link) {
//   $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);
// }

// function displayFailure(failureData) {
//   console.log("FAILED attempt to update Link: " + failureData.responseText);
// }
