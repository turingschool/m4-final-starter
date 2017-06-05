$(document).ready(function() {
  addLink();
});


function addLink() {
  $('#new-link').on('click', "#create-link", (event) => saveLink())
}
