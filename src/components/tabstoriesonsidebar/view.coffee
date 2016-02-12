React         = require 'react'
ProfilPic     = require '../profilpic'
StoryInfo     = require './storyinfo'
SideBarHeader = require '../sidebarheader'


module.exports = class View extends React.Component

  renderStories: ->
    for i in [1..5]
      <StoryInfo />


  render: ->
    <div>
      <SideBarHeader />
      {@renderStories()}
    </div>