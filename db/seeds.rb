# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user1 = User.create!(name: "John Kaka", email: "john@example.com", password: "password")
user2 = User.create!(name: "Jane Dada", email: "jane@example.com", password: "password")

user1.products.create!(title: "Vintage Camera", price: 150.00, model: "Canon AE-1", description: "A classic film camera.", brand: "Canon", color: "Black", condition: "Used")
user2.products.create!(title: "Leather Jacket", price: 200.00, model: "M-65", description: "A stylish leather jacket.", brand: "Alpha Industries", color: "Brown", condition: "New")