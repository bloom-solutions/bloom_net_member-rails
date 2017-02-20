FROM ruby:2.4.0

RUN apt-get update -qq && \
  apt-get upgrade -y && \
  apt-get install -y build-essential libpq-dev nodejs postgresql-client less \
  # Keep image size small:
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir /app

WORKDIR /app

ENV PATH=./bin:$PATH

ADD . /app
