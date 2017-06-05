$(document).ready(function(){
  $('#create-link').on('click', createLink)

  function createLink(e) {
    e.preventDefault();
    let link = formatLink();
    addLink(link);
  }

  function formatLink() {
    return {
      link: {
        url: $('#url').val(),
        title: $('#title').val()
      }
    }
  }

  function addLink(link) {
    $.ajax({
      type: "POST",
      url: "/api/v1/links"
      data: link
    }).done((response) => {
      $('#links-list').prepend(response)
    }).fail(error => console.log(error))
  }
});
