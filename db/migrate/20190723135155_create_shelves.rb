class CreateShelves < ActiveRecord::Migration[5.2]
  def change
    create_table :shelves do |t|
      t.integer :user_id
      t.integer :book_tid

      t.timestamps
      t.index :user_id
      t.index :book_tid
      t.index [:user_id,:book_tid], unique:true
    end
  end
end
