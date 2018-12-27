# frozen_string_literal: true

require 'magical/service/version'

Gem::Specification.new do |spec|
  spec.name        = 'magical-service'
  spec.version     = Magical::Service::VERSION
  spec.date        = '2018-12-27'
  spec.summary     = 'Magical Service helps build a service object ' \
                     'through a single action'
  spec.description = 'Magical Service is an experiment that aims to assist ' \
                     'the construction of service objects through stages ' \
                     'as a single action.'

  spec.required_ruby_version = '>= 2.5'

  spec.license     = 'MIT'

  spec.authors     = ['Heirian']
  spec.email       = 'shinkcc@gmail.com'
  spec.homepage    =
    'https://github.com/magica-azula/magical-service'

  spec.files       = Dir['MIT-LICENSE', 'lib/**/*']

  spec.add_development_dependency('rspec', '~> 3.8')
  spec.add_development_dependency('rubocop', '~> 0.61.1')
  spec.add_development_dependency('simplecov', '~> 0.16.1')
end
