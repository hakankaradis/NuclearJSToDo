reactor 	  	= require '../reactor'
itemsStore      = require './stores/itemsStore'
queryStore      = require './stores/queryStore'
typeFilterStore = require './stores/typeFilterStore'

reactor.registerStores
	typeFilterStore : new typeFilterStore
	itemsStore      : new itemsStore
	queryStore      : new queryStore


module.exports = 
	actions: require './actions/actions'
	getters: require './getters'