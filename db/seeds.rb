# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
# db/seeds.rb
# Crear categorías de ejemplo
categories = ["Zapatillas", "Remeras", "Pantalones", "Accesorios"]
categories.each do |category_name|
  Category.create!(name: category_name)
end

# Crear una categoría predeterminada si no existe
default_category = Category.find_or_create_by!(name: 'Default')

# Asignar la categoría predeterminada a productos que no tienen categoría
Product.where(category_id: nil).update_all(category_id: default_category.id)
categories = ["Zapatillas", "Remeras", "Pantalones", "Accesorios"]
categories.each do |category_name|
  Category.create!(name: category_name)
end
# Crear una categoría predeterminada si no existe
default_category = Category.find_or_create_by!(name: 'Default')
# Asignar la categoría predeterminada a productos que no tienen categoría
Product.where(category_id: nil).update_all(category_id: default_category.id)
