# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'cancan/eager_load/version'

Gem::Specification.new do |spec|
  spec.name          = 'cancan-eager_load'
  spec.version       = CanCan::EagerLoad::VERSION
  spec.authors       = ['Aleck Greenham']
  spec.email         = ['greenhama13@gmail.com']
  spec.summary       = 'Eager load associations to check hash conditions.'
  spec.description   = 'Complex CanCan rule hash conditions can generate a lot of queries when passed an ' \
                        'ActiveRecord instance as a subject. cancan-eager_load parses the hash and adapts it ' \
                        'to eager load the data needed in a single query.'
  spec.homepage      = 'https://github.com/greena13/cancan-eager_load'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.8.7'
  spec.add_dependency 'activerecord-instance_includes', '>= 0.0.1'
  spec.add_dependency 'cancancan', '>= 2.1.4'
end
