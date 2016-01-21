React   = require 'react'
Actions = require '../flux/actions/actions'


module.exports = class Item extends React.Component

	handleCheckChange: ->
		Actions.updateItem @props.item.update 'done', (done) -> !done


	handleClick: ->
		Actions.deleteItem @props.item


	render: ->
		<div className="input-group row "> 
			<span className=" input-group-addon">
				<input type="checkbox"  onChange={@handleCheckChange.bind this} />
			</span>
			<div className="form-control" > {@props.item.get 'text'} </div> 
			<button type="button" className="btn btn-default" onClick={@handleClick.bind(this)}> Delete </button>
		</div>