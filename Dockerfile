FROM starefossen/ruby-node:2-8-alpine

RUN apk add postgresql-client elasticsearch\

RUN mkdir /usr/src/app
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./

RUN ruby -v
ENV BUNDLER_VERSION 2.1.4
RUN gem update --system \
    && gem install bundler -v $BUNDLER_VERSION \
    && bundle install -j 4

COPY . .
