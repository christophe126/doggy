class Pension < ApplicationRecord
  has_many :pension_pets
  has_many :bookings


end
