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
  data.forEach(function (link) {
    console.log(link)
  let linkRow = `
  <div class="card card-default">
</div>`
})
}
function displayError(error){
  console.error(error);
}
