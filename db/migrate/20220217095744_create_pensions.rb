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
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
