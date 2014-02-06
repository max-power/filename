# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'filename/version'

Gem::Specification.new do |spec|
  spec.name          = "filename-helper"
  spec.version       = Filename::VERSION
  spec.authors       = ["Max Power"]
  spec.email         = ["kevin.melchert@gmail.com"]
  spec.summary       = %q{Simple Filename helper. Works well with Pathname.}
  spec.description   = %q{Simple Filename helper. Works well with Pathname.}
  spec.homepage      = "https://github.com/max-power/filename"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
