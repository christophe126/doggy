class UserBasket < ApplicationRecord
  has_many :user_pets
  has_many :bookings
end
