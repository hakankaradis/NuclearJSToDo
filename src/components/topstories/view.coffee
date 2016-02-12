React    = require 'react'
TopStory = require './topstory'


module.exports = class View extends React.Component

  renderStories: ->
    for i in [1..5]
      <TopStory />

  render: ->
    <div>
      {@renderStories()}
    </div>