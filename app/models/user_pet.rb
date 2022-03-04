class UserPet < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  belongs_to :user_basket
end
