Nuclear = require 'nuclear-js'
immutable = require 'immutable'

module.exports = class bodystore extends Nuclear.Store

  @getterPath = 'bodystore'

  getInitialState: -> immutable.Map()

  initialize: ->
    @on 'SET_FEATUREDTAGS', @setFeaturedTags

  setFeaturedTags: (state, body) -> body
