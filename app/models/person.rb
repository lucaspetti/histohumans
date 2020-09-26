# frozen_string_literal: true

class Person < ApplicationRecord
  include Elasticsearch::Model

  after_update :index_record
  after_create :index_record
  after_destroy :delete_index

  def index_record
    Search::Indexer.new(self, 'index').call
  end

  def delete_index
    Search::Indexer.new(self, 'delete').call
  end
end
