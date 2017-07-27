$(document).ready(function (){
  $('.link').each(function (){
    let url = $(this).children('h3.url').data()['url']
    let $link = $(this)
    $.ajax({
      type: "GET",
      url: "https://mighty-ocean-52812.herokuapp.com/api/v1/reads",
      data: { URL: url },
      success: function (data){

        $link.append(data['status'])
      }
    })
  })
})
