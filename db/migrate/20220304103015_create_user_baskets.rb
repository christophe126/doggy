class CreateUserBaskets < ActiveRecord::Migration[6.1]
  def change
    create_table :user_baskets do |t|
      t.string :name
      t.timestamps
    end
  end
end
