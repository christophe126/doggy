class PensionsController < ApplicationController
  #   authorize @pension

  def index
    @pensions = policy_scope(Pension)

    # @pension = Pension.all
    @user_search = UserSearch.where("user_id = #{current_user.id}").last
    @start_marker = [{
      lng: @user_search.start_lng,
      lat: @user_search.start_lat
    }, {
      lng: @user_search.end_lng,
      lat: @user_search.end_lat
    }]
    @geoson = @user_search.direction

    # ---------- Recherche des pensions en fonction de la direction ----------
    @search_waypoints = JSON.parse(@geoson)["coordinates"]
    # recherche des pensions
    @result_array = []
    @res = recup_poi(@search_waypoints)
    if @res.count.zero?
      @poi = {}
    else
      @result = @res.uniq!
      #-------Envoi des markers waypoints-----------#
      @poi = @result.map do |result|
        {
          lat: result.latitude,
          lng: result.longitude,
          info_window: render_to_string(partial: "info_window", locals: { result: result })
        }
      end

    end
    # ------------------------------------------------------------------------

    @new_search = UserSearch.new
  end

  private

  def recup_poi(waypoints)
    waypoints.each do |waypoint|
      @search_records = Pension.near([waypoint[1], waypoint[0]], 50, units: :km)
      @search_records.each do |record|
        @result_array << record
      end
    end
    @result_array
  end
end
