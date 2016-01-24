React 		= require 'react'
Todos 		= require './todos'
SearchBar = require './searchbar'
immutable = require 'immutable'	# npm it

module.exports = class View extends React.Component

	@propTypes =
		query             : React.PropTypes.string
		changableText     : React.PropTypes.string
		handleCheckBox    : React.PropTypes.func
		handleAddClick    : React.PropTypes.func
		handleCheckChange : React.PropTypes.func
		handleDeleteClick : React.PropTypes.func
		handleInputChange : React.PropTypes.func


	@defaultProps =
		query             : ''
		checked           : false
		changableText     : 'Click to See Completed Tasks'
		handleCheckBox    : ->
		handleAddClick    : ->
		handleDeleteClick : ->
		handleInputChange : ->
		handleCheckChange : ->


	renderTodos: ->

		<Todos
			items             = { @props.items }
			changableText     =	{ @props.changableText }
			handleCheckBox    = { @props.handleCheckBox }
			handleCheckChange = { @props.handleCheckChange }
			handleDeleteClick = { @props.handleDeleteClick }/>


	renderSearchBar: ->

		<SearchBar
		  query             = { @props.query }
		  handleAddClick    = { @props.handleAddClick }
		  handleInputChange = { @props.handleInputChange }
			/>


	render: ->
		<div className  = 'row panel panel-default'>
			<h2 className = 'text-center'>
				To-Do List
			</h2>
			{ @renderSearchBar() }
			{ @renderTodos() }
		 </div>