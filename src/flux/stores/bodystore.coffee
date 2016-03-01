Nuclear = require 'nuclear-js'

module.exports = class bodystore extends Nuclear.Store

  @getterPath = 'bodystore'

  getInitialState: -> ''

  initialize: ->
    @on 'SET_BODY', @setBody

  setBody: (state, body) -> body
