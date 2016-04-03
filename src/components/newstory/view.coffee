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
      <div style = { @props.styles.buttons }>
        <button
          style       = {{ marginRight: 10 }}
          onMouseDown = { @props.promptForLink } >
          Add Link
        </button>
        <button onMouseDown = { @props.removeLink }>
          Remove Link
        </button>
      </div>
      { @renderURLInput() }

      <div style = {@props.styles.editor } onClick = { @props.focus }>
        <Editor
          ref              = 'editor'
          onChange         = { @props.editorOnChange }
          editorState      = { @props.editorState }
          placeholder      = 'Enter some text...'
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
