categories = ["Zapatillas", "Remeras", "Pantalones", "Accesorios"]
categories.each do |category_name|
  Category.create!(name: category_name)
end
# Crear una categoría predeterminada si no existe
default_category = Category.find_or_create_by!(name: 'Default')
# Asignar la categoría predeterminada a productos que no tienen categoría
Product.where(category_id: nil).update_all(category_id: default_category.id)
