class AddBillingAddressToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :billing_address, :string
  end
end
