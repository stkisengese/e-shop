class Product < ApplicationRecord
  belongs_to :user
  # Added image attached to products
  has_one_attached :image  

  # Validations
  validates :title, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :description, presence: true
  validates :condition, presence: true
  validates :color, presence: true
  validates :price, presence: true, 
            numericality: { greater_than_or_equal_to: 0 }

  # Scopes for filtering
  scope :by_brand, ->(brand) { where(brand: brand) if brand.present? }
  scope :by_condition, ->(condition) { where(condition: condition) if condition.present? }
  scope :price_range, ->(min, max) { 
    where('price BETWEEN ? AND ?', min, max) if min.present? && max.present? 
  }
end
