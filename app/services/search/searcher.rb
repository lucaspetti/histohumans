# frozen_string_literal: true

module Search
  class Searcher < Base
    def search_for(search_param)
      params = { q: search_param }
      perform_request(Elasticsearch::API::HTTP_GET, "/#{@search_index}/_search", params, {})
    end
  end
end
