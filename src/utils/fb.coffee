React     = require 'react'
ReactFire = require 'reactfire'
Firebase  = require 'firebase'

Actions     = require '../flux/actions'
getters     = require '../flux/getters'
# { connect } = require 'nuclear-js-react-addons';

rootUrl = 'https://flickering-heat-2797.firebaseio.com/'

module.exports = class FB extends React.Component

  constructor: (props) ->
    console.log 'aa'
    super props

    @state =
      items  : {}
      loaded : no


  componentWillMount: ->

    url = '#{rootUrl}items/'
    @fb = new Firebase url
    ReactFire.bindAsObject @fb, 'items'
    @fb.on 'value', @handleDataLoaded


  handleDataLoaded: ->
    @setState { loaded : yes }


  render: ->
    console.log 'hey'