class AddShippingMethodToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :shipping_method, :string
  end
end
