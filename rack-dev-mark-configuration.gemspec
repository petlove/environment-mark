# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/dev/mark/configurator/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-dev-mark-configuration'
  spec.version       = Rack::Dev::Mark::Configurator::VERSION
  spec.authors       = ['linqueta']
  spec.email         = ['tecnologia@petlove.com.br']

  spec.licenses      = ['MIT']
  spec.summary       = 'Simple configurator for Rack Dev Mark'
  spec.description   = 'Simple configurator for Rack Dev Mark'
  spec.homepage      = 'https://github.com/petlove/aws-sqs-configurator'

  spec.files         = Dir['{lib}/**/*', 'CHANGELOG.md', 'MIT-LICENSE', 'README.md']
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.6.3'

  spec.add_dependency 'rack-dev-mark', '~> 0.7.8'

  spec.add_development_dependency 'bundler', '~> 2.0.2'
  spec.add_development_dependency 'rake', '~> 10.0'
end
