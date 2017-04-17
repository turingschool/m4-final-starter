$(document).ready(function() {
  bindFilterByTestListenerToFilterByText()
})

function bindFilterByTestListenerToFilterByText() {
  $(".filter-by-text").on("keyup", function(event){
    const links = $(".link")
    const text = $(this).val()
    for(let i = 0; i < links.length; i++){
      filterByText(links[i], text)
    }
  })
}

function filterByText(link, text){
  let title = $(link).children()[0].innerText.split(' ')[1]
  let url = $(link).children()[1].innerText.split(' ')[1]
  if (title.includes(text) || url.includes(text)) $(link).removeClass("hidden");
  else $(link).addClass("hidden");
}