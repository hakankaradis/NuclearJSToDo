Item 								  = require './item'
React 							  = require 'react'
reactor							  = require '../reactor'
Actions								= require '../flux/actions/actions'
{ filteredTodoItems } = require '../flux/getters'


module.exports = React.createClass

	mixins: [reactor.ReactMixin]


	getInitialState: ->
		return { checkMe: 'Click To See Completed Tasks' }


	getDataBindings: ->
		return { items: filteredTodoItems }


	renderList: ->
		console.log 'render', @state.items.toJS(), @state.items, @state.items.hasOwnProperty('__root')
		if @state.items.size>0
		then @state.items.toList().map (item) -> 
			console.log 'renderList ', item
			<Item key={item.get 'id'} item={item} />
		else 
			  <h4> Add a todo to get start! </h4>


	handleCheckBox: (event) ->
		if event.target.checked 
		then this.setState({ checkMe: 'Click To See AllTasks' }) 
		else this.setState({ checkMe: 'Click To See Completed Tasks' })		
		Actions.setFilter event.target.checked


	render: ->
		console.log 'todos component ', @state.items.toJS()
		<div> 
			{this.renderList()} 	
			<span> {@state.checkMe} </span>
			<input type="checkbox" onChange={@handleCheckBox} />
		</div>