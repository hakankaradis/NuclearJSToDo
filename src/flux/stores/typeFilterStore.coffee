Nuclear = require 'nuclear-js'
toImmutable = Nuclear.toImmutable


module.exports = class typeFilterStore extends Nuclear.Store

	@getterPath = 'typeFilterStore'


	getInitialState: -> false


	initialize: ->
		@on 'FILTER_TYPE', @changeFilter


	changeFilter: (state, type) -> type