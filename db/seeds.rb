# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Checking for existing data..."

# Helper method to attach image from assets
def attach_image_from_assets(product, filename)
  return if product.image.attached?
  
  path = Rails.root.join("app/assets/images/#{filename}")
  product.image.attach(
    io: File.open(path),
    filename: filename,
    content_type: "image/#{filename.split('.').last == 'jpg' ? 'jpeg' : filename.split('.').last}"
  )
end

# Create our test user if it doesn't exist
puts "Ensuring test user exists..."
user = User.find_or_create_by!(email: "user@example.com") do |user|
  user.name = "Random User"
  user.password = "password"
  user.password_confirmation = "password"
end

# Create products
puts "Ensuring products exist..."
products_data = [
  {
    title: "Watch",
    brand: "Fossil",
    model: "FH256",
    description: "Good watch for men!",
    condition: "Mint",
    color: "Black",
    price: 10000,
    image_filename: "fossil.jpg"
  },
  {
    title: "Car",
    brand: "Opel",
    model: "Corsa",
    description: "Cool red car",
    condition: "Excellent",
    color: "Red",
    price: 1500000,
    image_filename: "opel.jpeg"
  },
  {
    title: "Car",
    brand: "Ferrari",
    model: "F12",
    description: "Cool sports car",
    condition: "Used",
    color: "Black",
    price: 16000000,
    image_filename: "ferrari.jpeg"
  },
  {
    title: "Computer",
    brand: "Lenovo",
    model: "ThinkPad X1 Carbon Touch",
    description: "The Lenovo ThinkPad X1 Carbon Touch is an incredibly thin and light business ultrabook that features a premium design with a 14-inch touch.",
    condition: "Used",
    color: "Black",
    price: 50000,
    image_filename: "computer.jpg"
  }
]

products_data.each do |product_data|
  image_filename = product_data.delete(:image_filename)
  
  # Find or create product based on unique attributes
  product = Product.find_or_create_by!(
    title: product_data[:title],
    brand: product_data[:brand],
    model: product_data[:model],
    user: user
  ) do |p|
    p.assign_attributes(product_data)
  end
  
  # Attach image if not already attached
  attach_image_from_assets(product, image_filename)
  puts "Processed #{product.title}"
end

puts "Seeding completed! Current counts:"
puts "- #{User.count} users"
puts "- #{Product.count} products"