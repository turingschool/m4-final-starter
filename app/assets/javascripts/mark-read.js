var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var $link = $this.parents('.link')
    var linkId = $link.data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    }).then( toggleRead
    ).fail();
  })
})

function toggleRead() {
  debugger;
  if (this.hasClass('mark-read')) {
    this.removeClass('mark-read')
    this.addClass('mark-unread')
  } else {
    this.removeClass('mark-unread')
    this.addClass('mark-read')
  }
}
