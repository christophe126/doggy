class UserPet < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  has_many :user_baskets
end
