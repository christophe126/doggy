class UserBasket < ApplicationRecord
  belongs_to :user_pet
  has_many :bookings
end
