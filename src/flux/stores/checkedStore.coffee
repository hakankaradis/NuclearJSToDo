Nuclear = require 'nuclear-js'


module.exports = class checkedStore extends Nuclear.Store

	@getterPath = 'checkedStore'


	getInitialState: -> 'Click to See Completed Tasks'


	initialize: ->
		@on 'FILTER_CHANCE', @changeFilter


	changeFilter: (state, type) -> 
	  switch type
	    when true
	    then 'Click To See All Tasks'
	    else 'Click To See Completed Tasks'