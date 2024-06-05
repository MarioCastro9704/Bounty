class Product < ApplicationRecord
  belongs_to :user
  has_many :purchases

  validates :category, :price, :description, :model, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :available, inclusion: { in: [true, false] }
end
