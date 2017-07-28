class AllLinks extends React.Component {
  constructor(props) {
    super(props)

    this.onUpdate = this.onUpdate.bind(this)
  }

  handleDelete(id) {
    this.props.handleDelete(id)
  }

  handleMarkRead(link) {
    this.props.handleMarkRead(link)
  }

  handleEdit() {

  }

  onUpdate(link) {
    this.props.onUpdate(link)
  }

  render() {
    let links = this.props.links.map(link => (
      <div className="links" key = {link.id}>
        <Link
          link={link}
          handleDelete={this.handleDelete.bind(this, link.id)}
          filterText={this.props.filterText}
          handleMarkRead={this.handleMarkRead.bind(this, link)}
          handleUpdate={this.onUpdate} />
        </div>
      ))
    return <div>{links}</div>
  }
}
