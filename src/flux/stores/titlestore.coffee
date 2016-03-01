Nuclear = require 'nuclear-js'

module.exports = class titlestore extends Nuclear.Store

  @getterPath = 'titlestore'

  getInitialState: -> ''

  initialize: ->
    @on 'SET_TITLE', @setTitle

  setTitle: (state, title) -> title
