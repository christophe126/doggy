class UserSearchesController < ApplicationController

  def index
    if params[:start].present? && params[:end].present?
      @start = geocode_reverse(params[:start])
      @end = geocode_reverse(params[:end])
      @response = geocode_route([@start.longitude, @start.latitude], [@end.longitude, @end.latitude])
    end
    @pensions = policy_scope(Pension)
  end

  def geocode_reverse(address)
    @user_search = UserSearch.create(address: address, user_id: current_user.id)
  end

  private

  def geocode_route(way_start, way_end)
    path = "https://api.mapbox.com/directions/v5/mapbox/driving/"
    coordinates = "#{way_start[0]},#{way_start[1]};#{way_end[0]},#{way_end[1]}"
    options = "?alternatives=true&geometries=geojson&overview=simplified&steps=false"
    token = "&access_token=#{ENV['MAPBOX_API_KEY']}"

    url = "#{path}#{coordinates}#{options}#{token}"
    json_serialized = URI.open(url).read
    JSON.parse(json_serialized)
  end
  
end
