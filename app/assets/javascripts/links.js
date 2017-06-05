$(document).ready(function(){
  fetchAllLinks();
});

function fetchAllLinks(){
  // debugger
  $.ajax({
    url: '/api/v1/links',
    method: 'GET'
}).then(alert(response))
}
