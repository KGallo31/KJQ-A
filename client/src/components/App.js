import logo from '../logo.svg';
import '../App.css';
import Login from './Login';
import Signup from './Signup'
import React,{useState,useEffect} from 'react';


function App() {
const [user, setUser] = useState(null)

useEffect(() => {
  fetch('/me').then(r => r.json()).then(setUser)
  
}, [])

console.log("User: ", user)

  return (
    <div className="App">
      <Login setUser={setUser} />
      <Signup />
    </div>
  );
}

export default App;
