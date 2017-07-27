class Body extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      links: []
    }

    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleDelete = this.handleDelete.bind(this)
    this.handleUpdate = this.handleUpdate.bind(this)
    this.updateLinks = this.updateLinks.bind(this)
  }

  componentDidMount() {
    $.getJSON('/api/v1/links', links => this.setState({ links }))
  }

  handleSubmit(link) {
  let newState = this.state.links.concat(link)
  this.setState({ links: newState })
  }

  handleDelete(id) {
    $.ajax({
      url: `/api/v1/links/${id}`,
      type: 'DELETE',
      success: (() => this.removeLink(id)),
    })
  }

  removeLink(id) {
    let newLinks = this.state.links.filter(link => link.id != id)
    this.setState({ links: newLinks})
  }

  handleUpdate(link) {
    $.ajax({
      url: `/api/v1/links/${link.id}`,
      type: 'PUT',
      data: { link: link },
      success: (() => this.updateLinks(link)),
    })
  }

  updateLinks(link) {
    let links = this.state.links.filter(i => i.id != link.id )
    links.push(link)
    this.setState({links: links})
  }

  render() {
    return (
      <div>
        <NewLink handleSubmit={this.handleSubmit} />
        <AllLinks links={this.state.links} handleDelete={this.handleDelete} onUpdate={this.handleUpdate} />
      </div>
    )
  }
}
