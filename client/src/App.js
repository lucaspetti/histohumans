import React from 'react';
import axios from 'axios';
import './App.css';

class App extends React.Component {
  state = { person: {} }

  componentDidMount() {
    this.getPerson()
  }

  getPerson = async () => {
    const request = await axios.get(`${process.env.REACT_APP_BACKEND_URL}/api/v1/people/sample`)
    const data = await request.data
    this.setState({ person: data })
  }

  render() {
    const { person } = this.state
    const placeholderImage = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/201812_Homo_sapiens_neanderthalensis.svg/512px-201812_Homo_sapiens_neanderthalensis.svg.png'

    return (
      <div className="App">
        <header className="App-header">
          <p>Welcome to Histohumans (more coming soon!)</p>
          <a href={person.url || '/'} target="_blank">
            <img src={person.image_url || placeholderImage} alt={person.first_name + '_' + person.last_name} />
          </a>
          <p>{person.name}</p>
        </header>
      </div>
    );
  }
}

export default App;
