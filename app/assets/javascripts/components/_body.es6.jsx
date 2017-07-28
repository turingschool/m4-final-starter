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
    // this.sendToHotReads = this.sendToHotReads.bind(this)
    this.handleFilterTextInput = this.handleFilterTextInput.bind(this);
  }

  componentDidMount() {
    $.getJSON('/api/v1/links', links => this.setState({ links }))
  }

  handleFilterTextInput(filterText) {
    this.setState({
      filterText: filterText
    });
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

  handleMarkRead(link) {
    $.ajax({
      url: `/api/v1/links/${link.id}`,
      type: 'PATCH',
      data: { read: true }
    })
    .success(function(data) {
      this.sendToHotReads.bind(this)
    })
  }

  sendToHotReads(link) {
    $.ajax({
      url: `https://guarded-reef-14770.herokuapp.com/api/v1/links`,
      type: 'POST',
      data: { link: url },
      success: (console.log("success!"))
    })
  }

  displayFailure(failureData){
    console.log("FAILED attempt to update Link: " + failureData.responseText)
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

        <Search filterText={this.state.filterText} onFilterTextInput={this.handleFilterTextInput} />

        <AllLinks links={this.state.links} filterText={this.state.filterText} handleDelete={this.handleDelete} handleMarkRead={this.handleMarkRead} onUpdate={this.handleUpdate} />
      </div>
    )
  }
}
