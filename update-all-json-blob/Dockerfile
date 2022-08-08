# syntax=docker/dockerfile:1.4.1
FROM ruby:3.1.2
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    nodejs \
    postgresql-client

RUN gem update -g rubygems
WORKDIR /usr/src/app
COPY Gemfile /usr/src/Gemfile
COPY Gemfile.lock /usr/src/Gemfile.lock
RUN bundle install -j $(nproc)
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
