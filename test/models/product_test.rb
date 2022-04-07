require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # Check the presence of each columns of Product Table
  test "invalid if it has no product_code" do
    product = Product.new(product_description: "test", price: 9.99)
    product.valid?
    assert_not product.errors[:product_code].empty?
  end

  test "invalid if it has no product_description" do
    product = Product.new(product_code: "test", price: 9.99)
    product.valid?
    assert_not product.errors[:product_description].empty?
  end

  test "invalid if it has no price" do
    product = Product.new(product_code: "test", product_description: "test")
    product.valid?
    assert_not product.errors[:price].empty?
  end

  # Check the uniqueness of product_code and product_description
  test "product_code is unique for each product" do
    Product.create(product_code: "test", product_description: "test1", price: 7.99)
    product = Product.new(product_code: "test", product_description: "test2", price: 8.99)
    product.valid?
    assert_not product.errors[:product_code].empty?
  end

  test "product_description is unique for each product" do
    Product.create(product_code: "test1", product_description: "test", price: 7.99)
    product = Product.new(product_code: "test2", product_description: "test", price: 8.99)
    product.valid?
    assert_not product.errors[:product_description].empty?
  end
end
