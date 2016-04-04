{ Editor }    = require 'draft-js'
Title         = require '../title'
React         = require 'react'
AuthorInfo    = require '../authorinfo'
reactor       = require '../../reactor'
{ Button }    = require 'react-bootstrap'

module.exports = class View extends React.Component

  renderURLInput: ->

    urlInput = null
    if @props.showURLInput
      urlInput =
        <div style = { @props.styles.urlInputContainer } >
          <input
            ref       = 'url'
            type      = 'text'
            style     = { @props.styles.urlInput }
            value     = { @props.urlValue }
            onChange  = { @props.onURLChange }
            onKeyDown = { @props.onLinkInputKeyDown } />

          <button onMouseDown = { @props.confirmLink } >
            Confirm
          </button>
        </div>

    return urlInput


  render: ->

    <div style = { @props.styles.root }>
      <h3> { @props.title } </h3>
      <AuthorInfo />
      <Title.Container reactor = { reactor }/>

      <div style={{marginBottom: 10}}>
        Here are some local examples that can be entered as a URL:
        <ul>
          <li>media.mp3</li>
          <li>media.png</li>
          <li>media.mp4</li>
        </ul>
      </div>

      <div style = { @props.styles.buttons }>
        <button onMouseDown={@props.promptForLink} style={{marginRight: 10}} >
          Add Link
        </button>
        <button onMouseDown={@props.removeLink} style={{marginRight: 10}}>
          Remove Link
        </button>

        <button onMouseDown={@props.addImage} style={{marginRight: 10}}>
          Add Image
        </button>
        <button onMouseDown={@props.addVideo} style={{marginRight: 10}}>
          Add Video
        </button>

      </div>
      { @renderURLInput() }

      <div style = {@props.styles.editor } onClick = { @props.focus }>
        <Editor
          ref              = 'editor'
          onChange         = { @props.editorOnChange }
          spellCheck       = { yes }
          editorState      = { @props.editorState }
          placeholder      = 'Enter some text...'
          blockStyleFn     = { @props.myBlockStyleFn }
          blockRendererFn  = { @props.mediaBlockRenderer }
          handleKeyCommand = { @props.handleKeyCommand }
          />
      </div>
      <input
        type    = 'button'
        value   = 'Log State'
        style   = { @props.styles.button }
        onClick = { @props.logState }
      />
      <Button bsStyle="primary" onClick = {@props.publishHandler}> Save me </Button>
    </div>
