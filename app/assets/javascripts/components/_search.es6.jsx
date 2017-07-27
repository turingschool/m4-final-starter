class Search extends React.Component {
  render() {
    const { filterVal, filterUpdate} = this.props
    return (
      <form>
        <input type='text'
                ref='filterInput'
                placeholder='Start typing to filter...'
                value={filterVal}
                onChange={() => {
                  filterUpdate(this.refs.filterInput.value)
                }}
                />
      </form>
    )
  }
}
