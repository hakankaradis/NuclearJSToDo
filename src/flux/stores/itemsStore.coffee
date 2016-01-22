Nuclear     = require 'nuclear-js'
toImmutable = Nuclear.toImmutable


module.exports = class itemsStore extends Nuclear.Store

	getInitialState: -> toImmutable({})


	initialize: ->
		@on 'ADD_ITEM', @addItem
		@on 'UPDATE_ITEM', @updateItem
		@on 'DELETE_ITEM', @deleteItem


	deleteItem: (state, {item}) ->
		console.log 'delete item action'
		return state.delete item.get('id')


	updateItem: (state, {item}) ->
		console.log 'update item dispatch'
		return state.set item.get('id'), item


	addItem: (state, {item}) ->
		console.log 'item store action'
		return state.set item.get('id'), toImmutable(item)  # because item is immutable