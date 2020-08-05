# frozen_string_literal: true

require 'elasticsearch/extensions/test/cluster'

RSpec.configure do |config|
  if ENV['TEST_CLUSTER_NAME'].present?
    config.before :all, elasticsearch: true do
      unless Elasticsearch::Extensions::Test::Cluster.running?(on: ENV['ELASTICSEARCH_TEST_URL'])
        Elasticsearch::Extensions::Test::Cluster.start(
          port: ENV['ELASTICSEARCH_TEST_URL'],
          nodes: ENV['TEST_CLUSTER_NODES'],
          timeout: 120
        )
      end
    end

    # config.before :each, elasticsearch: true do
    #   Search::DEFAULT_ES_CLIENT.indices.delete index: '_all'
    #
    #   repo = Search::SearchService.new
    #   suggestions_repo = Search::SuggestionsService.new
    #   repo.create_index! force: true
    #   suggestions_repo.create_index! force: true
    # end

    ## Stop elasticsearch cluster after test run
    config.after :suite do
      if Elasticsearch::Extensions::Test::Cluster.running?(on: ENV['ELASTICSEARCH_TEST_URL'])
        Elasticsearch::Extensions::Test::Cluster.stop(
          port: ENV['ELASTICSEARCH_TEST_URL'],
          nodes: ENV['TEST_CLUSTER_NODES']
        )
      end
    end

    config.before do |example|
      unless example.metadata[:elasticsearch]
        # allow_any_instance_of(Person).to receive(:index!).and_return(nil)

      end
    end
  end

  config.before :each, elasticsearch: true do
    Search::Indexer.new.index_people

    Search::DEFAULT_ES_CLIENT.indices.delete index: '_all'
    repo = Search::SearchService.new
    suggestions_repo = Search::SuggestionsService.new
    metrics_repo = Search::MetricsService.new
    repo.create_index!
    suggestions_repo.create_index!
    metrics_repo.create_index!
  end
end
