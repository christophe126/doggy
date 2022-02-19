class UserSearch < ApplicationRecord

  # geocoded_by :start_address
  # after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user_search
end
