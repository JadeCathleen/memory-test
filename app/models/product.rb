class Product < ApplicationRecord
  has_many :orders

  validates :product_code, :product_description, :price, presence: true
  validates :product_code, :product_description, uniqueness: true
end
