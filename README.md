# [Rack::Dev::Mark::Configurator](https://github.com/petlove/rack-dev-mark-configuration)

Simple way to configure marker in Petlove Rails applications

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-dev-mark-configurator', github: 'petlove/rack-dev-mark-configurator'
```

## Usage

Add this code bellow into _application.rb_:
```ruby
  require 'rack_dev_mark_configurator'

  RackDevMarkConfigurator.configure(config)
```