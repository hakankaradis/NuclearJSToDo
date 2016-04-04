Styl            = require './styl/styles'
View            = require './view'
React           = require 'react'
Actions         = require '../../flux/actions'
getters         = require '../../flux/getters'
{ connect }     = require 'nuclear-js-react-addons'

{ EditorState, RichUtils, MediaUtils, CompositeDecorator, Entity, convertToRaw } = require 'draft-js'


module.exports = class NewStory extends React.Component
  HASHTAG_REGEX = /\#[\w\u0590-\u05ff]+/g
  constructor: (props) ->

    super props

    option = [
      strategy  : @findLinkEntities
      component : @Link
    ,
      strategy  : @hashTagEntities
      component : @HashTag
    ]

    decorator = new CompositeDecorator option

    @state =
      editorState  : EditorState.createEmpty(decorator)
      showURLInput : false
      urlValue     : ''

  onChange = (editorState) -> @setState { editorState }

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


  HashTag: (props) ->
    console.log 'props'
    return (
      <span {...props} style={Styl.hashtag}>{props.children}</span>
    )

  hashTagEntities: (contentBlock, callback) ->

    findWithRegex HASHTAG_REGEX, contentBlock, callback

  findWithRegex = (regex, contentBlock, callback) ->
    text = contentBlock.getText()

    while (matchArr = regex.exec text) isnt null
      start = matchArr.index
      callback start, start + matchArr[0].length

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


  myBlockStyleFn: (contentBlock) ->
    type = contentBlock.getType()
    console.log 'type', type
    if type is 'blockquote'
      return 'superFancyBlockquote'


  addMedia: (type) ->
    src = window.prompt 'Enter a URL'
    return  unless src

    entityKey = Entity.create type, 'IMMUTABLE', {src}

    return MediaUtils.insertMedia @state.editorState, entityKey, ' '


  addImage: () ->
    @onChange @addMedia 'image'

  addVideo: () ->
    @onChange @addMedia 'video'

  mediaBlockRenderer: (contentBlock) ->
    if contentBlock.getType() is 'media'
      return { component: @Media, editable: false }


  Image = (props) ->
    return <img src={props.src} style={Styl.media} />


  Video = (props) ->
    return <video controls src={props.src} style={Styl.media} />


  Media: (props) ->
    entity = Entity.get(props.block.getEntityAt(0))
    {src} = entity.getData()
    type = entity.getType()

    if (type is 'image')
      media = <Image src={src} />
    else if (type is 'video')
      media = <Video src={src} />


    return media




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
      myBlockStyleFn     = { @myBlockStyleFn.bind this }
      logState           = { @logState.bind this }

      addImage           = { @addImage.bind this }
      addVideo           = { @addVideo.bind this }
      mediaBlockRenderer = { @mediaBlockRenderer.bind this }

      styles             = { Styl } />

mapStateToProps = (props) ->

  return {
    title : getters.titlestore
  }


module.exports = connect(mapStateToProps)(NewStory)
