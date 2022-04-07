require 'test_helper'

class OrderProductTest < ActiveSupport::TestCase
  # Check the presence of each columns in OrderProducts Table
  test "invalid if it has no product quantity" do
    order_product = OrderProduct.new(order: orders(:one), product: products(:one))
    order_product.valid?
    assert_not order_product.errors[:product_quantity].empty?
  end
end
