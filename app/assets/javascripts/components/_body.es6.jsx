class Body extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      filterText: '',
      links: []
    }

    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleDelete = this.handleDelete.bind(this)
    this.handleUpdate = this.handleUpdate.bind(this)
    this.updateLinks = this.updateLinks.bind(this)
    this.filterUpdate = this.filterUpdate.bind(this)
  }

  componentDidMount() {
    $.getJSON('/api/v1/links', links => this.setState({ links }))
  }

  filterUpdate(value) {
    this.setState({
      filterText: value
    })
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
    const hasSearch = this.state.filterText.length > 0
    return (
      <div>
        <NewLink handleSubmit={this.handleSubmit} />
        <Search
          filterVal={this.state.filterText}
          filterUpdate={this.filterUpdate.bind(this)}
          />
        {hasSearch &&
        <button onClick={this.filterUpdate.bind(this, '')}>
          Clear search
        </button>}
        <AllLinks links={this.state.links} filter={this.state.filterText} handleDelete={this.handleDelete} onUpdate={this.handleUpdate} />
      </div>
    )
  }
}
