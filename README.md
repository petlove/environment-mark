# [EnvironmentMark](https://github.com/petlove/environment-mark)

Simple way to configure marker in Petlove Rails applications

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'environment-mark', github: 'petlove/environment-mark'
```

## Usage

Add this code bellow into _application.rb_:
```ruby
  require 'environment-mark'

  EnvironmentMark.configure(config)
```