class PensionsController < ApplicationController
  #   authorize @pension

  def index
    @pensions = policy_scope(Pension)
    # Affichage de la derniere recherche
    @user_search = UserSearch.where("user_id = #{current_user.id}").last
    # Envoi des markers de départ et d'arrivée
    @start_marker = [{
      lng: @user_search.start_lng,
      lat: @user_search.start_lat,
      image_url: helpers.asset_url('wagon.png')
    }, {
      lng: @user_search.end_lng,
      lat: @user_search.end_lat,
      image_url: helpers.asset_url('wagon.png')
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
      if request.local?
        @where = "development"
      else
        @where = "production"
      end

      @poi = @res.map do |result|
        {
          lat: result[1].latitude,
          lng: result[1].longitude,
          info_window: render_to_string(partial: "info_window", locals: { result: result }),
          image_url: Cloudinary::Utils.cloudinary_url(result[1].photos[0].key, type: "upload/v1/#{@where}")
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
    authorize @user_search
  end

  def show
    @pension = Pension.find(params[:id])
    @distance = params[:km]
    @temps = ((@distance.to_f / 80) * 60).round

    @photo_large = @pension.photos.find_by(blob_id: 1)
    @photo_thumb_1 = @pension.photos.find_by(blob_id: 2)
    @photo_thumb_2 = @pension.photos.find_by(blob_id: 3)
    @photo_thumb_3 = @pension.photos.find_by(blob_id: 4)
    @photo_thumb_4 = @pension.photos.find_by(blob_id: 5)
    @user_search = UserSearch.last

    authorize @pension
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
    if @id.count > 0
      @id_sorted = @id.sort.uniq!
      @id_sorted.each do |x|
        @array_sorted = @result_array.sort
        @array_by_id = @array_sorted.select { |result| result[1].id == x }.first
        @res_final << @array_by_id
      end
    end
    @res_final
  end
end
