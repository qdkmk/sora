# frozen_string_literal: true

class User < ApplicationRecord
  has_many :shelves, dependent: :destroy
  has_many :revues, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
end
