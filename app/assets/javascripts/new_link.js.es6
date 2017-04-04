$(document).ready(function() {
  $('.new_link').on('submit', function(event) {
    event.preventDefault();

    var title = $("input[name='link[title]'").val()
    var url = $("input[name='link[url]'").val()
  })
})
