import logo from "../logo.svg";
import "../App.css";
import Login from "./Login";
import Signup from "./Signup";
import React, { useState, useEffect } from "react";

function App() {
  const [user, setUser] = useState(null);
  const [question,setQuestion] = useState(null)

  useEffect(() => {
    fetch("/me")
      .then((r) => r.json())
      .then(data => {
        setUser(data["user"])
        setQuestion(data["results"])
       });
  }, []);

  console.log(question)


  // checking if user has logged in yet
  if (!user) {
    return (
      <div className="App">
        <Login setUser={setUser} />
        <Signup />
      </div>
    );
  }

  return (
    <div className="App">
      <p>hello world</p>
    </div>
  );
}

export default App;
