FROM ruby:2.6.5

RUN apt-get update -qq \
&& apt-get install -y \
apt-utils \
nano

RUN mkdir /rails-api
WORKDIR /rails-api

COPY Gemfile /rails-api/Gemfile
COPY Gemfile /rails-api/Gemfile.lock

RUN bundle install

COPY . /rails-api

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]