class CreateUserSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :user_searches do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :user

      t.timestamps
    end
  end
end
