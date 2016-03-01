Fetch   = require 'whatwg-fetch'
rootUrl = 'https://api.imgur.com/3/'
apiKey  = 'ede63d0ead443ad'

module.exports =
  get: (url) ->
    newUrl = rootUrl + url
    return fetch newUrl, ->
      headers :
        'Authorization': 'Client-ID '+apiKey
    .then(response) ->
      console.log response
      return response.json()