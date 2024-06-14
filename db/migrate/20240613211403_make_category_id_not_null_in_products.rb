class MakeCategoryIdNotNullInProducts < ActiveRecord::Migration[7.1]
  def change
    Product.reset_column_information
    reversible do |dir|
      dir.up { Product.where(category_id: nil).update_all(category_id: Category.first.id) }
    end
    change_column_null :products, :category_id, false
  end
end
