# frozen_string_literal: true

module Search
  class Indexer
    include Elasticsearch::API

    INDEX = 'histohumans'

    def index_people
      people = Person.all
      people.each do |person|
        index(index: INDEX, type: 'person', id: person.id, body: person.as_json)
      end
    end
  end
end
