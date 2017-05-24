$(document).ready(function() {
  searchFilter();
});

function searchFilter() {
  $('#search').keyup(function() {
    $('.link-container').children('.card').filter(function(){
      var searchValue = $('#search').val();
      var linkText = $(this).find('.link-title').text();
      var url = $(this).find('.link-url').text();
      if (linkText.indexOf(searchValue) >= 0 || url.indexOf(searchValue) >= 0) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });
  });
}
