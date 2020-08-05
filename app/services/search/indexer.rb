# frozen_string_literal: true

module Search
  class Indexer < Base
    def index_people
      people = Person.all
      people.each do |person|
        index(index: @search_index, type: 'person', id: person.id, body: person.as_json)
      end
    end
  end
end
