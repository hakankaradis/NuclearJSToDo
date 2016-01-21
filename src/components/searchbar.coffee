React           = require 'react'
Actions         = require '../flux/actions/actions'
{ toImmutable } = require 'nuclear-js'

module.exports = class SearchBar extends React.Component

  constructor: (props) ->
    super props

    @state = { text : '' }


  handleInputChange: (event) ->
    @setState { text: event.target.value }


  handleClick: -> 
    console.log @state.text
    Actions.addItem toImmutable {text: @state.text, id: Date.now(), done: false}
	

  render: ->
    <div className="input-group"> 
      <input type="text" className="form-control" onChange={@handleInputChange.bind(this)}/>
      <span className="input-group-btn">
        <button type="button" className="btn btn-default" onClick={@handleClick.bind(this)}> Add 
        </button>
      </span>
    </div>