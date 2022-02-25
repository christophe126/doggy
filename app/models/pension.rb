class Pension < ApplicationRecord
  has_many :pension_pets
  has_many :bookings
  belongs_to :user

  has_many_attached :photos

  geocoded_by latitude: :lat, longitude: :lon
end
