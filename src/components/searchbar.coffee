React = require 'react'

module.exports = class SearchBar extends React.Component

  @propsTypes =
    query                     : React.PropTypes.string
    handleAddClick      : React.PropTypes.func
    handleInputChange : React.PropTypes.func


  @defaultProps =
    query                     : ''
    handleAddClick      : ->
    handleInputChange : ->


  render: ->

    <div className  = 'input-group'>
      <input
        type        = 'text'
        className   = 'form-control'
        placeholder = 'Search'
        ref         = 'TodoListInput'
        value       = { @props.query }
        onChange    = { @props.handleInputChange }/>

      <span className = 'input-group-btn'>
        <button
          type      = 'button'
          className = 'btn btn-default'
          ref       = 'AddTodoButton'
          onClick   = { @props.handleAddClick }>
            Add
        </button>
      </span>
    </div>