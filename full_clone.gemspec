# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'full_clone/version'

Gem::Specification.new do |spec|
  spec.name          = "full_clone"
  spec.version       = FullClone::VERSION
  spec.authors       = ["Peter Camilleri"]
  spec.email         = ["peter.c.camilleri@gmail.com"]
  spec.description   = "A (safe/no exceptions) clone variant that performs a deep, recursive copy."
  spec.summary       = "A clone variant that performs a deep copy."
  spec.homepage      = "https://github.com/PeterCamilleri/full_clone"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "bundler", ">= 2.1.0"
  spec.add_development_dependency 'minitest', "~> 5.7"
  spec.add_development_dependency 'reek', "~> 5.0.2"
end
