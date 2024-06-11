class RemoveAvailableFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :available, :boolean
  end
end
