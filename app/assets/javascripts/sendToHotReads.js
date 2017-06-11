$(document).ready(function(){
  $("body").on("click", ".hot-read", sendToHotReads);
});

function sendToHotReads(e) {
  e.preventDefault();

  var hot = { link: { url: $(this).data('url') } };

  $.ajax({
    // url: 'https://frozen-mesa-43893.herokuapp.com/api/v1/links'
    url: 'http://localhost:3001/api/v1/links',
    method: 'POST',
    data: hot
  }).then((data))
    .fail((error) => {
    console.log(error);
  });
}
