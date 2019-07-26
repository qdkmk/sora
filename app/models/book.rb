# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :shelves, dependent: :destroy

  def self.search(search)
    if search
      Book.where(['title LIKE ?', "%#{search}%"])
          .or(Book.where(['author LIKE ?', "%#{search}%"]))
    else
      Book.all
    end
  end
end
