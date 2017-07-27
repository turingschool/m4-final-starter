class AllLinks extends React.Component {
  constructor(props) {
    super(props)

    this.onUpdate = this.onUpdate.bind(this)
  }

  handleDelete(id) {
    this.props.handleDelete(id)
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
          handleUpdate={this.onUpdate} />
        </div>
      ))
      const LinksList = ({
        data,
        filter
      }) => { const input = filter.toLowerCase()
        const links = data
        .map((link, i) => {
          return (
            <Link
              id={link.id}
              key={i}
              info={link}
              />
          )
        })
      }

    return <div>{links}</div>
  }
}
