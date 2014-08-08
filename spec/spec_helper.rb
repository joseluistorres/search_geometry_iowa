require 'rubygems'
require 'webmock/rspec'
require 'vcr'
require 'yaml'

config_path = 'geoserver.yml'
hash_geo = YAML.load_file(config_path)['test']
GEOSERVER = Hash[hash_geo.map{|(k,v)| [k.to_sym,v]}]

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end
VCR.turn_off! # turn off VCR by default

RSpec.configure do |config|

  config.before(:all, :vcr_on) do
    VCR.turn_on!
  end

end
