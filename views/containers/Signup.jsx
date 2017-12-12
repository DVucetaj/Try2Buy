import React from 'react';
import axios from 'axios';
import { Redirect } from 'react-router-dom'

export default class Signup extends React.Component {
  constructor(props) {
  	super(props)
  	this.state = {
  		email: "",
  		password: "",
  		isSignedUp: false,
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
  	 .then((user) =>
  	 {
  	 	if(!user){
  	 		console.log('Invalid User')
  	 	}else{
  	 		//change header
  	 		this.setState({isSignedUp: true})
  	 	}
  	 })
     .catch(function (error) {
      console.log(error);
     });

  }

  render(){
  	console.log("this.state")

  	if(this.state.isSignedUp) {
  		return <Redirect to="/" />
  	}

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
