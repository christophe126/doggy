class AddReferencesToBookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :user_basket, null: false, foreign_key: true
  end
end
