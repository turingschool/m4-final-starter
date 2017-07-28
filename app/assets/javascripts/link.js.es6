function Link(link) {
  this.id = link.id
  this.title = link.title
  this.url = link.url
  this.read = false

  Link.prototype.createLink = function() {
        $.ajax({
          type: "POST",
          url: `/api/v1/links`,
          dataType: "json",
          data: { link: {
                  title: this.title,
                  url: this.url,
              }
          },
          success: function(linkObject) {
            const link = new Link(linkObject)
            link.appendLinkToPage()
                $('input[name="title"]').val("")
                $('input[name="url"]').val("")
                $('.link_form').before('<span class="error">Link successfully created</span>')

          },
          error: function (request, status, error) {
              if (status === 'error') {
                $('.error').remove()
                $('.link_form').before('<span class="error">URL is invalid</span>')
              }
          }
        })
  }

  Link.prototype.appendLinkToPage = function() {
    $('.links').append(
      `<div class="link" data-id="${this.id}">
      <fieldset>
      <p>Title: ${this.title}</p>
      <p>URL:<a href="${this.url}"> ${this.url}</a></p>
      <p class="read-status" data-link-id="${this.id}">Read?: ${this.read}</p>
      <input type="button" class="mark-as-read" data-id="${this.id}" value="Mark as Read">
      <a href="/links/${this.id}/edit" class="button">Edit</a>
    </fieldset>`
  )}

}
