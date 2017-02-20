FROM ruby:2.3.1
MAINTAINER Ramon Tayag <ramon.tayag@gmail.com>

ARG FURY_AUTH

RUN apt-get update -qq && \
  apt-get upgrade -y && \
  apt-get install -y build-essential libpq-dev nodejs postgresql-client \
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
  RAILS_PORT=3000 \
  RAILS_BINDING=0.0.0.0 \
  RAILS_ENV=production

RUN mkdir $BUNDLE_PATH

ADD Gemfile $APP/Gemfile
ADD Gemfile.lock $APP/Gemfile.lock

RUN gem install bundler && bundle install --jobs 20 --retry 5 --without development test

ADD . $APP

RUN cp $APP/config/database.yml.sample $APP/config/database.yml && \
  bundle exec rake assets:precompile

CMD ["/usr/local/bin/bundle", "exec", "rails", "s", "-p", $RAILS_PORT, "-b", $RAILS_BINDING]
