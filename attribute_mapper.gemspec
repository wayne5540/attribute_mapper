
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "attribute_mapper/version"

Gem::Specification.new do |spec|
  spec.name          = "attribute_mapper"
  spec.version       = AttributeMapper::VERSION
  spec.authors       = ["Wayne Chu"]
  spec.email         = ["wayne.5540@gmail.com"]
  spec.summary       = %q{A DSL to help mapping attributes.}
  spec.description   = %q{A DSL to help mapping attributes.}
  spec.homepage      = "https://github.com/wayne5540/attribute_mapper"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 4.2.0"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  # debugging
  spec.add_development_dependency 'pry'
end
