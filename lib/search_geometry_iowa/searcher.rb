require 'nokogiri'

class Searcher
  attr_accessor :tier, :range, :section

  def initialize(tier, range, section)
    @tier = sanitize_str tier
    @range = sanitize_str range
    @section = sanitize_str section
    raise 'Invalid parameters' unless valid_params?
  end

  def sanitize_str(str)
    URI.escape str.to_s.upcase
  end

  def geo_server_url
    GEOSERVER[:url]
  end

  def valid_params?
    return false if @tier.nil? || @range.nil?
    return true if match_me(@tier, 'T', 'N|S') && match_me(@range, 'R', 'W|E')
    false
  end

  def match_me(str, first_letter, last_letter)
    str.match(/#{first_letter}[0-9]{1,2}(#{last_letter})/)
  end

  def get_response
    call_url(format_url)
  end

  def format_url
    url = "/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=plss:plss"
    url = url + "&cql_filter=(township%20=%20%27#{@tier}%27"
    url = url + "%20AND%20range%20=%20%27#{@range}%27AND%20section%20=%20#{@section})"
    geo_server_url + url + "&outputFormat=text/javascript&srsName=EPSG:4326"
  end

  def call_url(url)
    Net::HTTP.get(URI.parse(url))
  end

  # @TODO remove to a libtool may be
  def transform_to_multipolygon(response)
    response.gsub!(/(\[){3}(.*)(\]){3}/, "[#{response.match(/(\[){3}(.*)(\]){3}/)}]")
    response.gsub!(/Polygon/, 'MultiPolygon')
    response
  end
end
