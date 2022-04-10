class OrderProductsController < ApplicationController

  def index
    @order_products = policy_scope(OrderProduct).includes(:order, :product) # get all order_products elements with orders and products to improve loading time
    @total_revenue = 0
    @countries = []
    @order_products.each do |order_product|
      @total_revenue += order_product.revenue #calculate the total revenu by sum of all order_products revenue
    end
    @average_by_order = @total_revenue / Order.count
    @customer_count = Customer.count
    @countries = Customer.all.pluck(:country).uniq # get the countries list
    # @orders.each {|order| @countries << order.customer.country}
    # @countries = @countries.uniq
  end
end
