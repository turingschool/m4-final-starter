$(document).ready(() => {
  new Links()
})

class Links {
  constructor() {
    $("body").on("click", "input[value='Mark as Read']", this.markAsRead.bind(this))
    $("body").on("click", "input[value='Mark as Unread']", this.markAsUnread.bind(this))
    $("#content-filter").on("keyup", this.contentFilter.bind(this))
    $("#show-unread").on("click", this.showRead.bind(this))
    $("#show-read").on("click", this.showUnread.bind(this))
  }

  markAsUnread(e) {
    e.preventDefault();

    const link = { link: { read: false } }

    this.updateReadStatus(link, linkId)
  }

  markAsRead(e) {
    e.preventDefault();

    const link = { link: { read: true } }

    this.updateReadStatus(link, linkId)
  }

  updateReadStatus(link, linkId) {
    $.ajax({
      type: "PATCH",
      url: "/api/v1/links/" + linkId,
      data: link,
    })
    .done(this.updateLinkStatus.bind(this))
    .fail(this.displayFailure);
  }

  updateLinkStatus(link) {
    const buttonSwitch = link.read ? "Mark as Unread" : "Mark as Read"
    const wrapper = $(`#link${link.id}`)
    link.read ? wrapper.addClass("unread") : wrapper.removeClass("read")
    wrapper.find('p').text(`Read? ${link.read}`)
    wrapper.find('.switch').val(buttonSwitch)
  }

  displayFailure(failureData){
    console.log("FAILED attempt to update Link: " + failureData.responseText);
  }

  contentFilter(e) {
		const search = $("#content-filter").val()

		$(".links article").hide()

		const matches = $(".links article").filter(article => {
			const title = $(".links article")[article].querySelector("h3").innerText.toLowerCase()
			const url = $(".links article")[article].querySelector("a").innerText.toLowerCase()
			return title.includes(search) || url.includes(search)
		})

		matches.show()
  }

  showRead(e) {
    const articles = $("article")
    articles.hide()
    articles.filter(".read").show()
  }

  showUnread(e) {
    const articles = $("article")
    articles.show()
    articles.filter(".read").hide()
  }
}
