class CreateRevues < ActiveRecord::Migration[5.2]
  def change
    create_table :revues do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
    add_index :revues,[:book_id,:created_at]
  end
end
