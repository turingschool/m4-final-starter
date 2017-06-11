$(document).ready(function(){
  findHotUrls();
});

function findHotUrls(){
  $.ajax({
    // url: 'https://frozen-mesa-43893.herokuapp.com/api/v1/links'
    url: 'http://localhost:3001/api/v1/links',
    method: 'GET'
  }).then(addHotLinks)
    .fail(displayError);
}

function addHotLinks(data){
  debugger
  var onlyUrls = getUrls(data);
  console.log(data)
}

function onlyUrls(data) {
  var urls = []
  data.forEach(function (link){
    urls.push(link.url)
  });
}

function displayError(error){
  console.error(error);
}
