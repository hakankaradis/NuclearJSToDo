View  = require './view'
React = require 'react'


module.exports = class SideBarHeader extends React.Component

  @propTypes =
    title : React.PropTypes.string

  @defaultProps =
    title : 'Fifth header'



  render: ->

    <View title = {@props.title}/>
