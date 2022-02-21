class Pension < ApplicationRecord
  has_many :pension_pets
  has_many :bookings
  belongs_to :user

  geocoded_by latitude: :lat, longitude: :lon
end
