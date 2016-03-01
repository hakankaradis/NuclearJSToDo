Tags          = require './tags'
React         = require 'react'
SideBarHeader = require '../sidebarheader'

module.exports = class View extends React.Component

  renderHeader: ->
    <SideBarHeader.Container />


  renderTags: ->
    <Tags />


  render: ->
    <div className='app'>
      {@renderHeader()}
      {@renderTags()}
    </div>