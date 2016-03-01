React     = require 'react'

module.exports = class View extends React.Component



  render: ->
    <div className='sidebarheader'>
      <h5 className='header'>{@props.title}</h5>
    </div>