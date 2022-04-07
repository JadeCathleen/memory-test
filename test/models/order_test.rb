require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # Check the presence of each columns of Orders Table
  test "invalid if it has no order_code" do
    order = Order.new(user: users(:regular), customer: customers(:one), order_date: Time.now)
    order.valid?
    assert_not order.errors[:order_code].empty?
  end

  test "invalid if it has no order_date" do
    order = Order.new(user: users(:regular), customer: customers(:one), order_code: 'test')
    order.valid?
    assert_not order.errors[:order_date].empty?
  end

  test "invalid if it has no user attached" do
    order = Order.new(order_code: 'test', customer: customers(:one), order_date: Time.now)
    order.valid?
    assert_not order.errors[:user].empty?
  end

  test "invalid if it has no customer attached" do
    order = Order.new(order_code: 'test', user: users(:regular), order_date: Time.now)
    order.valid?
    assert_not order.errors[:customer].empty?
  end

  # Check the uniqueness of order_code (order_id in csv)
  test "invalid if the order code already exists" do
    Order.create(order_code: "test", customer: customers(:one), user: users(:regular), order_date: Time.now)
    order = Order.new(order_code: "test", customer: customers(:two), user: users(:regular), order_date: Time.now)
    order.valid?
    assert_not order.errors[:order_code].empty?
  end
end
