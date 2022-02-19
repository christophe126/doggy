class CreateUserSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :user_searches do |t|
      t.string :start_address
      t.float :start_lng
      t.float :start_lat
      t.string :end_address
      t.float :end_lng
      t.float :end_lat
      t.string :direction
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
