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
  // debugger
  data.forEach(function (link) {
  let linkRow = `
  <div class="card card-default">
    <div class="col-md-3">
    <div>
    <p>Title: ${link.title}</p><br>
    <p>${link.url}</p><br>
    <p>Read: ${link.read}</p></br>
    <input type="submit" value="Edit" class="btn btn-default" />
  </div>
</div>
</div>`;
  $('#links-list .row').append(linkRow);
})
}
function displayError(error){
  console.error(error);
}
