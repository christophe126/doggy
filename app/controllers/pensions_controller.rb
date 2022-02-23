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
    @search_waypoints = JSON.parse(@geoson)["coordinates"]
    # recherche des pensions
    @result_array = []
    @res = recup_poi(@search_waypoints)
    @result = @res.uniq!
    #-------Envoi des markers-----------#

    @poi = @result.map do |result|
      {
        lat: result.latitude,
        lng: result.longitude,
        info_window: render_to_string(partial: "info_window", locals: { result: result })
      }
    end
    #raise
    # ------------------------------------------------------------------------
  end

  private

  def recup_poi(waypoints)
    waypoints.each do |waypoint|
      @search_records = Pension.near([waypoint[1], waypoint[0]], 50, units: :km)
      @search_records.each do |record|
        #@result_array << [record.id, record.name, record.longitude, record.latitude]
        @result_array << record
      end
    end
    @result_array
  end
end
