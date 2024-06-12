class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def add_product(product)
    current_item = cart_items.find_by(product_id: product.id)
    if current_item
      if current_item.quantity < product.quantity_available
        current_item.increment(:quantity)
        current_item.save
      else
        current_item.errors.add(:base, "No hay suficiente stock disponible para agregar más de este producto.")
      end
    else
      if product.quantity_available.present? && product.quantity_available > 0
        current_item = cart_items.build(product_id: product.id)
        current_item.save
      else
        current_item = cart_items.build(product_id: product.id)
        current_item.errors.add(:base, "Producto fuera de stock.")
      end
    end
    current_item
  end

  def remove_product(product)
    current_item = cart_items.find_by(product_id: product.id)
    if current_item
      current_item.decrement(:quantity)
      current_item.save if current_item.quantity > 0
      current_item.destroy if current_item.quantity <= 0
    end
  end
end
