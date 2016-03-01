View        = require './view'
React       = require 'react'
Actions     = require '../../flux/actions'
getters     = require '../../flux/getters'
{ connect } = require 'nuclear-js-react-addons';

module.exports = class NewStory extends React.Component

  constructor: (props) ->

    super props

    @state =
      editorText : ''

  publishHandler: ->
    # read from getter and get state make them json object and console them
    console.log 'title', @props.title
    console.log 'body ', @state.editorText
    Actions.setBody @state.editorText



  editorOnChange: (text) ->
    # console.log 'text ', text
    @setState { editorText : text }
    console.log @state.editorText

  render: ->

    <View
      title          = 'Editor'
      body           = 'Tell your story'
      editorText     = { @state.editorText }
      editorOnChange = { @editorOnChange.bind this }
      publishHandler = { @publishHandler.bind this }/>

mapStateToProps = (props) ->

  return {
    title : getters.titlestore
  }


module.exports = connect(mapStateToProps)(NewStory)
