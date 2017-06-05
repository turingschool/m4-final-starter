$( document ).ready(function(){
  getHotReads()
})

function isHotRead(reads){
  console.log(reads)
}
function getHotReads(){
  $.ajax({
    type: "GET",
    url: "https://sheltered-cliffs-80557.herokuapp.com/api/v1/hot_reads/",
  }).then(function(data){
    isHotRead(data)
  })
    .fail(displayFailure);
}
