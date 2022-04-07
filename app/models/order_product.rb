class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :product_quantity, presence: true
end
