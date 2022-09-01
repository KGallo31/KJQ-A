import React, { useState } from 'react'

function Login() {
  const [username, setUsername] = useState("")
  const [password, setPassword] = useState("")

  const handleSubmit = (e) => {
    e.preventDefault()
    const user = {username: username, password: password}
    fetch('/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(user)
    }).then(r => r.json()).then(console.log)

    console.log(username, password)
  }

  const handleUserName = (e) => {
    setUsername(e.target.value)
  }
  
  const handlePassword = (e) => {
    setPassword(e.target.value)
  }

  return (


    <div>
      <form onSubmit={handleSubmit}>
        <input type={"text"} name='username' onChange={handleUserName} />
        <input type={"password"} name='password' onChange={handlePassword} />
        <button type='submit'>Login</button>
      </form>
      <button>Signup</button>
    </div>
  )
}

export default Login