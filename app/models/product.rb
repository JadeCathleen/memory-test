class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products

  validates :product_code, :product_description, :price, presence: true
  validates :product_code, :product_description, uniqueness: true
end
