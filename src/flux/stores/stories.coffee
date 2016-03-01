Nuclear = require 'nuclear-js'
immutable = require 'immutable'

module.exports = class stories extends Nuclear.Store

  @getterPath = 'stories'

  getInitialState: -> immutable.Map()

  initialize: ->
    @on 'FETCH_STORIES', @handleFetchStories

  handleFetchStories: (results, { data }) -> immutable.Map data
