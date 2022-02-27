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
    # @user_search = UserSearch.find(params[:user_search_id])
    # @pension_pet = PensionPet.find(params[:pension_pet_id])
  end

  def create
    @booking = Booking.new(booking_params)
    start_date = Date.parse(params[:booking][:start_date])
    end_date = Date.parse(params[:booking][:end_date])
    total_days = (end_date - start_date) + 1
    price_per_day = @pension.price_per_day
    total_price = price_per_day * total_days
    total_price = total_price.to_i
    @booking.total_price = total_price
    @booking.user = current_user
    @booking.pension = @pension
    if @booking.save
      redirect_to bookings_path
    else
      render :show
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end
end
