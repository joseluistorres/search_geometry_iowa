require "search_geometry_iowa/version"
require "search_geometry_iowa/searcher"

module SearchGeometryIowa
  def by_tier_and_range(args)
    Searcher.new(args[:tier], args[:range], args[:section]).get_response
  end
end
