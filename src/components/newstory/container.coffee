Styl            = require './styl/styles'
View            = require './view'
React           = require 'react'
Actions         = require '../../flux/actions'
getters         = require '../../flux/getters'
{ connect }     = require 'nuclear-js-react-addons';

{ EditorState, RichUtils, CompositeDecorator, Entity, convertToRaw } = require 'draft-js'


module.exports = class NewStory extends React.Component

  constructor: (props) ->

    super props

    option = [{
      strategy  : @findLinkEntities
      component : @Link
    }]

    decorator = new CompositeDecorator option

    @state =
      editorState  : EditorState.createEmpty(decorator)
      showURLInput : false
      urlValue     : ''


  publishHandler: ->
    # read from getter and get state make them json object and console them
    console.log 'title', @props.title
    console.log 'body ', @state.editorState
    Actions.setBody @state.editorState


  findLinkEntities: (contentBlock, callback) ->
    console.log 'findLinkEntities'
    contentBlock.findEntityRanges (character) ->
      console.log 'character ', character
      entityKey = character.getEntity()
      return entityKey? and Entity.get(entityKey).getType() is 'LINK'
    , callback


  Link: (props) ->

    { url } = Entity.get(props.entityKey).getData()
    return (
      <a href={url} style = {Styl.link}>
        {props.children}
      </a>
    )


  editorOnChange: (editorState) ->
    @setState { editorState }


  handleKeyCommand: (command) ->

    newState = RichUtils.handleKeyCommand @state.editorState, command
    @editorOnChange newState  if newState


  logState: ->
    content = @state.editorState.getCurrentContent()
    console.log convertToRaw content


  promptForLink: (e) ->
    e.preventDefault()
    {editorState} = @state
    selection = editorState.getSelection()
    unless selection.isCollapsed()
      @setState
        showURLInput : true
        urlValue     : ''


  focus: ->
    @refs.editor.refs.editor.focus()


  onURLChange: (e) ->

    @setState {urlValue : e.target.value}


  confirmLink: (e) ->
    e.preventDefault()
    {editorState, urlValue} = @state
    console.log 'urlValue ', urlValue
    entityKey = Entity.create 'LINK', 'MUTABLE', { url: urlValue }
    console.log 'entityKey ', entityKey
    @setState
      editorState  : RichUtils.toggleLink editorState, editorState.getSelection(), entityKey
      showURLInput : false
      urlValue     : ''
    # , =>
    #   setTimeout => @refs.editor.focus(), 0


  onLinkInputKeyDown: (e) ->
    if e.which is 13
      @confirmLink e


  removeLink: (e) ->
    e.preventDefault()
    {editorState} = @state
    selection = editorState.getSelection()
    unless selection.isCollapsed()
      @setState
        editorState : RichUtils.toggleLink editorState, selection, null


  render: ->

    <View
      ref                = 'editor'
      title              = 'Editor'
      body               = 'Tell your story'
      editorState        = { @state.editorState }
      editorOnChange     = { @editorOnChange.bind this }
      publishHandler     = { @publishHandler.bind this }
      handleKeyCommand   = { @handleKeyCommand.bind this }

      showURLInput       = { @state.showURLInput }
      onURLChange        = { @onURLChange.bind this }
      urlValue           = { @state.urlValue }
      onLinkInputKeyDown = { @onLinkInputKeyDown.bind this }
      confirmLink        = { @confirmLink.bind this }

      promptForLink      = { @promptForLink.bind this }
      removeLink         = { @removeLink.bind this }
      focus              = { @focus.bind this }

      logState           = { @logState.bind this }

      styles             = { Styl} />

mapStateToProps = (props) ->

  return {
    title : getters.titlestore
  }


module.exports = connect(mapStateToProps)(NewStory)
