# frozen_string_literal: true

require File.expand_path("../lib/uuid_v6/version", __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "uuid_v6"
  spec.version       = UUIDv6::VERSION
  spec.authors       = ["Vasily Kolesnikov"]
  spec.email         = ["re.vkolesnikov@gmail.com"]

  spec.summary       = 'UUID "version 6" implementation in Ruby'
  spec.homepage      = "https://github.com/v-kolesnikov/uuid_v6"
  spec.license       = "MIT"

  spec.files         = Dir['LICENSE', 'README.md', 'lib/**/*', 'spec/**/*']
  spec.require_paths = ["lib"]

  spec.add_dependency 'uuid'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
end
