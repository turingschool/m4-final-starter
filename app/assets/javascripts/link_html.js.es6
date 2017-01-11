function linkHTML(link) {

    return `<div class='col-md-4'>
              <div class='${link.js_class}' data-id="${link.id}" id="link-${link.id}">
                <div class="container">
                  <table>
                  <tr>

                  <td class='link-title'>${ link.title }</td>
                  </tr>
                  <tr>
                    <td class='link-url'>${ link.url }</td>
                  </tr>
                  <tr>
                    <td class="link-read">
                      ${ link.read }
                    </td>
                  </tr>
                </table>
                  <p class="link_buttons">
                      <button class='mark-read'> 'Mark as Read'</button>
                    <% end }
                    <button class='edit-link'><a href='/links/${link.id}/edit'>Edit</a></button>
                    <button class='delete-link'>Delete</button>
                  </p>
                </div>
              </div>
            </div>
`
}
