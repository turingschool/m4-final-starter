class NewLink extends React.Component {
  constructor(props) {
    super(props)

    this.state = { url: '', title: ''}
    this.handleClick = this.handleClick.bind(this)
  }

  handleClick() {
    let url = this.refs.url.value
    let title = this.refs.title.value
    $.ajax({
      url: '/api/v1/links',
      type: 'POST',
      data: { link: { url: url, title, title} },
      success: (link => this.props.handleSubmit(link))
    })
    this.setState({ url: '', title: ''})
  }

  render() {
    return (
      <div>
        <input ref='url' placeholder='Enter the url of the link' />
        <input ref='title' placeholder='Enter a title' />
        <button onClick={this.handleClick}>Add Link</button>
      </div>
    )
  }
}
