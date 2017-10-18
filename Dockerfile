FROM ruby:2.4.1-alpine3.6

MAINTAINER James Robert Rooke <thepoltergeist23@gmail.com>

RUN apk update \
	&& apk add build-base postgresql-dev \
	&& apk add --no-cache curl tar bash \
	&& apk add python imagemagick file \
	&& echo https://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
	&& echo https://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
	&& apk add --update nodejs nodejs-npm yarn \
	&& rm -rf /var/cache/apk/* \
  && apk del curl tar binutils

# Environment variables
ENV CACHE_GEMS /tmp
ENV APP_HOME /frishtug_app

COPY Gemfile* $CACHE_GEMS/
WORKDIR $CACHE_GEMS
RUN bundle install --binstubs

COPY package.json yarn.lock $APP_HOME/
WORKDIR $APP_HOME

RUN yarn install


COPY . $APP_HOME
CMD puma -C config/puma.rb