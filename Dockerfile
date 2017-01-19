FROM ruby:2.3.0
RUN apt-get update -qq && \
  apt-get upgrade -y && \
  apt-get install -y build-essential libpq-dev nodejs postgresql-client less

RUN mkdir /app
WORKDIR /app

ENV BUNDLE_GEMFILE=/app/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

ENV PATH=./bin:$PATH

ADD . /app
