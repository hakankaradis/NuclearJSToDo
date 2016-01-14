import React from 'react';
import { Component } from 'react';
import Todos from '../containers/todos';
import SearchBar from '../containers/searchbar' ;


export default class App extends Component {
  // constructor(props){
  // 	super(props);

  // 	this.state = { items:null };
  // 	ReactFire.firebaseRef = new Firebase(rootUrl + 'items/');
  //   ReactFire.firebaseRef.on('value', (data) => this.props.init(data) );
  // }


  render() {
  
    return (
      <div className="row panel panel-default">
        <h2 className="text-center">
          To-Do List
        </h2>
      	<SearchBar / >
      	<Todos />
      </div>
    );
  }
}