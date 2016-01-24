Nuclear = require 'nuclear-js'


module.exports = class queryStore extends Nuclear.Store

	getInitialState: -> ''


	initialize: ->
		@on 'CHANCE_QUERY', @changeQuery


	changeQuery: (state, item) -> item
