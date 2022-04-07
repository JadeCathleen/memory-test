require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # Check the presence of each columns of Customer Table
  test "invalid if it has no customer_code" do
    customer = Customer.new(country: "France")
    customer.valid?
    assert_not customer.errors[:customer_code].empty?
  end

  test "invalid if it has no country" do
    customer = Customer.new(customer_code: "test")
    customer.valid?
    assert_not customer.errors[:country].empty?
  end

  # Check the uniqueness of customer_code
  test "customer_code is unique for each customer" do
    Customer.create(customer_code: "test", country: "France")
    customer = Customer.new(customer_code: "test", country: "UK")
    customer.valid?
    assert_not customer.errors[:customer_code].empty?
  end
end
