class AddDetailsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :brand, :string
    add_column :products, :image_url, :string
    add_column :products, :release_date, :date
  end
end
