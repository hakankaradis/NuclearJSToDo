React     = require 'react'
ProfilPic = require '../profilpic'

module.exports = class View extends React.Component

  render: ->
    <div>
      <ProfilPic />
      <div className='author'>Author </div>
      <div className='updatetime'>updated time</div>
      <div className='readtime'>readtime</div>
    </div>