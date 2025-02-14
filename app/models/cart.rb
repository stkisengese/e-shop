class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :line_items, dependent: :destroy

  # Add items to the cart
  def add_product(product)
    line_item = line_items.find_or_initialize_by(product: product)
    line_item.quantity ||= 0
    line_item.quantity += 1
    line_item.save
  end

  # Calculate the total price of items in the cart
  def total_price
    line_items.sum { |item| item.product.price * item.quantity }
  end

  def decrease_quantity(product)
    line_item = line_items.find_by(product: product)
    if line_item
      if line_item.quantity > 1
        line_item.update(quantity: line_item.quantity - 1)
      else
        line_item.update(quantity: 1)
      end
    end
  end
end