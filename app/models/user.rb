class User < ApplicationRecord
  has_many :address_books, dependent: :delete_all
  has_many :contacts, dependent: :delete_all

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :registerable, :recoverable
end
