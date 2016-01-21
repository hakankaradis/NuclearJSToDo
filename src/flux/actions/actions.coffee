reactor = require '../../reactor'


exports.addItem = (item) ->
	reactor.dispatch 'ADD_ITEM', { item }


exports.setFilter = (type) ->
	reactor.dispatch 'FILTER_TYPE', type


exports.updateItem = (item) ->
	reactor.dispatch 'UPDATE_ITEM', { item }


exports.deleteItem = (item) ->
	reactor.dispatch 'DELETE_ITEM', { item }