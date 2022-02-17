class Pension < ApplicationRecord
  has_one :user
  has_many :pension_pets
  has_many :bookings
end
