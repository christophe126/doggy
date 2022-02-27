class UserSearch < ApplicationRecord
  belongs_to :user

  validates :start_address, presence: true
  validates :end_address, presence: true
end
