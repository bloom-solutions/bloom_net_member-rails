FROM ruby:2.4.0
MAINTAINER Ramon Tayag <ramon.tayag@gmail.com>

ARG FURY_AUTH

RUN apt-get update -qq && \
  apt-get upgrade -y && \
  apt-get install -y build-essential libpq-dev nodejs postgresql-client \
  # For PhantomJS:
  g++ flex bison \
  gperf perl libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 \
  libssl-dev libpng-dev libjpeg-dev python libx11-dev libxext-dev locales && \
  # Keep image size small:
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Install PhantomJS
ENV PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
RUN curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 &&\
  tar xjf $PHANTOM_JS.tar.bz2 && \
  mv $PHANTOM_JS /usr/local/share && \
  ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
RUN sed -i "s/^#\ \+\(en_US.UTF-8\)/\1/" /etc/locale.gen
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 \
  LC_ALL=en_US.UTF-8 \
  LANGUAGE=en_US:en

# Need redis-cli for scripts/ci-wait-db
RUN wget http://download.redis.io/redis-stable.tar.gz && \
  tar xvzf redis-stable.tar.gz && \
  cd redis-stable && \
  make install

ENV APP=/app
ENV BUNDLE_GEMFILE=$APP/Gemfile \
  BUNDLE_PATH=$APP/vendor/bundle \
  BUNDLE_JOBS=2 \
  PATH=./bin:$PATH \
  RAILS_PORT=3000 \
  RAILS_BINDING=0.0.0.0 \
  RAILS_ENV=test

RUN mkdir -p $APP
WORKDIR $APP

ADD Gemfile $APP/Gemfile
ADD Gemfile.lock $APP/Gemfile.lock

RUN gem install bundler && bundle install --jobs 20 --retry 5 --path=vendor/bundle

ADD . /app
