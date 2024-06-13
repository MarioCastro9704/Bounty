# db/migrate/[timestamp]_make_category_id_not_null_in_products.rb
class MakeCategoryIdNotNullInProducts < ActiveRecord::Migration[6.0]
  def change
    change_column_null :products, :category_id, false
  end
end
