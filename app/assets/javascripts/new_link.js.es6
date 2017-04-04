$(document).ready(function() {
  $('.new_link').on('submit', function(event) {
    event.preventDefault();

    var title = $("input[name='link[title]'").val()
    var url = $("input[name='link[url]'").val()

    var linkData = {
      link: {
        title: title,
        url: url
      }
    }

    $.ajax({
      type: "POST",
      url: 'links/',
      data: linkData
    }).done(function(linkMarkup) {
      $('table tbody').prepend(linkMarkup)
    })
  })
})
