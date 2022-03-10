class UserPetsController < ApplicationController
  def index

    @current_user = current_user
    @user_basket = UserPet.select(:user_basket_id).where(user: current_user).last
    @user_pets = UserPet.where(user_basket_id: @user_basket.user_basket_id)
    @pensions = policy_scope(Pension)
    raise
  end
end
