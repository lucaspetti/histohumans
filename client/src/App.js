import React from 'react';
import axios from 'axios';
import './App.css';

async function getPerson() {
  const request = await axios.get('http://localhost:3001/api/v1/people/1.json')
  console.log(request)
  const data = await request.data
  console.log(data)
  return data
}

class App extends React.Component {
  state = { person: {} }

  componentDidMount() {
    this.setState({
      person: getPerson()
    })
  }

  render() {
    const { person } = this.state

    return (
      <div className="App">
        <header className="App-header">
          <p>Welcome to Histohumans</p>
          <p>{person.first_name}</p>
        </header>
      </div>
    );
  }
}

export default App;
