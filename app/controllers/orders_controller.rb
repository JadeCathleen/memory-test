class OrdersController < ApplicationController
  def index
    @total_revenue = 0
    @orders = policy_scope(Order).includes(:order_product)
    # @orders.each do |order|
    #   order.order_products.each do |order_product|
    #     @total_revenue += order_product.revenue
    #   end
    # end
    # @average_by_order = @total_revenue / Order.count
    # @customer_count = Customer.count
    # revenue_per_month
  end

  # private

  # def revenue_per_month
  #   @revenue_by_month = []
  #   (1..12).to_a.each do |x|
  #     month_revenue = 0
  #     @orders.where('extract(month from order_date) = ?', x).each do |order|
  #       order.order_products.each do |order_product|
  #         month_revenue += order_product.revenue
  #       end
  #     end
  #     @revenue_by_month << month_revenue
  #   end
  # end
end
