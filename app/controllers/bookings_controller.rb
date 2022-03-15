class BookingsController < ApplicationController
  skip_after_action :verify_authorized

  def index
    @past_bookings = policy_scope(Booking).where("end_date < :today", {today: Date.today}).order(created_at: :desc)
    @future_bookings = policy_scope(Booking).where("end_date >= :today", {today: Date.today}).order(created_at: :desc)
    @user1 = User.find(1)
    setup_video_call_token
  end

  def new
    @booking = Booking.new # (booking_params)
    @pension = Pension.find(params[:pension_id])
    @user_basket = UserPet.select(:user_basket_id).where(user: current_user).last
    @user_pets = UserPet.where(user_basket_id: @user_basket.user_basket_id)
    @current_user = current_user
    @user_search = UserSearch.where(user_id: current_user).last
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
    @user_search = UserSearch.where(user_id: current_user).last
    @user_basket = UserPet.select(:user_basket_id).where(user: current_user).last
    @user_pets = UserPet.where(user_basket_id: @user_basket.user_basket_id)

    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.user_basket_id = @user_basket.user_basket_id

    @res = []
    @sub_total = []
    @nb_jours = Nbjour.new(@user_search.start_date, @user_search.end_date)
    @total_days = @nb_jours.cal_nb_jours

    @user_pets.each do |pet|
      @res << [pet.name, PensionPet.select(:price_per_day).where(pet_id: pet.pet_id, pension_id: @pension.id)]
      @sub_total << @res.first[1].first.price_per_day
    end
    @grant_total = @sub_total.sum * @total_days

    if @booking.save
      redirect_to edit_pension_booking_path(@pension, @booking)
    else
      render :new
    end
  end

  def edit
    @pension = Pension.find(params[:pension_id])
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(edit_booking_params)
    redirect_to pages_path
  end

  def show
    # TODO
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :user_basket_id, :pension_id)
  end

  def edit_booking_params
    params.require(:booking).permit(:status)
  end

  def setup_video_call_token
    # No chatting with yourself
    # return if @user == current_user
    @user2 = User.find(2)
    twilio = TwilioService.new
    twilio.generate_token(@user1, @user2)
    @twilio_jwt = twilio.jwt
    @room_id = twilio.room_id
  end
end
