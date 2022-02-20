class CallMapboxApi

  def initialize(way_start, way_end)
    @way_start = way_start
    @way_end = way_end
  end


  def geocode_route
    path = "https://api.mapbox.com/directions/v5/mapbox/driving/"
    coordinates = "#{@way_start[0]},#{@way_start[1]};#{@way_end[0]},#{@way_end[1]}"
    options = "?alternatives=true&geometries=geojson&overview=simplified&steps=false"
    token = "&access_token=#{ENV['MAPBOX_API_KEY']}"

    url = "#{path}#{coordinates}#{options}#{token}"
    json_serialized = URI.open(url).read
    JSON.parse(json_serialized)
  end

end
