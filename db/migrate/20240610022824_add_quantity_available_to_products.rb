class AddQuantityAvailableToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :quantity_available, :integer
  end
end
