$(document).ready(function(){
  // filterUrl();
  onlyRead();
  // onlyUnread();
});

function onlyRead() {
  $('#only-read').on('click', function(event){
    $('.link').each(function (index, link){
      var cardValue = $(link).find('.read-status').text();
        if (cardValue.includes("Read: true")) {
          $(link).show();
        } else {
          $(link).hide();
        }
    });
  });
}
