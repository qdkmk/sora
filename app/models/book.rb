class Book < ApplicationRecord
  def self.search(search)
    if search
      Book.where(['title LIKE ?', "%#{search}%"]).or(Book.where(['author LIKE ?', "%#{search}%"]))
    else
      Book.all
    end
  end
end
