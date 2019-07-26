# frozen_string_literal: true

class RemoveIndexFromShelves < ActiveRecord::Migration[5.2]
  def change
    remove_index :shelves, column: [:user_id, :book_tid]
    add_column :shelves, :pid, :integer
    add_index :shelves, [:user_id, :book_tid, :pid], unique: true
  end
end
