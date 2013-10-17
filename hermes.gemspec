# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hermes/version'

Gem::Specification.new do |spec|
  spec.name          = "hermes"
  spec.version       = Hermes::VERSION
  spec.authors       = ["Alexandre Colas"]
  spec.email         = ["colasalexandre@gmail.com"]
  spec.description   = %q{Generic Web Crawler}
  spec.summary       = %q{Generic Web Crawler}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-nav"

  spec.add_runtime_dependency "mechanize"
  spec.add_runtime_dependency "socksify"
  spec.add_runtime_dependency "capybara"
  spec.add_runtime_dependency "poltergeist"
end
