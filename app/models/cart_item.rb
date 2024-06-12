class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  before_save :set_default_quantity

  validate :quantity_within_stock

  private

  def set_default_quantity
    self.quantity ||= 1
  end

  def quantity_within_stock
    if quantity.present? && product.quantity_available.present? && quantity > product.quantity_available
      errors.add(:quantity, "exceeds stock available")
    end
  end
end
