class UserPetsController < ApplicationController
  def index
    @pensions = policy_scope(Pension)
    @user_pets = UserPet.all
  end
end
