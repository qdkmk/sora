class Revue < ApplicationRecord
  belongs_to :user
  belongs_to :book
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :content, presence: true, length: { maximum: 1500 }
  validates :title, presence: true, length: { maximum: 30 }
end
