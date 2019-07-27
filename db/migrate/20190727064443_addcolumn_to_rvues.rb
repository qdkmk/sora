class AddcolumnToRvues < ActiveRecord::Migration[5.2]
  def change
    add_column :revues, :title, :string
  end
end
