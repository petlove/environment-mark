# [Rack::Dev::Mark::Configuration](https://github.com/petlove/rack-dev-mark-configuration)

Simple way to configure marker in Petlove Rails applications

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-dev-mark-configuration', github: 'petlove/rack-dev-mark-configuration'
```

## Usage

Add this code bellow into _development.rb_ and _production.rb_:
```ruby
  RackDevMarkConfiguration.configure(config)
```