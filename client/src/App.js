import React from 'react';
import axios from 'axios';
import './App.css';

class App extends React.Component {
  state = { person: {} }

  componentDidMount() {
    this.getPerson()
  }

  getPerson = async () => {
    const request = await axios.get('http://localhost:3001/api/v1/people/sample')
    const data = await request.data
    this.setState({ person: data })
  }

  render() {
    const { person } = this.state

    return (
      <div className="App">
        <header className="App-header">
          <p>Welcome to Histohumans</p>
          <a href="/">
            <img src={person.image_url} alt={person.first_name + '_' + person.last_name}  />
          </a>
          <p>{person.name}</p>
        </header>
      </div>
    );
  }
}

export default App;
