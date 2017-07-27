class Search extends React.Component {
  constructor(props) {
    super(props)
    this.handleFilterTextInputChange = this.handleFilterTextInputChange.bind(this)
  }

  handleFilterTextInputChange(e) {
    this.props.onFilterTextInput(e.target.value)
  }

  render() {
    return (
      <form>
        <input type='text'
                placeholder='Start typing to filter...'
                value={this.props.filterText}
                onChange={this.handleFilterTextInputChange}
                />
      </form>
    )
  }
}
