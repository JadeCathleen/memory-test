class OrderProductsController < ApplicationController

  def index
    @order_products = policy_scope(OrderProduct).includes(:order, :product)
    @total_revenue = 0
    @countries = []
    @order_products.each do |order_product|
      @total_revenue += order_product.revenue
    end
    @average_by_order = @total_revenue / Order.count
    @customer_count = Customer.count
    @orders = policy_scope(Order).includes(:customer)
    @orders.each {|order| @countries << order.customer.country}
    @countries = @countries.uniq
  end
end
