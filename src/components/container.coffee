View      = require './view'
React     = require 'react'
ReactFire = require 'reactfire'
Firebase  = require 'firebase'
Actions   = require '../flux/actions'
getters   = require '../flux/getters'
Api       = require '../utils/api'

rootUrl = 'https://flickering-heat-2797.firebaseio.com/'


module.exports = class Main extends React.Component

  constructor: (props) ->
    console.log 'aa'
    super props

    @state =
      items  : {}
      loaded : no


  componentWillMount: ->

    url = rootUrl+'featuredTags/'
    console.log 'url ', url
    @fb = new Firebase url
    ReactFire.bindAsObject @fb, 'items'
    @fb.on 'value', @handleDataLoaded


  handleDataLoaded: ->
    @setState { loaded : yes }



  render: ->

    <View />