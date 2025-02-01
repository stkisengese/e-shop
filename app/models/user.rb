class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # Devise modules for authentication
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add association with products
  has_many :products, dependent: :destroy

  # Add association with the cart
  has_one :cart, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

end
