require "spec_helper"
require 'search_geometry_iowa/searcher'

describe Searcher, :vcr_on do
  let(:search) { Searcher.new('T91N','R46W', 5) }
  let(:invalid_search) { Searcher.new(1, nil, 5) }

  it "should get the geoserver URL" do
    expect(search.geo_server_url).to eq("https://devgis.mmp360.com")
  end

  it "should return true if have valid params" do
    expect(search.valid_params?).to eq(true)
  end

  it "should rise an exception if params are invalid" do
    expect { invalid_search }.to raise_error(RuntimeError)
  end

  it "should get a correct URL" do
    expect(search.format_url).to eq("https://devgis.mmp360.com/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=plss:plss&cql_filter=(township%20=%20%27T91N%27%20AND%20range%20=%20%27R46W%27AND%20section%20=%205)&outputFormat=text/javascript&srsName=EPSG:4326")
  end

  it "should get correct response from geoserver" do
    VCR.use_cassette('searches') do
      expect(search.get_response).to match(/\{\"type\"\:\"MultiPolygon\"\,\"coordinates\"\:(\[){4}/)
    end
  end

end
