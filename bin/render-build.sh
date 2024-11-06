#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec echo yes | bundle exec npm install -D webpack-cli
# bundle exec rails webpacker:install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
bundle exec rails db:seed RAILS_ENV=production