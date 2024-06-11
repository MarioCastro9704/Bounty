class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :purchases
  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
