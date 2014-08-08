# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'search_geometry_iowa/version'

Gem::Specification.new do |spec|
  spec.name          = "search_geometry_iowa"
  spec.version       = SearchGeometryIowa::VERSION
  spec.authors       = ["JoseLuis Torres"]
  spec.email         = ["jl@joseluistorres.me"]
  spec.summary       = %q{Make searches by Range, Tier and Section}
  spec.description   = %q{Shared library to search through the GeoServer by Range, Tier and Section}
  spec.homepage      = "https://github.com/joseluistorres/search_geometry_iowa"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", '~> 10.3.2'
  spec.add_development_dependency 'rspec', '~> 2.13'
  spec.add_development_dependency 'vcr', '~> 2.9.2'
  spec.add_development_dependency 'webmock', '~> 1.18.0'
  spec.add_dependency 'nokogiri', '~> 1.6.2'

end
