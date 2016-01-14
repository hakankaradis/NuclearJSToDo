import _ from 'underscore';

export default function(state=null, action) {
	console.log ("action and state", action, state);
	if(action.type == 'ADD_ITEM'){
		return Object.assign({}, state, {
	        todos: [
	          ...state.todos,
	          {
	            text: action.text,
	            checked: false
	          }
	        ]
	      }); 
	} else if (action.type == 'CHECK_ITEM') {
	
		_.findWhere(state.todos, {text:action.text}).checked = action.checked
		return Object.assign({}, state, {
	        todos: [
	          ...state.todos
	        ]
	    }); 
	} else if (action.type == 'DELETE_ITEM') {
		state.todos = _.without(state.todos, _.findWhere(state.todos, {text:action.text}));
		return Object.assign({}, state, {
	        todos: [
	          ...state.todos
	        ]
	    });
	}
	else {
		return {
			todos:[
				{
					text: 'Finish React',
					checked: false
				}
			]};
	} 
}