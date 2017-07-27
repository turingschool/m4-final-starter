$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
  $("body").on("click", ".mark-as-unread", markAsUnread)
  $(".link").each(makeButtons)
})

function markAsRead(e) {
  e.preventDefault();

  var $link = $(this).parents('.link');
  var linkId = $link.data('link-id');
  var url = $(this).parent().parent().siblings('.url').data()['url']

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatus)
    .fail(displayFailure);

  $.ajax({
    type: "POST",
    url:  'https://mighty-ocean-52812.herokuapp.com/api/v1/reads' ,
    data: {URL: url},
  })
}
function markAsUnread(e) {
  e.preventDefault();

  var $link = $(this).parents('.link');
  var linkId = $link.data('link-id');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: false },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  let $linkDiv = $(`.link[data-link-id=${link.id}]`)
  $linkDiv.find(".read-status").text(link.read)
  $linkDiv.each(makeButtons)
}

function makeButtons (index) {
  let linkStatus = $(this).find(".read-status").text()

  if (linkStatus == "true") {
    $(this).find('.read-status').append( "<button type='button' class='mark-as-unread'>Mark as Unread</button>")
  } else {
    $(this).find('.read-status').append( "<button type='button' class='mark-as-read'>Mark as Read</button>")
  }

}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
