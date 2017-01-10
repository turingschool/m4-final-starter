function linkHTML(link) {

    return `<div class=col-md-4'
              <div class='link col-md-4' data-id='${link.id}' id="link-${link.id}">
                <div class='container'
                  <p class='link-title'>${ link.title }</p>
                  <p class='link-url'>${ link.url }</p>

                  <p class="link_read">
                    ${ link.read }
                  </p>
                  <p class="link_buttons">
                    <button class="mark-read">Mark as Read</button>
                    <button class='edit-link'><a href='/links/${link.id}/edit'>Edit</a></button>
                    <button class='delete-link'>Delete</button>
                  </p>
                </div>
              </div>
            </div>`
}
