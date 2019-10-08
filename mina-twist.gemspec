# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mina/twist/version'

Gem::Specification.new do |spec|
  spec.name        = 'mina-twist'
  spec.version     = Mina::Twist::VERSION
  spec.authors     = ['Rodrigo Coutinho']
  spec.email       = ['rodrigo.coutinho15@gmail.com']
  spec.description = 'Twist web hook from mina'
  spec.summary     = 'Twist web hook from mina'
  spec.homepage    = 'https://github.com/digaoddc/mina-twist'
  spec.license     = 'MIT'

  spec.files = Dir['lib/**/*.rb']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'

  spec.add_dependency 'mina', '>= 0.3.8'
end
