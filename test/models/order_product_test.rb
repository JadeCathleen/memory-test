require 'test_helper'

class OrderProductTest < ActiveSupport::TestCase
  # Check the presence of each columns in OrderProducts Table
  test "invalid if it has no product quantity" do
    order = Order.new(order_code: 'test',user: users(:regular), customer: customers(:one), quantity: 2, order_date: Time.now)
    order_product = OrderProduct.new(order: order, product: products(:one))

    order_product.valid?
    assert_not order_product.errors[:product_quantity].empty?
  end
end
