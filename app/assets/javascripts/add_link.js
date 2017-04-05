$(document).ready(function() {
  $('.add-link').on('click', function() {
  event.preventDefault();
    var x = $(this).parents().data();
    var url = $('.url-tag').val();
    var title = $('.title-tag').val();
    var urlPath = "/api/v1/links/";
    var link = $('<li>').text( url + " " + title);
    $('.links').prepend(link);
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
