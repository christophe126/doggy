class UserSearchesController < ApplicationController

  def edit
    @user_pets = UserPet.where(user: current_user)
    @user_search = UserSearch.find(params[:id])
    # @user_search.update(user_search_params_date)
    authorize @user_search
  end

  def update
    @user_search = UserSearch.find(params[:id])
    @user_search.update(user_search_params_date)
    redirect_to pensions_path
    authorize @user_search
  end

  def new
    @user_search = UserSearch.new
    authorize @user_search
  end

  def create
    @user_search = UserSearch.new(user_search_params)
    @user_search.user = current_user

    @coordinates_start = search_coordinates(@user_search.start_address)
    @user_search.start_lng = @coordinates_start.first.coordinates[0]
    @user_search.start_lat = @coordinates_start.first.coordinates[1]

    @coordinates_end = search_coordinates(@user_search.end_address)
    @user_search.end_lng = @coordinates_end.first.coordinates[0]
    @user_search.end_lat = @coordinates_end.first.coordinates[1]

    # call to service for direction
    @call_api = CallMapboxApi.new([@user_search.start_lat, @user_search.start_lng], [@user_search.end_lat, @user_search.end_lng])
    @result = @call_api.geocode_route
    @user_search.direction = (@result["routes"][0]["geometry"]).to_json

    if @user_search.save
      redirect_to edit_user_search_path(@user_search)
    else
      render :new
    end
    authorize @user_search
  end

  private

  def user_search_params
    params.require(:user_search).permit(:start_address, :end_address)
  end

  def search_coordinates(address)
    Geocoder.search(address)
  end

  def user_search_params_date
    params.require(:user_search).permit(:start_date, :end_date)
  end
end
