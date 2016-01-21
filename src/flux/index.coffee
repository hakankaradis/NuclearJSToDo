reactor 	  = require '../reactor'
typeFilterStore = require './stores/typeFilterStore'
itemsStore = require './stores/itemsStore'

reactor.registerStores
	typeFilterStore: new typeFilterStore
	itemsStore:  new itemsStore


module.exports = 
	actions: require './actions/actions'
	getters: require './getters'