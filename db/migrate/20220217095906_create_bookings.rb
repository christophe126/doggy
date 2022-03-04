class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :status, default: false
      t.integer :total_price
      t.references :pension, null: false, foreign_key: true
      t.timestamps
    end
  end
end
