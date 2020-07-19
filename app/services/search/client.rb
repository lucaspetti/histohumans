# frozen_string_literal: true

module Search
  class Client
    include Elasticsearch::API

    CONNECTION = ::Faraday::Connection.new url: 'http://localhost:9200'

    def perform_request(method, path, params, body, headers = nil)
      puts "--> #{method.upcase} #{path} #{params} #{body} #{headers}"

      CONNECTION.run_request \
        method.downcase.to_sym,
        path,
        ( body ? MultiJson.dump(body): nil ),
        {'Content-Type' => 'application/json'}
    end
  end
end
