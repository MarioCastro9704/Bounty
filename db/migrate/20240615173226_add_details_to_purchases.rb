class AddDetailsToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :country, :string
    add_column :purchases, :first_name, :string
    add_column :purchases, :last_name, :string
    add_column :purchases, :address, :string
    add_column :purchases, :postal_code, :string
    add_column :purchases, :commune, :string
    add_column :purchases, :region, :string
    add_column :purchases, :phone, :string
    add_column :purchases, :payment_method, :string
  end
end
