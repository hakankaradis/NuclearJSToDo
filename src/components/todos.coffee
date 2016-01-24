Item 		= require './item'
React 		= require 'react'
immutable  = require 'immutable'

module.exports = class Todos extends React.Component

	@propTypes =
		changableText			: React.PropTypes.string
		handleCheckBox    : React.PropTypes.func
		handleCheckChange : React.PropTypes.func
		handleDeleteClick : React.PropTypes.func

	@defaultProps =
		changableText     : 'Click to See Completed Tasks'
		handleCheckBox    : -> console.log 'laaaan'
		handleCheckChange : ->
		handleDeleteClick : ->


	renderList: ->

		if @props.items.size > 0
		then @props.items.toList().map (item) =>  # use => instead of -> to keep current this
			<Item
			  key  					= { item.get 'id' }
			  item 					= { item }
			  handleDeleteClick  	= { @props.handleDeleteClick }
			  handleCheckChange = { @props.handleCheckChange } />
		else
			<h4> Add a todo to get start! </h4>


	render: ->

		<div>
			{this.renderList()}
			<span > { @props.changableText } </span>
			<input
				ref 		 = 'filterCheckBox'
				type 		 = 'checkbox'
				onChange = { @props.handleCheckBox } />
		</div>