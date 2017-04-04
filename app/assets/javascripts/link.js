$(document).ready(() => {
  bindCreateLinkeListenerToCreateLink();
})

function bindCreateLinkeListenerToCreateLink(){
  $(".add-link").on("click", function(){
    createLink();
  })
}

function createLink(){
  const link = {
    link: {
      title: $("#link_title").val(),
      url: $("#link_url").val()
    }
  };
  $.ajax({
    url: "/links",
    method: "POST",
    data: link
  })
  .done((newLink) => {
    $(".links").append(newLink);
    $("#link_title").val("");
    $("#link_title").val("");
  });
}