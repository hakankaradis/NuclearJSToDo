App      = require './components'
React    = require 'react'
ReactDOM = require 'react-dom'
Flux     = require './flux'


ReactDOM.render(
  <App.Container />, document.querySelector('.container')
)