View        = require './view'
React       = require 'react'
Actions     = require '../../flux/actions'
getters     = require '../../flux/getters'
{ connect } = require 'nuclear-js-react-addons';

class Title extends React.Component

  @propTypes =
    title : React.PropTypes.string

  @defaultProps =
    title : ''


  onChangeHandler: ->
    console.log 'ref ', @refs.inputRef.refs.input.getValue()
    Actions.setTitle @refs.inputRef.refs.input.getValue()


  render: ->

    <View
      ref             = 'inputRef'
      title           = { @props.title }
      onChangeHandler = { @onChangeHandler.bind this } />


mapStateToProps = (props) ->

  return {
    title : getters.titlestore
  }

module.exports = connect(mapStateToProps)(Title)