namespace :index do
  task :development do
    # Search::Indexer.new.index_people
  end
end

desc 'Index people on Elasticsearch'
task index: 'index:development'
