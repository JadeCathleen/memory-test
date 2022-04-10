class OrderProductsFilterController < ApplicationController

  def index
    @customers = Customer.where(country: params[:countries]) # get the customers of the chosen country
    @orders = Order.where(customer: @customers) # get the orders associated with each customer
    @order_products = OrderProduct.where(order: @orders).includes(:order, :product) # get order_products associated with each order
    @total_revenue = 0
    @order_products.each do |order_product|
      @total_revenue += order_product.revenue # calculates total revenue for the chosen country
    end
    @average_by_order = @total_revenue / @orders.count # calculates average revenue by order for the chosen country
    @customer_count = @customers.count # calculates number of uniq customer for the chosen country
  end
end
