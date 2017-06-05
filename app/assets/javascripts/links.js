$(document).ready(function(){
  fetchAllLinks();
});

function fetchAllLinks(){
  $.ajax({
    url: '/api/v1/links',
    method: 'GET'
}).then(printLinks)
  .fail(displayError);
}

function printLinks(data) {
  debugger  
}
function displayError(){
  console.error(error);
}
