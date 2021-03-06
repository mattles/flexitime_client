# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flexitime_client/version'

Gem::Specification.new do |spec|
  spec.name          = "flexitime_client"
  spec.version       = FlexitimeClient::VERSION
  spec.authors       = ["Matt Hunter"]
  spec.email         = ["matthunter203@gmail.com"]

  spec.summary       = %q{Ruby Wrapper around the Flexitime.co.nz API}
  spec.homepage      = "https://github.com/mattles/flexitime_client"
  spec.license       = "MIT"
  spec.required_ruby_version =  ">=2.2"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~>2.0"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rubocop"
end
