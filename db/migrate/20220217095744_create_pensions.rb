class CreatePensions < ActiveRecord::Migration[6.1]
  def change
    create_table :pensions do |t|
      t.string :address
      t.string :name
      t.string :departement
      t.string :description
      t.string :region
      t.integer :space_left
      t.float :latitude
      t.float :longitude
      t.integer :rating, null: false, default: 0
      t.integer :from_price, null: false, default: 31
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
