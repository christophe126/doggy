class PensionPets < ActiveRecord::Migration[6.1]
  def change
    create_table :pension_pets do |t|
      t.string :pet_size
      t.integer :price_per_day
      t.integer :space_per_animal
      t.references :pet, null: false, foreign_key: true
      t.references :pension, null: false, foreign_key: true

      t.timestamps
    end
  end
end
