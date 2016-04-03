App      = require './components/newstory'
Flux     = require './flux'
reactor  = require './reactor'
React    = require 'react'
ReactDOM = require 'react-dom'
require 'react-semantic-ui'

ReactDOM.render(
  <App.Container reactor={reactor}/>, document.querySelector('.container')
)