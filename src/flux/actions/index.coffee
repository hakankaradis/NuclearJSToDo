reactor = require '../../reactor'

setTitle = (title) ->
  reactor.dispatch 'SET_TITLE', title

setBody = (body) ->
  reactor.dispatch 'SET_BODY', body

setFeaturedTags = (body) ->
  reactor.dispatch 'SET_FEATUREDTAGS', body

module.exports = {
  setTitle
  setBody
  setFeaturedTags
}