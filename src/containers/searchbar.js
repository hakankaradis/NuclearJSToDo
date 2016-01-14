import React, {Component} from 'react';
import { addItem } from '../actions/index';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

class SearchBar extends Component {
	constructor(props){
		super(props);

		this.state = {
			text : null
		};
	}
	render() {
		return (
			<div className="input-group">
				<input tyep="text" className="form-control" onChange={ (event) => this.setState({text: event.target.value})}/>
				<span className="input-group-btn">
					<button type="button" className="btn btn-default" onClick={ () => this.props.addItem(this.state.text) }> Add </button>
				</span>
				
			</div>
		);

	}
}

function mapStateToProps(state) {
	return {
		todos: state.todos
	};
}

function mapDispatchToProps(dispatch) {
	return bindActionCreators({addItem: addItem}, dispatch);
}


export default connect(mapStateToProps, mapDispatchToProps)(SearchBar);