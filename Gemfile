# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'nokogiri', '>= 1.10.4'
gem 'rack-dev-mark'
gem 'rails', '>= 5.2.3'

group :development, :test do
  gem 'awesome_print'
  gem 'dotenv'
  gem 'pry'
  gem 'rubocop'
  gem 'rubocop-performance'
end

group :test do
  gem 'hashdiff', ['>= 1.0.0.beta1', '< 2.0.0']
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console'
  gem 'simplecov-summary'
end

gemspec
