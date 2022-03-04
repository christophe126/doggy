class AddReferencesToBookings2 < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :user_id, null: false, foreign_key: true
  end
end
