class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :pid
      t.string :author
      t.integer :tid
      t.string :title
      t.string :kana
      t.string :trans
      t.string :kousakun
      t.string :kousakuk
      t.string :status
      t.string :statusdate
      t.string :original
      t.string :publisher
      t.string :editionn
      t.string :editionk

      t.timestamps
    end
  end
end
