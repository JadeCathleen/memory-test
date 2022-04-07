class Customer < ApplicationRecord
  has_many :orders

  validates :country, :customer_code, presence: true
  validates :customer_code, uniqueness: true
end
