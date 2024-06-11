class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user_id, :product_id, :date, :status, presence: true
  validate :sufficient_inventory

  after_create :decrease_product_quantity

  private

  def sufficient_inventory
    errors.add(:base, 'Not enough inventory') if product.quantity_available < 1
  end

  def decrease_product_quantity
    product.update(quantity_available: product.quantity_available - 1)
  end
end
