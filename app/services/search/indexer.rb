# frozen_string_literal: true

module Search
  class Indexer < Base
    def initialize(record, action)
      @client = Elasticsearch::Model.client
      @record = record
      @action = action
    end

    def call
      @client.send(
        @action.to_sym,
        index: @record.class.index_name,
        id: @record.id,
        body: @record.__elasticsearch__.as_indexed_json
      )
    rescue Faraday::ConnectionFailed, Elasticsearch::Transport::Transport::Errors::NotFound => e
      Rails.logger.error e.message
    end
  end
end
