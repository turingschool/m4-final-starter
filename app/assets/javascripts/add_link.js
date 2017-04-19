$(document).ready(function() {
  $('.add-link').on('click', function() {
    event.preventDefault();
    var url = $('.url-tag').val();
    var title = $('.title-tag').val();
    var urlPath = "/api/v1/links/";
    var validUrl = /^[https]+:\/\//i.test(url);
    if (validUrl) {
      $.ajax({
        type: "POST",
        url: urlPath,
        data: {
          title: title,
          url: url,
          read: false
        }
      }).done(function(response) {
        console.log(response);
        $('.link-container').prepend("<div class= 'card'>" +
          "<div class= 'container'>" + "<br> Title: " +
          response.title + "</br>" + "<br> URL: " + response.url + "</br>" +
          "<br> Read?: false" + "</br>" + "<button class = 'flag-link' > Flag link </button>" + "</div>" + "</div>");
        // prependData(response.url, response.title);
        clearFields();
      });
    } else {
      return alert("You must enter a valid url.");
    }
  });
});

function prependData(url, title) {}

function clearFields() {
  $('.url-tag').val(null);
  $('.title-tag').val(null);
}
