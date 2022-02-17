class Pension < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :pension_pets
  has_many :bookings


end
