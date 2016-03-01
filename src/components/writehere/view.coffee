React     = require 'react'
ProfilPic = require '../profilpic'


module.exports = class View extends React.Component

  render: ->
    <div>
      <ProfilPic />
      Hakan Karadis
      <div className="ui fluid icon input">
        <input type="text" placeholder="Write here..." />
      </div>
    </div>