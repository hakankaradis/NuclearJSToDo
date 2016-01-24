App		= require './components'
Flux 		= require './flux'
React        = require 'react'
ReactDOM = require 'react-dom'



ReactDOM.render(
  <App.Container />, document.querySelector('.container')
)