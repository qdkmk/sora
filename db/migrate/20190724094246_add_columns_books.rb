class AddColumnsBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :ranking, :integer
    add_column :books, :access,  :integer
    add_column :books, :characount,  :integer
    add_column :books, :minutes, :integer
  end
end
