FROM ruby:2.6

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev vim

ENV APP_HOME /usr/src/app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ENV BUNDLE_PATH /box
ENV GEM_PATH /box
ENV GEM_HOME /box

ADD . $APP_HOME

ENV BUNDLER_VERSION 2.1.4
RUN gem install bundler -v $BUNDLER_VERSION
RUN gem install tzinfo

COPY Gemfile Gemfile.lock ./

RUN ruby -v
RUN bundle install

COPY . .

EXPOSE 3001

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3001"]