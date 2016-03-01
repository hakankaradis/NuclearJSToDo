React      = require 'react'
{ Input }  = require 'react-bootstrap'

module.exports = class View extends React.Component

  @propTypes =
    title : React.PropTypes.string

  @defaultProps =
    title : ''

  render: ->
    <h1>
      <Input
        ref         = 'input'
        type        = 'text'
        value       = { @props.title }
        onChange    = { @props.onChangeHandler }
        placeholder = 'Title Here'
        className   = 'title'/>
    </h1>