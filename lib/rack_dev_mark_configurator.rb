# frozen_string_literal: true

require 'rack_dev_mark_configurator/version'
require 'rack-dev-mark'
require 'rails'

module RackDevMarkConfigurator
  PRODUCTION_APP_ENV = 'production'
  STAGING_APP_ENV = 'staging'
  DEVELOPMENT_APP_ENV = 'development'
  LOCAL_APP_ENV = 'local'
  APP_ENV = ENV['APP_ENV']

  class << self
    def configure(config)
      return if production?

      turn_on!(config)
    end

    def right_theme
      @right_theme ||= [:title, Rack::DevMark::Theme::GithubForkRibbon.new(position: 'right')]
    end

    private

    def turn_on!(config)
      enable!(config)
      theme!(config, right_theme)
      label!(config, env_label)
    end

    def enable!(config)
      config.rack_dev_mark.enable = true
    end

    def theme!(config, theme)
      config.rack_dev_mark.theme = theme
    end

    def label!(config, label)
      config.rack_dev_mark.env = label
    end

    def production?
      Rails.env.production? && environment?(PRODUCTION_APP_ENV)
    end

    def staging?
      Rails.env.production? && environment?(STAGING_APP_ENV)
    end

    def development?
      Rails.env.production? && environment?(DEVELOPMENT_APP_ENV)
    end

    def local?
      Rails.env.development?
    end

    def environment?(expected)
      APP_ENV == expected
    end

    def env_label
      return  STAGING_APP_ENV if staging?
      return  DEVELOPMENT_APP_ENV if development?
      return  LOCAL_APP_ENV if local?
    end
  end
end
