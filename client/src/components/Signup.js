import React, { useState } from 'react'



function Signup() {
  const [username, setUsername] = useState("")
  const [password, setPassword] = useState("")
  const [passwordConfirm, setPasswordConfirm] = useState("")

  function handleSubmit(e) {
    e.preventDefault()
    const user = {username: username, password: password, passwordConfirm: passwordConfirm}
    fetch('/signup', {
      method: 'POST',
      headers: {
        "Content-Type": 'application/json'
      },
      body: JSON.stringify(user)
    }).then(r => r.json()).then(console.log)
  }

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <input type={"text"} name='username' onChange={e => setUsername(e.target.value)} />
        <input type={"password"} name='password' onChange={e => setPassword(e.target.value)} />
        <input type={"password"} name='confirmation' onChange={e => setPasswordConfirm(e.target.value)}/>
        <button type='submit'>Signup</button>
      </form>
    </div>
  )
}

export default Signup