View            = require './view'
React           = require 'react'
Actions         = require '../flux/actions/actions'
reactor         = require '../reactor'
getters         = require '../flux/getters'
{ toImmutable } = require 'nuclear-js'


module.exports = React.createClass

	mixins: [reactor.ReactMixin]

	# access them by using @state
	getDataBindings: ->

		return {
			query 	: getters.query
			items   : getters.filteredTodoItems
		}


	handleCheckChange: (item) ->

		Actions.updateItem item.update 'done', (done) -> !done


	handleDeleteClick: (item) ->

		Actions.deleteItem item


	handleInputChange: (event) ->

		{ value } = event.target
		console.log 'value', value
		@setState({ query : value })
		Actions.changeQuery value


	handleAddClick: -> 

		options = toImmutable {text: @state.query, id: Date.now(), done: false}
		Actions.addItem options
 

	handleCheckBox: (event) ->

		{ checked } = event.target
		Actions.setFilter checked 


	render: ->

		<View 
			items             = { @state.items }
			query             = { @state.query }
			changeableText    = { @state.changeableText }
			handleCheckBox    = { @handleCheckBox }
			handleAddClick    = { @handleAddClick }
			handleDeleteClick = { @handleDeleteClick }
			handleInputChange = { @handleInputChange }
			handleCheckChange = { @handleCheckChange }
			/> 
