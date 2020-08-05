client: PORT=3000 yarn --cwd client start
web: bundle exec puma -p 3001 -C ./config/puma.rb
worker: bundle exec rails jobs:work
