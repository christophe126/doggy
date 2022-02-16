class CreateTablePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :breed

      t.timestamps
    end
  end
end
