import React from 'react';
import axios from 'axios';
import { Redirect } from 'react-router-dom'

export default class Signup extends React.Component {
  constructor(props) {
  	super(props)
  	this.state = {
  		email: "",
  		password: ""
  	}

  	this.emailOnChange = this.emailOnChange.bind(this)
  	this.passwordOnChange = this.passwordOnChange.bind(this)
  	this.signup = this.signup.bind(this)
  }

  emailOnChange(event) {
  	this.setState({email: event.target.value})
  }

  passwordOnChange(event) {
  	this.setState({password: event.target.value})
  }



  signup(event){
  	event.preventDefault();
  	const userInfo = {
  		email: this.state.email,
  		password: this.state.password
  	}
  	axios.post('/api/users/signup', userInfo)
  	 .then((res) =>
  	 {
  	 	if(!res.data){
  	 		console.log('Invalid User')
  	 	}else{
  	 		//change header
  	 		axios.post('/api/users/login', userInfo)
		  	 .then((res) =>
		  	 {
		  	 	if(!res.data){
		  	 		console.log('Invalid User')
		  	 	}else{
		       		window.localStorage.setItem('user', JSON.stringify(userInfo))
		        	// console.log("user=", window.localStorage.getItem('user'))
		        	this.props.history.push('/')
		  	 	}
		  	 })
		     .catch(function (error) {
		      console.log(error);
     });
  	 	}
  	 })
     .catch(function (error) {
      console.log(error);
     });

  }

  render(){
  	console.log("this.state")

  	

    return(<div className="container">
    	 <form onSubmit={this.signup}>
    	   <label>Email</label>
    	   <input type="email" onChange={this.emailOnChange} />

    	   <label>Password</label>
    	   <input type="password" onChange={this.passwordOnChange} />

    	   <input type="submit" value="Signup"/>
    	</form>
	</div>
    )
  }
}
