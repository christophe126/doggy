class AddReferencesToUserPets < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_pets, :user_basket, null: false, foreign_key: true
  end
end
