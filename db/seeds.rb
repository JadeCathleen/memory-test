# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

if Rails.env.development?
  puts "Cleaning database..."
  OrderProduct.destroy_all
  Order.destroy_all
  User.destroy_all
  Customer.destroy_all
  Product.destroy_all
end
user = User.create(email: 'test@test.com', password: '123456')

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
# Recipes seed

data_filepath = 'lib/seeds/memory-tech-challenge-data.csv'
CSV.foreach(data_filepath, csv_options) do |row|
  # Create the customer - it will only be saved if customer code (customer_id in CSV) does not exist yet (validity unit test)
  customer = Customer.create(customer_code: row['customer_id'], country: row['country'])
  if customer.save
    puts "Created Customer # #{customer.customer_code}"
  else
    customer = Customer.where(customer_code: row['customer_id']).first
  end

  # Create the product - it will only be saved if product code does not exist yet (validity unit test)
  product = Product.create(product_code: row['product_code'], product_description: row['product_description'], price: row['unit_price'])
  if product.save
    puts "Created Product # #{product.product_code}"
  else
    product = Product.where(product_code: row['product_code']).first
  end

  # Create the order - it will only be saved if order code (order_id in CSV) does not exist yet (validity unit test)
  order = Order.create(order_code: row['order_id'], order_date: Time.new(row['date']), customer: customer, user: user)
  if order.save
    puts "Created Order # #{order.order_code}"
  else
    order = Order.where(order_code: row['order_code']).first
  end

  # Associate the order with the product - OrderProduct table
  order_product = OrderProduct.create(order: order, product: product, product_quantity: row['quantity'])
  puts "Add Product # #{order_product.product.product_code} to Order # #{order_product.order.order_code}" if order_product.save
end
