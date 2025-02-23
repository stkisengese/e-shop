class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  
  MAX_QUANTITY = 99
  validates :quantity, presence: true, 
  numericality: { greater_than: 0, 
                less_than_or_equal_to: MAX_QUANTITY, 
                only_integer: true }

  def total_price
    product.price * quantity
  end
end
