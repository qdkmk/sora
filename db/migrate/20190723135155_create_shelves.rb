class CreateShelves < ActiveRecord::Migration[5.2]
  def change
    create_table :shelves do |t|
      t.integer :user_id
      t.integer :tid

      t.timestamps
      t.index :user_id
      t.index :tid
      t.index [:user_id, :tid], unique: true
    end
  end
end
