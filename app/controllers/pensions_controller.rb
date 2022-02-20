class PensionsController < ApplicationController
  #   authorize @pension

  def index
    @pensions = policy_scope(Pension)
    @pensions = Pension.all

    @start_marker = [{
      lat: UserSearch.first.start_lat,
      lng: UserSearch.first.start_lng
    }, {
      lat: UserSearch.first.end_lat,
      lng: UserSearch.first.end_lng
    }]

    @geoson = build_geojson
  end

  def build_geojson
    {
      type: "Feature",
      features: @user_route
    }
  end

  def user_route
    {
      type: 'Feature',
      geometry: {
        type: 'LineString',
        coordinates: User.first.direction
      }
    }
  end
end
