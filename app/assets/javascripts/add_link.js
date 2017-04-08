$(document).ready(function() {
  $('.add-link').on('click', function() {
    event.preventDefault();
    var url = $('.url-tag').val();
    var title = $('.title-tag').val();
    var urlPath = "/api/v1/links/";
    var validUrl = /^[a-z]+:\/\//i.test(url);
    if (validUrl) {
      $.ajax({
        type: "POST",
        url: urlPath,
        data: {
          title: title,
          url: url,
          read: false
        }
      });
    } else {
      return alert("You must enter a valid url.");
    }
    prependData(url, title);
    clearFields();
  });
});

function prependData(url, title) {
  $('.links').prepend("<div class= 'card'>" +
    "<div class= 'container'>" + "<br> Title: " +
    title + "</br>" + "<br> URL: " + url + "</br>" +
    "<br> Read?: false" + "</br>" + "</div>" + "</div>");
}

function clearFields() {
    $('.url-tag').val(null);
    $('.title-tag').val(null);
}
