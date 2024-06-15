# db/seeds.rb
# Eliminar
User.destroy_all
Category.destroy_all
Product.destroy_all

# Crear categorías
categories = %w[Zapatillas Remeras Pantalones Accesorios]
categories.each do |category|
  Category.find_or_create_by(name: category)
end

# Crear usuarios de prueba
user = User.find_or_create_by(email: 'test@example.com') do |u|
  u.password = 'password'
  u.password_confirmation = 'password'
end

# Crear productos
products = [
  { model: 'Air Max 90', description: 'Zapatillas icónicas de edición limitada', brand: 'Nike', price: 150.00, release_date: '2023-05-15', quantity_available: 10, size: '42', category: 'Zapatillas', user: user },
  { model: 'Classic Tee', description: 'Remera clásica de edición limitada', brand: 'Supreme', price: 80.00, release_date: '2023-06-10', quantity_available: 20, size: 'M', category: 'Remeras', user: user },
  { model: 'Slim Fit Jeans', description: 'Pantalones ajustados de edición limitada', brand: 'Levi\'s', price: 120.00, release_date: '2023-04-22', quantity_available: 15, size: '32', category: 'Pantalones', user: user },
  { model: 'Leather Belt', description: 'Cinturón de cuero de edición limitada', brand: 'Gucci', price: 200.00, release_date: '2023-03-12', quantity_available: 5, size: 'L', category: 'Accesorios', user: user }
]

products.each do |product|
  category = Category.find_by(name: product[:category])
  Product.create!(
    model: product[:model],
    description: product[:description],
    brand: product[:brand],
    price: product[:price],
    release_date: product[:release_date],
    quantity_available: product[:quantity_available],
    size: product[:size],
    category: category,
    user: product[:user]
  )
end

puts "Seed completed successfully!"
