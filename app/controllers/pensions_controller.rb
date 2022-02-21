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
    @geoson = UserSearch.first.direction


  # ---------- Recherche des pensions en fonction de la direction ----------
  @search_waypoint = JSON.parse(@geoson)["coordinates"]

  # ------------------------------------------------------------------------
  end

end
