// $(document).ready(function(){
//   findHotUrls();
// });
//
// function findHotUrls(){
//   $.ajax({
//     // url: 'https://frozen-mesa-43893.herokuapp.com/api/v1/links'
//     url: 'http://localhost:3001/api/v1/links',
//     method: 'GET'
//   }).then((data) => addHotLinks(data))
//     .fail(displayError);
// }
//
// function addHotLinks(data){
//   var onlyUrls = getUrls(data);
//   debugger
//   $('.link').each(function(index, link){
//     console.log($(link))
//
//   })
// }
//
// function getUrls(data) {
//   var urls = []
//   data.forEach(function (link){
//     urls.push(link.url)
//   });
//   return urls
// }
//
// function displayError(error){
//   console.error(error);
// }
