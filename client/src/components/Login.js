import React,{useState} from 'react'

function Login() {
    const [username,setUsername] = useState("")
    const [password,setPassword] = useState("")

    const handleSubmit = (e) => {
        e.preventDefault()
        console.log(e.target.value)
    }

  return (


    <div>
        <form onSubmit={handleSubmit}>
            <input type={"text"} name='username'/>
            <input type={"password"} name='password'/>
            <button type='submit'>Login</button>
        </form>
    </div>
  )
}

export default Login