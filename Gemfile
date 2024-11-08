source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

# Add this to specify Bundler version
gem 'bundler', '~> 2.4.8'

# Rails itself
gem 'rails', '~> 6.1.0'

# Database and server
gem 'pg'
gem 'puma', '~> 5.0'

# Asset pipeline and frontend
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

# Reduces boot times through caching
gem 'bootsnap', '>= 1.4.4', require: false

# Authentication
gem 'devise'

# Required for deployment
gem 'rake'

# Add this line
gem 'jwt'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

# Windows does not include zoneinfo files
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
