$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)

  $.ajax({
    type: "GET",
    url: 'https://hot-reads-bs.herokuapp.com/api/v1/links',
  }).then(updateHotReads)
    .fail(displayFailure);
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
    url: '/api/v1/links/'+ linkId,
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
    postHotReads(link)
  }
  else if (button.prop('value') === 'Mark as Unread') {
    status.text('Read?: false')
    button.prop('value', 'Mark as Read')
    linkDiv.removeClass('read')
  }
}

function postHotReads(link) {
  $.ajax({
    method: 'POST',
    url: 'https://hot-reads-bs.herokuapp.com/api/v1/links',
    data: {
            link:
              { url: link.url }
          }
  }).done(updateHotReads)
  .fail(displayFailure);
}

function updateHotReads(data) {
  var urls = data.map(function (linkObject) {
    return linkObject.url.toLowerCase()
  })
  $('.link').each(function(index, link) {
    var linkUrl = $(link).find('a')[0].text.toLowerCase()
    if (urls.includes(linkUrl)) {
      $(link).find('.hot').remove()
      $(link).find('.link-title').prepend('<h3 class="hot">Hot!</h3>')
    }
    if (urls[0] === linkUrl) {
      $(link).find('.hot').remove()
      $(link).find('.top-link').remove()
      $(link).find('.link-title').prepend('<h3 class="top-link">¡Top Link!</h3>')
    }
  })
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
