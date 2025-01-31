json.extract! product, :id, :title, :price, :model, :description, :brand, :color, :condition, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
