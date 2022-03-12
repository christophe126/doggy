class UserSearch < ApplicationRecord
  belongs_to :user

  validates :start_address, presence: true, length: { minimum: 2 }
  validates :end_address, presence: true, length: { minimum: 2 }
end
