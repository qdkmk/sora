class User < ApplicationRecord
  has_many :shelves, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable

 def already_shelved?(book)
   self.shelves.exists?(:book_tid => book.tid)
 end
end
