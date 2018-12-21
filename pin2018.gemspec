# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pin2018/version'

Gem::Specification.new do |spec|
  spec.name          = "pin2018"
  spec.version       = Pin2018::VERSION
  spec.authors       = ["Naoto SHINGAKI"]
  spec.email         = ["n.shingaki@gmail.com"]
  spec.summary       = %q{Slack Pin Aword 2018.}
  spec.description   = %q{Slack Pin Aword 2018}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "sinatra"
  spec.add_runtime_dependency "activerecord"
  spec.add_runtime_dependency "sinatra-activerecord"
  spec.add_runtime_dependency "sinatra-contrib"
  spec.add_runtime_dependency "rake"
  spec.add_runtime_dependency "pg"
end
