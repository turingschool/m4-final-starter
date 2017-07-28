class Link extends React.Component {
  constructor(props) {
    super(props)

    this.state = { editable: false, title: this.props.link.title, url: this.props.link.url, read: this.props.link.read }
    this.handleEdit = this.handleEdit.bind(this)
  }

    handleEdit() {
    if(this.state.editable) {
      let id    = this.props.link.id
      let title = this.refs.title.value
      let url   = this.refs.url.value
      let read  = this.refs.read.value
      let link  = {id: id , title: title , url: url, read: read}
      this.props.handleUpdate(link)
    }
    this.setState({ editable: !this.state.editable })
  }

  render() {
    let title = this.state.editable ? <input type='text' ref='title' defaultValue={this.props.link.title} />: <h4>{this.props.link.title}</h4>;
    let url = this.state.editable ? <input type='text' ref='url' defaultValue={this.props.link.url} /> : <p>{this.props.link.url}</p>
    let read = this.state.editable ? <input type='text' ref='read' defaultValue={this.props.link.read} />: <p>{this.props.link.read}</p>;
    return (
      <div>
        {title}
        {url}
        {read}
        <button onClick={this.props.handleMarkRead}>Change Read Status</button>
        <button onClick={this.props.handleDelete}>Delete</button>
        <button onClick={this.handleEdit}> {this.state.editable ? 'Submit' : 'Edit' } </button>
      </div>
    )
  }
}
