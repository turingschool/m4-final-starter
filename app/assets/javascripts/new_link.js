$(document).ready(function(){
  $('.new-link').submit(handleNewLink)
});

function handleNewLink () {
  event.preventDefault();
  let form = new Object
  form['url']   = $("input[id=link_url]").val();
  form['title'] = $("input[id=link_title]").val();
  addNewLink(form)
  $.ajax({
    url: "http://localhost:3000/api/v1/links",
    method: "POST",
    data: form
  })
  .then(function(data){
    console.log(data)
    debugger
  })
  .fail( (error) => {
    console.error(error)
  });
};

function addNewLink(form) {
  
};
