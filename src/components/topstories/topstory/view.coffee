React      = require 'react'
AuthorInfo = require '../../authorinfo'


module.exports = class View extends React.Component

  render: ->
    <div>
      <AuthorInfo />
      <div className='profil pic'> Profil Pic here </div>
      <span> Read more... </span>
      <a href='#'> like and number of comments here </a>
    </div>