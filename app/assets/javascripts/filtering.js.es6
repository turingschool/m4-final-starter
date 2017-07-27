$( document ).ready(function(){
  $("body").on("click", "#show-read", showRead)
  $("body").on("click", "#show-unread", showUnread)
  $("body").on("click", "#show-all", showAll)
})


function showRead() {
  $('.read-true').show()
  $('.read-false').hide()
}

function showUnread() {
  $('.read-false').show()
  $('.read-true').hide()
}

function showAll() {
  $('.link').show()
}

function searchFilter() {
  let input = event.target.value.toLowerCase()

  let titles = document.querySelectorAll(".title")
  let urls = document.querySelectorAll(".url")
  for (let i = 0; i < titles.length; i++) {
    let title = titles[i].innerHTML.toLowerCase()
    let url = urls[i].innerHTML.toLowerCase()

    if ((title.indexOf(input) > -1) || (url.indexOf(input) > -1) ) {
      titles[i].parentElement.parentElement.style.display = "";
    } else {
      titles[i].parentElement.parentElement.style.display = "none";
    }
  }
}
