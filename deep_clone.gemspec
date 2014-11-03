# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deep_clone/version'

Gem::Specification.new do |spec|
  spec.name          = "deep_clone"
  spec.version       = DeepClone::VERSION
  spec.authors       = ["Peter Camilleri"]
  spec.email         = ["peter.c.camilleri@gmail.com"]
  spec.description   = "A (safe/no exception) clone variant that performs a deep copy."
  spec.summary       = "A clone variant that performs a deep copy."
  spec.homepage      = "http://teuthida-technologies.com/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
# spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest'

end
