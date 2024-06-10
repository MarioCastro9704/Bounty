class Product < ApplicationRecord
  belongs_to :user
  has_many :purchases

  validates :category, :price, :description, :model, :brand, :image_url, :release_date, :quantity_available, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity_available, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 999 }
end
