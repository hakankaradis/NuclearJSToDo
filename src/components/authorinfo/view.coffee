React     = require 'react'
ProfilPic = require '../profilpic'

module.exports = class View extends React.Component

  render: ->
    <div>
      <ProfilPic />
      <div className="postMetaInline-feedSummary">
        <a className="link link link--darken link--accent" >
          Hakan Karadiş
        </a>
      </div>
    </div>