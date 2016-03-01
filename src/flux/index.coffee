reactor      = require '../reactor'
titlestore   = require './stores/titlestore'
bodystore    = require './stores/bodystore'
stories      = require './stores/stories'
featuredTags = require './stores/featuredTags'

reactor.registerStores
  titlestore   : new titlestore
  bodystore    : new bodystore
  stories      : new stories
  featuredTags : new featuredTags

module.exports =
  actions : require './actions'
  getters : require './getters'