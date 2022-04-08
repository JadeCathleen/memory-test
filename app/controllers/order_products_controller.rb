class OrderProductsController < ApplicationController

  def index
    @total_revenue = 0
    OrderProduct.all.each do |order_product|
      @total_revenue += order_product.revenue
    end
    @average_by_order = @total_revenue / Order.count
    @customer_count = Customer.count
  end
end
