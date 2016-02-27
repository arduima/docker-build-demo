FROM ruby:2.3.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
CMD rm -f tmp/pids/server.pid && bin/rails db:migrate && bin/rails db:setup && bin/rails server --port 3000 --binding 0.0.0.0
