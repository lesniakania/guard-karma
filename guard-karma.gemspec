# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/karma/version'

Gem::Specification.new do |spec|
  spec.name          = "guard-karma"
  spec.version       = Guard::KarmaVersion::VERSION
  spec.authors       = ["Ania Slimak"]
  spec.email         = ["anna.slimak@lunarlogic.io"]
  spec.summary       = %q{Guard plugin for Karma runner}
  spec.description   = %q{Guard plugin for Karma runner}
  spec.homepage      = "https://github.com/lesniakania/guard-karma"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "guard", "~> 2.1"
  spec.add_dependency 'guard-compat', '~> 1.1'
end
