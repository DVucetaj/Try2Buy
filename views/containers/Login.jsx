import React from 'react';
import axios from 'axios';
import { Redirect } from 'react-router-dom'

export default class Login extends React.Component {
  constructor(props) {
  	super(props)
  	this.state = {
  		email: "",
  		password: "",
      isLoggedIn: false,
  	}

  	this.emailOnChange = this.emailOnChange.bind(this)
  	this.passwordOnChange = this.passwordOnChange.bind(this)
    this.login = this.login.bind(this)
  }

  emailOnChange(event) {
  	this.setState({email: event.target.value})
  }

  passwordOnChange(event) {
  	this.setState({password: event.target.value})
  }



  login(event){
    event.preventDefault();
  	const userInfo = {
  		email: this.state.email,
  		password: this.state.password
  	}
  	axios.post('/api/users/login', userInfo)
  	 .then((user) =>
  	 {
  	 	if(!user){
  	 		console.log('Invalid User')
  	 	}else{
  	 		//change header
        this.setState({isLoggedIn: true})
  	 	}
  	 })

  }

  render(){
  	console.log("this.state")

    if(this.state.isLoggedIn) {
      return <Redirect to="/" />
    }

    return(<div className="container">

    	 <form onSubmit={this.login}>
    	   <label >Email</label>
    	   <input type="email" onChange={this.emailOnChange} />

    	   <label>Password</label>
    	   <input type="password" onChange={this.passwordOnChange} />

    	   <input type="submit" value="Login"/>
    	</form>
	</div>
    )
  }
}
