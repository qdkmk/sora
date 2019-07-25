class AddColumnsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :cardurl, :string
  end
end
