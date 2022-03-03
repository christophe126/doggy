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
      # Si on trouve des pensions dans le tableau #on supprime les doublons
      # @result = @res.uniq!
      #-------Envoi des markers waypoints-----------#
      @poi = @res.map do |result|
        {
          lat: result[1].latitude,
          lng: result[1].longitude,
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
    @user_search = UserSearch.new
    # # pour une nouvelle recherche

    # @user_search = UserSearch.new(user_search_params)
    # @user_search.user = current_user

    # # Search latitutde and longitude for :  From and To
    # @coordinates_start = CallGeocoder.new(@user_search.start_address)
    # @user_search.start_lat = @coordinates_start.geocode_address.first.coordinates[0]
    # @user_search.start_lng = @coordinates_start.geocode_address.first.coordinates[1]
    # @coordinates_end = CallGeocoder.new(@user_search.end_address)
    # @user_search.end_lat = @coordinates_end.geocode_address.first.coordinates[0]
    # @user_search.end_lng = @coordinates_end.geocode_address.first.coordinates[1]
    # # call to service for direction
    # @call_api = CallMapboxApi.new([@user_search.start_lng, @user_search.start_lat], [@user_search.end_lng, @user_search.end_lat])
    # @result = @call_api.geocode_route
    # @user_search.direction = (@result["routes"][0]["geometry"]).to_json

    # if @user_search.save
    #   redirect_to pensions_path
    # else
    #   render :new
    # end
    # authorize @user_search
  end

  def show
    @pension = Pension.find(params[:id])
    authorize @pension
    @photo_large = @pension.photos.find_by(blob_id: 1)
    @photo_thumb_1 = @pension.photos.find_by(blob_id: 2)
    @photo_thumb_2 = @pension.photos.find_by(blob_id: 3)
    @photo_thumb_3 = @pension.photos.find_by(blob_id: 4)
    @photo_thumb_4 = @pension.photos.find_by(blob_id: 5)
  end

  private

  # recuprations des datas du formulaires pour une nouvelle recherche
  def user_search_params
    params.require(:user_search).permit(:start_address, :end_address, :start_date, :end_date, photos: [])
  end

  def recup_poi(waypoints)
    @id = []
    @res_final = []

    waypoints.each do |waypoint|
      @search_records = Pension.near([waypoint[1], waypoint[0]], 50, units: :km)

      @search_records.each do |record|
        # calcul de la distance entre deux points
        nbmil = Geocoder::Calculations.distance_between([waypoint[1], waypoint[0]], [record.latitude, record.longitude])
        nbkm = (nbmil / 0.621371192)
        # stockage dans @result_array des elements
        # [pension:id, instance pension, waypoint, distance entre pension et waypoint]
        @result_array << [record.id, record, nbkm, waypoint]
        @id << record.id
      end
    end

    @id_sorted = @id.sort.uniq!
    @id_sorted.each do |x|
      @array_sorted = @result_array.sort
      @array_by_id = @array_sorted.select { |result| result[1].id == x }.first
      @res_final << @array_by_id
    end
    @res_final
  end
end
