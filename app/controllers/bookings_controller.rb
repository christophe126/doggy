class BookingsController < ApplicationController
  skip_after_action :verify_authorized

  def index
    @pensions = policy_scope(Pension)
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new # (booking_params)
    @pension = Pension.find(params[:pension_id])
    @user_pets = UserPet.where(user: current_user)
    
    # @pension_pet = PensionPet.find(params[:pension_pet_id])
    @current_user = current_user
    @user_search = UserSearch.where(user_id: @current_user).last
    # @res = []
    # @user_pets.each do |pet|
    #   @res << PensionPet.where(pet_id: pet.id).where(pension_id: @pension.id)
    #   # PensionPet.where("pet_id = 2 and pension_id = 4").count
    # end
    # raise
  end

  def create
    # @booking = Booking.new(booking_params)
    # start_date = Date.parse(params[:booking][:start_date])
    # end_date = Date.parse(params[:booking][:end_date])
    # total_days = (end_date - start_date) + 1
    # price_per_day = @pension.price_per_day
    # total_price = price_per_day * total_days
    # total_price = total_price.to_i
    # @booking.total_price = total_price
    # @booking.user = current_user
    # @booking.pension = @pension
    # if @booking.save
    #   redirect_to bookings_path
    # else
    #   render :show
    # end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end
end
