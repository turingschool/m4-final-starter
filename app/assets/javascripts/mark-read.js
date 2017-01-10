var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-read', toggleRead)

  function toggleRead(event){
    event.PreventDefault();

    var $this = $(this);
    var $link = $this.parents('.link')
    var linkId = $link.data('id');
debugger 
    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    }).then( updateLink
    ).fail();
  })
})

function updateLink() {
  toggleClass()
  changeCallback()
  toggleText()
}
function toggleClass() {
  debugger;
  if (this.hasClass('mark-read')) {
    this.removeClass('mark-read')
    this.addClass('mark-unread')
  } else {
    this.removeClass('mark-unread')
    this.addClass('mark-read')
  }
}
