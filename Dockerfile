FROM ruby:2.7.1-alpine3.11

ENV BUNDLER_VERSION=2.1.4

WORKDIR /usr/src/app

COPY Gemfile .

RUN apk update && \
    apk add --no-cache \
    linux-headers \
    libxml2-dev \
    curl-dev \
    make \
    gcc \
    libc-dev \
    g++ \
    sqlite-dev \
    tzdata && \
    gem install bundler && \
    bundle install

COPY . .

EXPOSE 3000