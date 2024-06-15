class AddCartIdToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :cart_id, :integer
  end
end
