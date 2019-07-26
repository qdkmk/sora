# frozen_string_literal: true

class RemoveColumnsFromBooks < ActiveRecord::Migration[5.2]
  def up
    remove_column :books, :kana
    remove_column :books, :trans
    remove_column :books, :kousakun
    remove_column :books, :kousakuk
    remove_column :books, :status
    remove_column :books, :statusdate
    remove_column :books, :original
    remove_column :books, :publisher
    remove_column :books, :editionn
    remove_column :books, :editionk
  end

  def down
    add_column :books, :kana, :string
    add_column :books, :trans, :string
    add_column :books, :kousakun, :string
    add_column :books, :kousakuk, :string
    add_column :books, :status, :string
    add_column :books, :statusdate, :string
    add_column :books, :original, :string
    add_column :books, :publisher, :string
    add_column :books, :editionn, :string
    add_column :books, :editionk, :string
  end
end
