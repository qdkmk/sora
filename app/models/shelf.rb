class Shelf < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :book, optional: true
  validates :user_id, presence: true
  validates :book_tid, presence: true
end
