React     = require 'react'
Todos     = require './todos'
SearchBar = require './searchbar'

module.exports = class App extends React.Component

	render: ->
			<div className="row panel panel-default">
        <h2 className="text-center">
          To-Do List
        </h2>
      	<SearchBar />
      	<Todos />
      </div>