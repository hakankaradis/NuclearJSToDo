exports.filteredTodoItems = [
	['typeFilterStore']
	['itemsStore']
	(filter, items) ->
		if  filter 
		then items.filter( (i) -> i.get('done')  == filter) 
		else items
]