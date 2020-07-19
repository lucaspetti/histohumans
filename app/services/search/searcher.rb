module Search
  class Searcher < Base

    def search_for(search_param)
      params = { q: search_param }
      response = perform_request(
        Elasticsearch::API::HTTP_GET, "/#{@search_index}/_search", params, {}
      )
    end
  end
end
