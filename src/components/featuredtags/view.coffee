Tags          = require './tags'
React         = require 'react'
SideBarHeader = require '../sidebarheader'

module.exports = class View extends React.Component

  renderHeader: ->
    <SideBarHeader />


  renderTags: ->
    <Tags />


  render: ->
    <div>
      {@renderHeader()}
      {@renderTags()}
    </div>