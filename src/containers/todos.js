import React, {Component} from  'react';
import {connect} from 'react-redux';
import { bindActionCreators } from 'redux';
import { deleteItem, checkItem } from '../actions/index';

class Todos extends Component {
	todos() {
		
		return this.props.todos.map( (todo) => {
			console.log(todo);
			return (
				<div className="input-group" key={todo.text}>
					<span className="input-group-addon">
				        <input type="checkbox" checked={todo.checked} onChange={ (event) => this.props.checkItem(todo) }/>
		     	 	</span>
					<div type="text" className="form-control" >{todo.text} </div> 
						
					<span className="input-group-btn">
				        
				        <button className="btn btn-default" onClick={ () => this.props.deleteItem(todo) }>
				          Delete
				        </button>
				     </span>
			     </div>
			);
		} );
	}
		
	render() {
		return (
			<div>
				{this.todos()}
			</div>
		);
	}
}

function mapDispatchToProps(dispatch) {
	return bindActionCreators({checkItem: checkItem, deleteItem:deleteItem}, dispatch);
}

function mapStateToProps(state) {
	return {
		todos: state.todos.todos
	};
}

export default connect(mapStateToProps, mapDispatchToProps)(Todos);
