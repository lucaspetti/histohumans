# Histohumans

## Basic setup

* Ruby version: 2.6.3
* Rails version: 6.0.3.2

Make sure you have the correct ruby version installed and the bundler gem, then run:

`rake db:create db:migrate db:seed`

To run the backend:

`rails s`

## Running with docker

Make sure you have docker installed and run:

```docker-compose up```

The command should start all services described on the docker-compose.yml file.

Then setup the database:

```docker-compose run api bundle exec rails db:setup```
