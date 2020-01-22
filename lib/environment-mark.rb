# frozen_string_literal: true

require 'environment-mark/version'
require 'rack-dev-mark'
require 'rails'

module EnvironmentMark
  PRODUCTION_APP_ENV = 'production'
  STAGING_APP_ENV = 'staging'
  DEVELOPMENT_APP_ENV = 'development'
  LOCAL_APP_ENV = 'local'

  class << self
    def configure(config)
      return if production?

      turn_on!(config)
    end

    def right_theme
      @right_theme ||= [:title, Rack::DevMark::Theme::GithubForkRibbon.new(position: 'right')]
    end

    def app_env
      ENV['APP_ENV']
    end

    def app_production?
      environment?(PRODUCTION_APP_ENV)
    end

    def app_staging?
      environment?(STAGING_APP_ENV)
    end

    def app_development?
      environment?(DEVELOPMENT_APP_ENV)
    end

    def production?
      Rails.env.production? && app_production?
    end

    def staging?
      Rails.env.production? && app_staging?
    end

    def development?
      Rails.env.production? && app_development?
    end

    def local?
      Rails.env.development?
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

    def environment?(expected)
      app_env == expected
    end

    def env_label
      return  STAGING_APP_ENV if staging?
      return  DEVELOPMENT_APP_ENV if development?
      return  LOCAL_APP_ENV if local?
    end
  end
end
