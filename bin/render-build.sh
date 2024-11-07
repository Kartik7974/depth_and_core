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
RAILS_ENV=production SECRET_KEY_BASE=dummy bundle exec rake assets:precompile
