class Shelf < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :book, optional: true
  validates :user_id, presence: true
  validates :tid, presence: true
end
