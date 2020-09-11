FROM ruby:2.3.8-alpine

RUN apk add --update --no-cache build-base mariadb-dev git

RUN gem install bundler -v 2.0.2

WORKDIR /app

COPY ./Gemfile Gemfile
COPY ./Gemfile.lock Gemfile.lock

RUN bundle install 

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0" ,"-p", "3000"]

