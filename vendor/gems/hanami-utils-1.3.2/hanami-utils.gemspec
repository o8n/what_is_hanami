lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hanami/utils/version'

Gem::Specification.new do |spec|
  spec.name          = 'hanami-utils'
  spec.version       = Hanami::Utils::VERSION
  spec.authors       = ['Luca Guidi']
  spec.email         = ['me@lucaguidi.com']
  spec.description   = 'Hanami utilities'
  spec.summary       = 'Ruby core extentions and Hanami utilities'
  spec.homepage      = 'http://hanamirb.org'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -- lib/* CHANGELOG.md LICENSE.md README.md hanami-utils.gemspec`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.3.0'

  spec.add_dependency 'transproc',       '~> 1.0'
  spec.add_dependency 'concurrent-ruby', '~> 1.0'

  spec.add_development_dependency 'bundler', '>= 1.6', '< 3'
  spec.add_development_dependency 'rake',    '~> 12'
  spec.add_development_dependency 'rspec',   '~> 3.7'
end
