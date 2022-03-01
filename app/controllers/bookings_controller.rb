class BookingsController < ApplicationController
  skip_after_action :verify_authorized

  def index
    @pensions = policy_scope(Pension)
    @bookings = Booking.where(user_id: current_user)
  end

  def new
    @booking = Booking.new # (booking_params)
    @pension = Pension.find(params[:pension_id])
    @user_pets = UserPet.where(user: current_user)
    @current_user = current_user
    @user_search = UserSearch.where(user_id: @current_user).last
    @nb_jours = Nbjour.new(@user_search.start_date, @user_search.end_date)
    @total_days = @nb_jours.cal_nb_jours

    @res = []
    @sub_total = []
    @user_pets.each do |pet|
      @res << [pet.name, PensionPet.select(:price_per_day).where(pet_id: pet.pet_id, pension_id: @pension.id)]
      @sub_total << @res.first[1].first.price_per_day
    end
    @grant_total = @sub_total.sum * @total_days
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
