class CreateUserBaskets < ActiveRecord::Migration[6.1]
  def change
    create_table :user_baskets do |t|
      t.references :user_pet, null: false, foreign_key: true
      t.timestamps
    end
  end
end
