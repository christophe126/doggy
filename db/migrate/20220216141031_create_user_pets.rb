class CreateUserPets < ActiveRecord::Migration[6.1]
  def change
    create_table :user_pets do |t|
      t.string :name
      t.string :size
      t.references :pet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
