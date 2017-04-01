FROM ruby:2.3.1
MAINTAINER Ramon Tayag <ramon.tayag@gmail.com>

ARG FURY_AUTH

RUN apt-get update -qq && \
  apt-get upgrade -y && \
  apt-get install -y build-essential libpq-dev nodejs postgresql-client && \
  # Keep image size small:
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENV APP=/app
RUN mkdir $APP
WORKDIR $APP

ENV BUNDLE_GEMFILE=$APP/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle \
  PATH=./bin:$PATH \
  RAILS_ENV=production \
  # To get it to compile
  BLOOM_NET_CENTER_HOST=http://localhost \
  BLOOM_NET_CENTER_TOKEN=token \
  BLOOM_NET_CENTER_SECRET=secret \
  STELLAR_BRIDGE_URL=http://host \
  SECRET_KEY_BASE=asdfasdfasdfasdfasdfasd

RUN mkdir $BUNDLE_PATH

ADD Gemfile $APP/Gemfile
ADD Gemfile.lock $APP/Gemfile.lock

RUN gem install bundler && bundle install --jobs 20 --retry 5 --without development test

ADD . $APP

RUN cp $APP/config/database.yml.sample $APP/config/database.yml && \
  bundle exec rake assets:precompile
