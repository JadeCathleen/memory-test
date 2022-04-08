require 'csv'

if Rails.env.development?
  puts "Cleaning database..."
  OrderProduct.destroy_all
  Order.destroy_all
  User.destroy_all
  Customer.destroy_all
  Product.destroy_all
  puts 'Cleaning finished'
end
user = User.create(email: 'test@test.com', password: '123456')


csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

data_filepath = 'lib/seeds/memory-tech-challenge-data.csv'
i = 0
initial_time = Time.now
CSV.foreach(Rails.root.join(data_filepath), csv_options) do |row|
  i += 1
  # Create the customer - it will only be saved if customer code (customer_id in CSV) does not exist yet (validity unit test)
  customer = Customer.where(customer_code: row['customer_id']).first
  customer = Customer.create(customer_code: row['customer_id'], country: row['country']) if customer.nil?

  # Create the product - it will only be saved if product code does not exist yet (validity unit test)
  product = Product.where(product_code: row['product_code']).first
  product = Product.create(product_code: row['product_code'], product_description: row['product_description'], price: row['unit_price']) if product.nil?

  # Create the order - it will only be saved if order code (order_id in CSV) does not exist yet (validity unit test)
  order = Order.where(order_code: row['order_id']).first
  order = Order.create(order_code: row['order_id'], order_date: Time.new(row['date']), customer: customer, user: user) if order.nil?

  # Associate the order with the product - OrderProduct table
  order_product = OrderProduct.where(order: order, product: product).first

  OrderProduct.create(order: order, product: product, product_quantity: row['quantity']) if order_product.nil?

  puts "Reached line #{i} in #{Time.now - initial_time}" if (i % 1000).zero?
end
