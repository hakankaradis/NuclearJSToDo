React     = require 'react'
Actions   = require '../flux/actions/actions'
immutable = require 'immutable'

module.exports = class Item extends React.Component

	@propTypes = 
		handleDeleteClick : React.PropTypes.func
		handleCheckChange : React.PropTypes.func

	@defaultProps =
		handleDeleteClick : ->
		handleCheckChange : ->


	handleDeleteClick: ->

		@props.handleDeleteClick @props.item


	handleCheckChange: ->

		@props.handleCheckChange @props.item


	render: ->

		<div className = 'input-group row'> 
			<span className = 'input-group-addon'>
				<input 
					type     = 'checkbox'  
					onChange = { @handleCheckChange.bind this } />
			</span>
			<div className = 'form-control'> {@props.item.get 'text'} </div> 
			<button 
				type      = 'button'
				onClick   = { @handleDeleteClick.bind this }
				className = 'btn btn-default'> 
					Delete 
			</button>
		</div>