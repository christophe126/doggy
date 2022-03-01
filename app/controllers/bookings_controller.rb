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
    @pension = Pension.find(params[:pension_id])
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to edit_pension_booking_path(@pension,@booking)
    else
      render :show
    end
  end

  def edit
    @booking = Booking.update(edit_booking_params)
    @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :user_pet_id, :pension_id)
  end

  def edit_booking_params
    params.require(:booking).permit(:status)
  end

end
