# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'search_geometry_iowa/version'

Gem::Specification.new do |spec|
  spec.name          = "Search geometry for IA"
  spec.version       = SearchGeometryIowa::VERSION
  spec.authors       = ["JoseLuis Torres"]
  spec.email         = ["jl@joseluistorres.me"]
  spec.summary       = %q{Make searches by Range, Tier and Section}
  spec.description   = %q{Shared library to search through the GeoServer by Range, Tier and Section}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", '~> 0'
  spec.add_development_dependency 'rspec', '~> 2.13'
  spec.add_development_dependency 'vcr', '~> 0'
  spec.add_development_dependency 'webmock', '~> 0'
  spec.add_dependency 'nokogiri', '~> 0'

end
