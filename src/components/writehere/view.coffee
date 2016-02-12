React     = require 'react'
ProfilPic = require '../profilpic'

module.exports = class View extends React.Component

  render: ->
    <div>
      <ProfilPic />
      <input type='text' placeholder='Write Here...' />
    </div>