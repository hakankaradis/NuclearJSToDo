export function addItem(text) {
	console.log("ADD ITEM", text);
	return {
		type: 'ADD_ITEM',
		text: text,
		checked: false
	};
}

export function checkItem (todo) {
	console.log("Check item  ", todo);
	return {
		type: 'CHECK_ITEM',
		text: todo.text,
		checked: !todo.checked
	};
}

export function deleteItem(todo) {
	console.log("Delete item  ", todo);
	return {
		type: 'DELETE_ITEM',
		text: todo.text,
		checked: todo.checked
	};

}