class Order < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  has_many :order_products
  has_many :products, through: :order_products

  validates :order_code, :order_date, presence: true
  validates :order_code, uniqueness: true
end
