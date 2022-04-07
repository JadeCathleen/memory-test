class Order < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  belongs_to :product

  validates :order_code, :order_date, presence: true
end
