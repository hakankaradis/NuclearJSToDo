require 'medium-editor/dist/css/medium-editor.css'
require 'medium-editor/dist/css/themes/default.css'

Title      = require '../title'
React      = require 'react'
Editor     = require 'react-medium-editor'
AuthorInfo = require '../authorinfo'
reactor    = require '../../reactor'
{ Button }  = require 'react-bootstrap'

module.exports = class View extends React.Component


  render: ->
    <div>
      <h3>{@props.title}</h3>

      <AuthorInfo />
      <Title.Container reactor = {reactor}/>
      <Editor
        tag      = "pre"
        text     = { @props.editorText }
        onChange = { @props.editorOnChange }
        options  = {
          placeholder:
            text : 'Tell your story'
          toolbar:
            buttons: ['bold', 'italic', 'h4', 'h5', 'h6', 'quote']
        }/>
        <Button bsStyle="primary" onClick = {@props.publishHandler}> Save me </Button>
    </div>