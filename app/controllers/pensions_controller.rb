class PensionsController < ApplicationController
  #   authorize @pension

  def index
    @pensions = policy_scope(Pension)

    # Affichage de la derniere recherche
    @user_search = UserSearch.where("user_id = #{current_user.id}").last
    # Envoi des markers de départ et d'arrivée
    @start_marker = [{
      lng: @user_search.start_lng,
      lat: @user_search.start_lat
    }, {
      lng: @user_search.end_lng,
      lat: @user_search.end_lat
    }]
    # Récupération de la direction en base
    @geoson = @user_search.direction

    # ---------- Recherche des pensions en fonction de la direction ----------
    @search_waypoints = JSON.parse(@geoson)["coordinates"]
    # recherche des pensions autour des waypoints
    @result_array = []
    @res = recup_poi(@search_waypoints)
    # Si pas de résultat alors on envoi rien
    if @res.count.zero?
      @poi = {}
    else
      # Si on trouve des pensions dans le tableau on supprime les doublons
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
  end

  def new
    @user_search = UserSearch.new
    authorize @pension_search
  end

  def create
    # pour une nouvelle recherche
    @user_search = UserSearch.new(user_search_params)
    @user_search.user = current_user

    # Search latitutde and longitude for :  From and To
    @coordinates_start = CallGeocoder.new(@user_search.start_address)
    @user_search.start_lat = @coordinates_start.geocode_address.first.coordinates[0]
    @user_search.start_lng = @coordinates_start.geocode_address.first.coordinates[1]
    @coordinates_end = CallGeocoder.new(@user_search.end_address)
    @user_search.end_lat = @coordinates_end.geocode_address.first.coordinates[0]
    @user_search.end_lng = @coordinates_end.geocode_address.first.coordinates[1]
    # call to service for direction
    @call_api = CallMapboxApi.new([@user_search.start_lng, @user_search.start_lat], [@user_search.end_lng, @user_search.end_lat])
    @result = @call_api.geocode_route
    @user_search.direction = (@result["routes"][0]["geometry"]).to_json

    if @user_search.save
      redirect_to pensions_path
    else
      render :new
    end
    authorize @user_search
  end

  def show
    # TODO: filters pension by pension_id
    @pension = Pension.find(params[:id])
    authorize @pension
  end

  private

  # recuprations des datas du formulaires pour une nouvelle recherche
  def user_search_params
    params.require(:user_search).permit(:start_address, :end_address, :start_date, :end_date, photos: [])
  end

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
