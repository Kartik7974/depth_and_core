#!/usr/bin/env bash
# exit on error
set -o errexit

# Install dependencies
bundle install

# Clean up any previous builds
rm -rf public/assets
rm -rf tmp/cache/assets

# Database setup
bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup

# Asset compilation
bundle exec rake assets:precompile RAILS_ENV=production
