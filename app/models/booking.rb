class Booking < ApplicationRecord
  belongs_to :pension
  belongs_to :user_basket
end
