# frozen_string_literal: true

Elasticsearch::Model.client = if Rails.env.production?
                                Elasticsearch::Client.new url: ENV['ELASTICSEARCH_URL']
                              elsif Rails.env.development?
                                Elasticsearch::Client.new log: true
                              else
                                Elasticsearch::Client.new(
                                  url: ENV['ELASTICSEARCH_TEST_URL'] ||
                                  'http://localhost:9250'
                                )
                              end
