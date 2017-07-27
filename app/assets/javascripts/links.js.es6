$( document ).ready(function(){
  $("body").on("click", ".add-link", postLink)
})

function postLink(e) {
  e.preventDefault();

  let url = $('#link_url').val()
  let title = $('#link_title').val()

  $.ajax({
    type: "POST",
    url: "links/",
    data: {link: {title: title, url: url} }
  }).then(prependLink)
    .fail(function(data) {  $('.errors').text(data.responseText.replace('[', '').replace(']', '')   )})
}

function prependLink(data) {
  $('.links').prepend(
    `
    <div class="link read-false" data-link-id=${data['id']}>
    <ul>
    <li class="url">URL: <a href="${data['url']}">${data['url']}</a></li>
    <li class="title">Title: ${data['title']}</li>
    <li class="read-status">Read?: false</li>
    <form class="button_to" method="get" action="/links/${data['id']}/edit"><input type="submit" value="Edit"></form>
    <button class="mark-as-read">Mark as Read</button>
  </ul>
  </div>
    `)
  clearInputs()
}

function clearInputs() {
  $('#link_url').val('')
  $('#link_title').val('')
}

//
// function updateLinkStatus(link) {
//   $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);
// }
//
// function displayFailure(failureData){
//   alert(failureData)
//
//   $('body').prepend(failureData.responseText)
//   console.log("FAILED attempt to post Link: " + failureData.responseText);
//
// }
