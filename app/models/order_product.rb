class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_one :user, through: :order

  validates :product_quantity, presence: true

  def revenue
    product_quantity * product.price
  end
end
