import React from 'react';
import axios from 'axios';
import './App.css';
import { ReactiveBase, CategorySearch } from '@appbaseio/reactivesearch';

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
      <ReactiveBase
        app="histohumans"
        url={process.env.REACT_APP_ELASTICSEARCH_URL}
      >
        <div className="App">
          <header className="App-header">
            <p>Welcome to Histohumans (more coming soon!)</p>
            <a href={person.url || '/'} target="_blank">
              <img src={person.image_url || placeholderImage} alt={person.first_name + '_' + person.last_name}  />
            </a>
            <p>{person.name}</p>
            <CategorySearch
              componentId="searchbox"
              dataField="name"
              categoryField="person.name"
              placeholder="Search for People"
              autoSuggest={true}
              render={({
                error,
                value,
                suggestions,
                aggregationData,
                downshiftProps: { isOpen, getItemProps },
            }) => {
                if (error) {
                    return <div>Something went wrong! Error details {JSON.stringify(error)}</div>;
                }
                return isOpen && Boolean(value.length) ? (
                    <div>
                        {suggestions.slice(0, 5).map((suggestion, index) => (
                            <div key={suggestion.value} {...getItemProps({ item: suggestion })}>
                                {suggestion.value}
                            </div>
                        ))}
                    </div>
                ) : null;
            }}
            />
          </header>
        </div>
      </ReactiveBase>
    );
  }
}

export default App;
