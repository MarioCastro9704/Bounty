class Product < ApplicationRecord
  belongs_to :user
  has_many :purchases

  before_validation :sanitize_price

  validates :product_type, :price, :description, :model, :brand, :image_url, :release_date, :quantity_available, :size, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity_available, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 999999 }

  private

  def sanitize_price
    self.price = price.to_s.gsub(/[^\d,]/, '').gsub(',', '.').to_f if price.present?
  end
end
