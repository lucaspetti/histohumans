namespace :index do
  task :development do
    Person.all.each do |person|
      Search::Indexer.new(person, 'index').call
    end
  end
end

desc 'Index people on Elasticsearch'
task index: 'index:development'
