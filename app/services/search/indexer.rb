# frozen_string_literal: true

module Search
  class Indexer < Base
    def index_people
      people = Person.all
      people.each do |person|
        index(index: @index_name, type: 'person', id: person.id, body: person.as_json)
      end
    end
  end
end
