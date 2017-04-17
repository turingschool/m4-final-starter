$(document).ready(function(){
  $('body').on('click', '.link-edit-btn', editLink)
})

function editLink(event) {
  $('#link_title').val($(this).siblings('p').children('.link-box-title').text())
  $('#link_url').val($(this).siblings('p').children('.link-box-url').text())
  $('#link_id').val($(this).siblings('p').children('.link-box-id').text())
}